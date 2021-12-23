# toit_node

This is a simple weather station IoT node based on the [Bosch BME280 sensor](https://www.bosch-sensortec.com/products/environmental-sensors/humidity-sensors-bme280/), publishing via [MQTT](https://mqtt.org/).

This example is an implementation of the [Toit](https://toit.io/) langugage - a way to manage containers on [ESP32 hardware](https://www.espressif.com/en/products/socs/esp32).

## Installation

To get setup with Toit, follow their [simple guide](https://docs.toit.io/getstarted/installation).

Clone this repo and sign into Toit.

## Setup

### Provision new hardware

```bash
toit serial provision -p wifi.ssid="MY_SSID" -p wifi.password="my_password"

```

### Deploy

```bash
toit deploy weather_station.yaml

```

# Contact

For support on this project or just to say hi, get in touch via:

- [listt.io](https://listt.io/)
- [Kristof Hayes](https://www.kristofhayes.me/)
