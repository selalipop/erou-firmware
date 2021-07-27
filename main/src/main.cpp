#include "SPIFFS.h"
#include "Arduino.h"
#include "freertos/task.h"
#include "config_constants.h"
#include "wsdebug.h"
#include "esp32-hal.h"
#include "esp_wifi.h"
#include "motion.h"
#include "ota/ota.h"
#include "ota/ota_credentials.h"
#include "pins.h"
#include <containerManager.h>
#include <api.h>
#include <requestUtil.h>
#include "mongoose.h"
#include "commands.h"
#include "easymongoose.h"

TMC2130Stepper driver(pins::stepper::cs);

ESP_FlexyStepper stepper;

Motion motion = Motion(&driver, &stepper); // NOLINT(cppcoreguidelines-slicing)
ContainerManager containerManager = ContainerManager(&storedSettings);
Api api = Api(&containerManager);

void setupWebServer();
void setupDebug();
void setupTimezone();

void setupWifi() {
  Serial.begin(config::serial::baud);
  WiFiClass::mode(WIFI_STA);
  // Helps manage wifi tx power
  esp_wifi_set_max_tx_power(34);
  esp_wifi_set_ps(WIFI_PS_NONE);
  WiFi.begin(ssid, password);

  while (WiFi.waitForConnectResult() != WL_CONNECTED) {
    debugV("setting up wifi");
    delay(5000);
    ESP.restart();
  }
}

extern "C" {
void app_main(void) {
  initArduino();
  setup();
}
}

void setup() {
  pins::setup();
  setupWifi();
  SPIFFS.begin(true);
  storedSettings.setup();

  setupTimezone();

  Ota::setup();
  setupDebug();
  setupWebServer();

  debugI("setting up container manager");
  containerManager.setup();

  debugI("setting up motion");
  motion.setup();
}
void setupTimezone() {
  const char *timezoneSettingsKey = "config/timezone";
  auto storedTimezone = storedSettings.get<JsonVariant>(timezoneSettingsKey);
  if (storedTimezone.is<const char *>()) {
    configTzTime(storedTimezone.as<const char *>(), config::network::ntpServer);
  }
}

void setupDebug() {
  debugInstance.setup();
  DebugCommands::setup(&motion);
}

void setupWebServer() {
  em::setup(config::network::hostname);
  api.setup();
}