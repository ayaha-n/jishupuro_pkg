#!/bin/bash

# スクリプトを実行するディレクトリに移動する（必要に応じて変更）
cd ~/catkin_ws/src/jishupuro_pkg
# launch ファイルを実行
roslaunch jishupuro_pkg capture.launch &
#bash ~/rcb4eus/radxa/speak-jp/run-speak-jp.shの内容
#MACアドレスを指定
roslaunch stereo_image_sandbox speech_recognition_radxa.launch device:="\"bluealsa:DEV=64:B7:08:82:B6:12,PROFILE=a2dp\"" &

# 各シリアルノードを実行
# ポート名はあらかじめ固定しておく
rosrun rosserial_python serial_node.py _port:=/dev/ttyACM-righteye _baud:=57600 __name:=b &
rosrun rosserial_python serial_node.py _port:=/dev/ttyACM-lefteye _baud:=57600 __name:=a &
rosrun rosserial_python serial_node.py _port:=/dev/ttyACM-m5stack _baud:=57600 __name:=c &

# launch the webpage
roslaunch roswww roswww.launch &
roslaunch rosbridge_server rosbridge_websocket.launch &

# bluetoothスピーカの立ち上げ
# python ~/rcb4eus/radxa/speak-jp/make_green.pyの内容
#MACアドレスを指定
# Pythonプログラムを実行してブロックする
python3 -c "
from bluezero import adapter
from bluezero import device

dongles = adapter.list_adapters()
print('dongles available: ', dongles)
dongle = adapter.Adapter(dongles[0])
tmp = device.Device(dongle.address, '64:B7:08:82:B6:12')
tmp.connect()
"



# 待機してすべてのプロセスが終了するまで待つ
wait






