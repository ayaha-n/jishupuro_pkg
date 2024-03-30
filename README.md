# jishupuro_pkg

## How to use
To activate devices, do:
```
roscd jishupuro_pkg
cd scripts
./setup.sh
```
You can test if devices are activated by doing this:
```
rostopic pub -1 /eye_status std_msgs/UInt16 "data: 6"
```

Since Hume API can only be used in Python3.8, if your radxa's python version is different, you should do this:
```
cd ~/test_app
python3.8 -m venv test_app_venv
source test_app_venv/bin/activate
```
and do:
```
rosrun jishupuro_pkg topic_subscriber.py
```
To see the initial setup for python3.8 virtual environment, visit
https://www.linuxcapable.com/how-to-install-python-3-8-on-debian-linux/#google_vignette .

To launch a webpage, do these:
```
roslaunch roswww roswww.launch 
roslaunch rosbridge_server rosbridge_websocket.launch
```
Now, visit http://<radxa's ip>:8085/jishupuro_pkg/hume_control_getip.html and fill in the blank with your radxa's IP adress, press #Set IP Address" button.

You can start the program by pressing "Start Hume", and stop it by "Stop Hume".

## How to rename ports
These websites will help you to rename ports of the devices.
https://smdn.jp/electronics/udev_create_persistent_usb_device_symlink/ ,
https://docs.google.com/presentation/d/1990HMAx-kUocaGTCPdmen9bIHAOFU23R76boXbFtALY/edit#slide=id.g25e40fad838_2_50 (p13)
