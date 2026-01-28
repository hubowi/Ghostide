FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

ARG ANDROID_SDK_VERSION=9477386
ARG ANDROID_PLATFORM=android-34
ARG NDK_VERSION=25.2.9519653
ARG JAVA_VERSION=17
ARG GRADLE_VERSION=8.5

# 设置环境变量
ENV ANDROID_HOME=/opt/android-sdk \
    ANDROID_SDK_ROOT=/opt/android-sdk \
    JAVA_HOME=/usr/lib/jvm/java-${JAVA_VERSION}-openjdk-amd64 \
    GRADLE_USER_HOME=/workspaces/.gradle \
    PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools/bin:${JAVA_HOME}/bin

# 安装基础工具
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    unzip \
    zip \
    make \
    gcc \
    g++ \
    libgl1-mesa-glx \
    libglu1-mesa \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libxi6 \
    openjdk-${JAVA_VERSION}-jdk \
    openjdk-${JAVA_VERSION}-jre \
    && rm -rf /var/lib/apt/lists/*

# 安装 Gradle
RUN wget -q https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -O gradle.zip \
    && unzip -d /opt gradle.zip \
    && mv /opt/gradle-${GRADLE_VERSION} /opt/gradle \
    && rm gradle.zip \
    && ln -s /opt/gradle/bin/gradle /usr/local/bin/gradle

# 安装 Android SDK
RUN mkdir -p ${ANDROID_HOME}/cmdline-tools \
    && wget -q https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_SDK_VERSION}_latest.zip -O cmdline-tools.zip \
    && unzip -q cmdline-tools.zip -d ${ANDROID_HOME}/cmdline-tools \
    && mv ${ANDROID_HOME}/cmdline-tools/cmdline-tools ${ANDROID_HOME}/cmdline-tools/latest \
    && rm cmdline-tools.zip

# 接受 Android 许可证
RUN yes | ${ANDROID_HOME}/cmdline-tools/latest/bin/sdkmanager --licenses

# 设置权限
RUN chmod -R 755 ${ANDROID_HOME} \
    && chown -R vscode:vscode ${ANDROID_HOME}

# 切换到非root用户
USER vscode

# 验证安装
RUN echo "Java version:" && java -version \
    && echo "Gradle version:" && gradle --version
