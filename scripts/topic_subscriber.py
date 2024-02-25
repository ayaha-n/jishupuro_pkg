#!/usr/bin/env python3

import rospy
from std_msgs.msg import String, UInt16
import subprocess

# プロセス変数をグローバルで定義
process = None

def topic_callback(msg):
    global process  # グローバル変数を参照することを明示
    # トピックのメッセージに応じてPythonスクリプトを制御
    if msg.data == "start_hume":
        # subprocessモジュールなどを使用してPythonスクリプトを実行する
        # Pythonスクリプトを起動するコマンド
        command = ['python3', '/home/rock/catkin_ws/src/jishupuro_pkg/scripts/hume_sound_denden.py']
        # subprocessモジュールを使用してPythonスクリプトを起動する

        process = subprocess.Popen(command)
    elif msg.data == "stop_hume":
        if process is not None:
        # hume_sound_ros_radxa.pyの停止
        # subprocessモジュールなどを使用してPythonスクリプトを終了する
            process.terminate()
            eye_status_pub = rospy.Publisher('/eye_status', UInt16, queue_size=1)
            eye_status_pub.publish(UInt16(0))

        
def main():
    rospy.init_node('topic_subscriber')
    rospy.Subscriber('control_topic', String, topic_callback)
    rospy.spin()

if __name__ == '__main__':
    main()
