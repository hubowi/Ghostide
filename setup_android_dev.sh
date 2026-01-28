#!/bin/bash
# 保存为 setup_android_dev.sh，然后运行：chmod +x setup_android_dev.sh && ./setup_android_dev.sh

echo "安装Java JDK 17..."
sudo apt update
sudo apt install -y openjdk-17-jdk

echo "安装Android Studio..."
sudo snap install android-studio --classic

echo "安装Android SDK依赖..."
sudo apt install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

echo "安装adb和fastboot..."
sudo apt install -y adb fastboot

echo "设置环境变量..."
echo 'export ANDROID_HOME=$HOME/Android/Sdk' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/tools' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> ~/.bashrc
source ~/.bashrc

echo "安装完成！请启动Android Studio完成SDK配置。"
