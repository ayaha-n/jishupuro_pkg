# jishupuro_pkg
This package enables you to demonstrate "denden-mushi", which picks up the sound with the microphone, analyzes the emotion using HUME API and expresses it with its eyes and cheek color.

## Supported devices
* M5Stack用NeoPixel互換LED搭載 HEXボード: https://www.switch-science.com/products/6058?_pos=1&_sid=04326fe49&_ss=r
* radxa zero
* ReSpeaker 4 Mic Array (UAC1.0)
* M5 ATOM ECHO
* M5Stack Fire
* Round Display Module with M5Stamp C3 (pio env name: stampc3) : https://www.switch-science.com/products/8098

## How to use
To activate devices and launch the webpage, do:
```
roscd jishupuro_pkg
cd scripts
./setup.sh
```
You may need to do this:
```
sudo apt-get install ros-noetic-roswww
cd ~/catkin_ws/src
git clone --single-branch -b stereo-semi https://github.com/iory/jsk_demos
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

Now, visit http://<radxa's ip>:8085/jishupuro_pkg/hume_control_getip.html and fill in the blank with your radxa's IP adress, press "Set IP Address" button.
Note that it may doesn't work on Chrome and please try on Safari in that case. (2024.5.9)

You can start the program by pressing "Start Hume", and stop it by "Stop Hume".

## Setting your HUME API key
Get your API key at https://dev.hume.ai/intro

```
nano ~/.bashrc
```
Append `export HUME_API="your_api_key"`
```
source ~/.bashrc
```

## How to rename ports
These websites will help you to rename ports of the devices.
* https://smdn.jp/electronics/udev_create_persistent_usb_device_symlink/ ,
* https://docs.google.com/presentation/d/1990HMAx-kUocaGTCPdmen9bIHAOFU23R76boXbFtALY/edit#slide=id.g25e40fad838_2_50 (p13)

## Tips
write
`source ~/catkin_ws/devel/setup.bash` in bashrc so that you do not need to do it every time.

## References
* https://gist.github.com/iory/59828a5f23969f81ee81e6c5a89a41c6 , 
* https://github.com/sawada10/eye-display
