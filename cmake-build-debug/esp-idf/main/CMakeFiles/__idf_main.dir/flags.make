# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

# compile CXX with /Users/oak/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++
CXX_DEFINES = -DHAVE_CONFIG_H -DMBEDTLS_CONFIG_FILE=\"mbedtls/esp_config.h\"

CXX_INCLUDES = -I/Users/oak/Development/erou-firmware-esp32/cmake-build-debug/config -I/Users/oak/esp/esp-idf/components/newlib/platform_include -I/Users/oak/esp/esp-idf/components/freertos/include -I/Users/oak/esp/esp-idf/components/freertos/port/xtensa/include -I/Users/oak/esp/esp-idf/components/esp_hw_support/include -I/Users/oak/esp/esp-idf/components/esp_hw_support/include/soc -I/Users/oak/esp/esp-idf/components/esp_hw_support/port/esp32/. -I/Users/oak/esp/esp-idf/components/heap/include -I/Users/oak/esp/esp-idf/components/log/include -I/Users/oak/esp/esp-idf/components/lwip/include/apps -I/Users/oak/esp/esp-idf/components/lwip/include/apps/sntp -I/Users/oak/esp/esp-idf/components/lwip/lwip/src/include -I/Users/oak/esp/esp-idf/components/lwip/port/esp32/include -I/Users/oak/esp/esp-idf/components/lwip/port/esp32/include/arch -I/Users/oak/esp/esp-idf/components/soc/include -I/Users/oak/esp/esp-idf/components/soc/esp32/. -I/Users/oak/esp/esp-idf/components/soc/esp32/include -I/Users/oak/esp/esp-idf/components/hal/esp32/include -I/Users/oak/esp/esp-idf/components/hal/include -I/Users/oak/esp/esp-idf/components/esp_rom/include -I/Users/oak/esp/esp-idf/components/esp_rom/esp32 -I/Users/oak/esp/esp-idf/components/esp_common/include -I/Users/oak/esp/esp-idf/components/esp_system/include -I/Users/oak/esp/esp-idf/components/esp_system/port/soc -I/Users/oak/esp/esp-idf/components/esp_system/port/public_compat -I/Users/oak/esp/esp-idf/components/esp32/include -I/Users/oak/esp/esp-idf/components/driver/include -I/Users/oak/esp/esp-idf/components/driver/esp32/include -I/Users/oak/esp/esp-idf/components/esp_pm/include -I/Users/oak/esp/esp-idf/components/esp_ringbuf/include -I/Users/oak/esp/esp-idf/components/efuse/include -I/Users/oak/esp/esp-idf/components/efuse/esp32/include -I/Users/oak/esp/esp-idf/components/xtensa/include -I/Users/oak/esp/esp-idf/components/xtensa/esp32/include -I/Users/oak/esp/esp-idf/components/vfs/include -I/Users/oak/esp/esp-idf/components/esp_wifi/include -I/Users/oak/esp/esp-idf/components/esp_event/include -I/Users/oak/esp/esp-idf/components/esp_netif/include -I/Users/oak/esp/esp-idf/components/esp_eth/include -I/Users/oak/esp/esp-idf/components/tcpip_adapter/include -I/Users/oak/esp/esp-idf/components/esp_phy/include -I/Users/oak/esp/esp-idf/components/esp_phy/esp32/include -I/Users/oak/esp/esp-idf/components/app_trace/include -I/Users/oak/esp/esp-idf/components/esp_timer/include -I/Users/oak/Development/erou-firmware-esp32/components/arduino/variants/esp32 -I/Users/oak/Development/erou-firmware-esp32/components/arduino/cores/esp32 -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/ArduinoOTA/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/AsyncUDP/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/BLE/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/BluetoothSerial/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/DNSServer/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/EEPROM/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/ESP32/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/ESPmDNS/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/FFat/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/FS/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/HTTPClient/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/HTTPUpdate/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/LITTLEFS/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/NetBIOS/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/Preferences/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/RainMaker/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/SD_MMC/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/SD/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/SimpleBLE/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/SPIFFS/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/SPI/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/Ticker/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/Update/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/WebServer/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/WiFiClientSecure/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/WiFi/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/WiFiProv/src -I/Users/oak/Development/erou-firmware-esp32/components/arduino/libraries/Wire/src -I/Users/oak/esp/esp-idf/components/spi_flash/include -I/Users/oak/esp/esp-idf/components/mbedtls/port/include -I/Users/oak/esp/esp-idf/components/mbedtls/mbedtls/include -I/Users/oak/esp/esp-idf/components/mbedtls/esp_crt_bundle/include -I/Users/oak/esp/esp-idf/components/mdns/include -I/Users/oak/esp/esp-idf/components/console -I/Users/oak/esp/esp-idf/components/esp_adc_cal/include -I/Users/oak/esp/esp-idf/components/wifi_provisioning/include -I/Users/oak/esp/esp-idf/components/protocomm/include/common -I/Users/oak/esp/esp-idf/components/protocomm/include/security -I/Users/oak/esp/esp-idf/components/protocomm/include/transports -I/Users/oak/esp/esp-idf/components/nvs_flash/include -I/Users/oak/esp/esp-idf/components/nghttp/port/include -I/Users/oak/esp/esp-idf/components/nghttp/nghttp2/lib/includes -I/Users/oak/esp/esp-idf/components/esp_ipc/include -I/Users/oak/Development/erou-firmware-esp32/components/external-libraries/MoodyQueue/src -I/Users/oak/Development/erou-firmware-esp32/components/external-libraries/ESPAsyncWebServer/src -I/Users/oak/Development/erou-firmware-esp32/components/external-libraries/AccelStepper/src -I/Users/oak/Development/erou-firmware-esp32/components/external-libraries/StepperDriver/src -I/Users/oak/Development/erou-firmware-esp32/components/external-libraries/fmt -I/Users/oak/Development/erou-firmware-esp32/components/external-libraries/TMCStepper/src -I/Users/oak/Development/erou-firmware-esp32/components/external-libraries/AsyncTCP/src

CXX_FLAGS = -mlongcalls -Wno-frame-address -ffunction-sections -fdata-sections -Wall -Werror=all -Wno-error=unused-function -Wno-error=unused-variable -Wno-error=deprecated-declarations -Wextra -Wno-unused-parameter -Wno-sign-compare -ggdb -Og -fmacro-prefix-map=/Users/oak/Development/erou-firmware-esp32=. -fmacro-prefix-map=/Users/oak/esp/esp-idf=IDF -fstrict-volatile-bitfields -Wno-error=unused-but-set-variable -std=gnu++11 -fno-exceptions -fno-rtti -D_GNU_SOURCE -DIDF_VER=\"v4.4-dev-1594-g1d7068e4b\" -DESP_PLATFORM -DARDUINO=10812 -DARDUINO_ESP32_DEV -DARDUINO_ARCH_ESP32 -DARDUINO_BOARD=\"ESP32_DEV\" -DARDUINO_VARIANT=\"esp32\" -DESP32

