/**
Program measuring temperature, relative humidity, and atmospheric pressure
  with a BME280.
*/

import net
import mqtt
import gpio
import i2c
import bme280
import encoding.json

CLIENT_ID ::= "toit-client"
HOST      ::= "192.168.80.74"
PORT      ::= 1883
TOPIC     ::= "test"

main:
  bus := i2c.Bus
    --sda=gpio.Pin 21
    --scl=gpio.Pin 22

  device := bus.device 0x76

  driver := bme280.Driver device

  socket := net.open.tcp_connect HOST PORT
  // Connect the Toit MQTT client to the broker
  client := mqtt.Client
    CLIENT_ID
    mqtt.TcpTransport socket

  // The client is now connected.
  print "Connected to MQTT Broker @ $HOST:$PORT"
  // Start publishing on a topic.
  

  while true:
    print "Temperature: $driver.read_temperature C"
    print "Humidity: $driver.read_humidity %"
    print "Pressure: $driver.read_pressure Pa"

    publish client driver.read_temperature driver.read_humidity driver.read_pressure

    sleep --ms=10000


publish client/mqtt.Client payload1/float payload2/float payload3/float:
  // Publish message to topic
  client.publish
    TOPIC 
    json.encode {
      "Temperature (C)": payload1,
      "Humidity (%)": payload2,
      "Pressure (Pa)": payload3
    }
  print "Published message new sensor reading on '$TOPIC', speeling for 10s"  
