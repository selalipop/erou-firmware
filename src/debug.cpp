#include "debug.h"
#include "fmt/format.h"
#include "fmt/printf.h"
#include <FreeRTOS.h>

Debug DebugInstance = Debug();

Debug::Debug()
{
    messageAcessSemaphore = xSemaphoreCreateMutex();
    xTaskCreate(
        messageBroadcastTaskWrapper,   // Function that should be called
        "Websocket Debug Task",        // Name of the task (for debugging)
        config::debug::wsTaskStack,    // Stack size (bytes)
        this,                          // Parameter to pass
        config::debug::wsTaskPriority, // Task priority
        &messageLoopHandle             // Task handle
    );
}

void Debug::printMessage(DebugLevel level, fmt::CStringRef format, fmt::ArgList args)
{
    std::string formattedString = fmt::sprintf(format, args);
    DebugMessage message;
    message.content = formattedString;
    message.level = level;

    if (xSemaphoreTake(messageAcessSemaphore, pdMS_TO_TICKS(10)) == pdTRUE)
    {
        if (messages.size() > maxMessageCount)
        {
            messages.pop_back();
        }
        messages.push_front(message);
        xSemaphoreGive(messageAcessSemaphore);
    }
    xTaskNotifyGive(messageLoopHandle);
}

void Debug::messageBroadcastTaskWrapper(void *_this)
{
    static_cast<Debug *>(_this)->messageBroadcastTask();
}

void Debug::messageBroadcastTask()
{
    for (;;)
    {
        ulTaskNotifyTake(pdTRUE, portMAX_DELAY);
        if (xSemaphoreTake(messageAcessSemaphore, portMAX_DELAY) == pdTRUE)
        {
            std::list<DebugMessage> unsentMessages(messages);

            messages.clear();

            xSemaphoreGive(messageAcessSemaphore);

            for (DebugMessage message : messages)
            {
                if (message.level >= loggingLevel)
                {
                    webSocket.broadcastTXT(message.content.c_str());
                    Serial.println(message.content.c_str());
                }
            }
        }
    }
}
void Debug::handleWsEvent(uint8_t num, WStype_t type, uint8_t *payload, size_t length)
{

    switch (type)
    {
    case WStype_DISCONNECTED:
        Serial.printf("Debug Websocket Client Disconnected: [%u]\n", num);
        break;
    case WStype_CONNECTED:
    {
        IPAddress ip = webSocket.remoteIP(num);
        Serial.printf("Debug Websocket Client Connected: [%u] %d.%d.%d.%d url: %s\n", num, ip[0], ip[1], ip[2], ip[3], payload);

        webSocket.sendTXT(num, "Erou Debug Session:");
    }
    break;
    case WStype_TEXT:
        Serial.printf("Debug Websocket Client Sent Text: [%u] %s\n", num, payload);
        break;
    case WStype_BIN:
        Serial.printf("Debug Websocket Client Sent Binary: [%u] binary length: %u\n", num, length);
        break;
    default:
        break;
    }
}

void Debug::setup()
{

    webSocket.begin();
    webSocket.onEvent([this](uint8_t num, WStype_t type, uint8_t *payload, size_t length)
                      { handleWsEvent(num, type, payload, length); });
}
void Debug::loop()
{
    webSocket.loop();
}