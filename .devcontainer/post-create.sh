#!/bin/bash
echo "设置Android开发环境..."

# 接受所有Android许可证
yes | sdkmanager --licenses

# 安装必要的Android组件
sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0"

# 创建gradle属性文件（如果需要代理）
mkdir -p ~/.gradle
cat > ~/.gradle/gradle.properties << EOF
org.gradle.jvmargs=-Xmx4096m -XX:MaxPermSize=1024m -XX:+HeapDumpOnOutOfMemoryError -Dfile.encoding=UTF-8
android.useAndroidX=true
android.enableJetifier=true
EOF

echo "环境设置完成！"
