# 使用官方Ubuntu镜像
FROM ubuntu:22.04

# 设置非交互式环境
ENV DEBIAN_FRONTEND=noninteractive

# 安装基础工具和Java
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    unzip \
    zip \
    openjdk-17-jdk \
    openjdk-17-jre \
    && rm -rf /var/lib/apt/lists/*

# 创建vscode用户
RUN useradd -m -s /bin/bash vscode && \
    usermod -aG sudo vscode && \
    echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 切换到vscode用户
USER vscode
WORKDIR /home/vscode

# 设置环境变量
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="$JAVA_HOME/bin:$PATH"
ENV ANDROID_HOME=/home/vscode/android-sdk
ENV PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"

# 安装Android SDK
RUN mkdir -p $ANDROID_HOME && cd $ANDROID_HOME && \
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip -O cmdline-tools.zip && \
    unzip -q cmdline-tools.zip && \
    mkdir -p cmdline-tools/latest && \
    mv cmdline-tools/* cmdline-tools/latest/ && \
    rm cmdline-tools.zip

# 安装Gradle
ARG GRADLE_VERSION=8.5
RUN wget -q https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -O gradle.zip && \
    unzip -d /home/vscode gradle.zip && \
    rm gradle.zip && \
    mv /home/vscode/gradle-${GRADLE_VERSION} /home/vscode/gradle
ENV PATH="/home/vscode/gradle/bin:$PATH"

# 创建必要的目录
RUN mkdir -p /home/vscode/.android && \
    touch /home/vscode/.android/repositories.cfg && \
    mkdir -p /home/vscode/.gradle

WORKDIR /workspace
