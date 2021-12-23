import net
import mqtt
import gpio
import i2c
import bme280
import encoding.json

CLIENT_ID ::= "toit-node"
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

  client := mqtt.Client
    CLIENT_ID
    mqtt.TcpTransport socket

  print "Setup complete. Connected to MQTT Broker @ $HOST:$PORT"

  while true:
    print "Temperature: $driver.read_temperature C"
    print "Humidity: $driver.read_humidity %"
    print "Pressure: $driver.read_pressure Pa"

    publish client driver.read_temperature driver.read_humidity driver.read_pressure

    sleep --ms=10000

publish client/mqtt.Client payload1/float payload2/float payload3/float:
  client.publish
    TOPIC 
    json.encode {
      "Temperature (C)": payload1,
      "Humidity (%)": payload2,
      "Pressure (Pa)": payload3,
      "Timestamp": Time.now.local.to_iso8601_string
    }
  print "Published message new sensor reading on '$TOPIC', speeling for 10s"  
