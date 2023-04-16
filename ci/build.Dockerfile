FROM alpine:latest

RUN addgroup -g 1000 -S app && \
    adduser -u 1000 -S app -G app

ENV FLUTTER_HOME=/home/flutter
ENV DART_HOME=$FLUTTER_HOME/bin/cache/dart-sdk/bin
ENV PUB_CACHE=/home/.pub-cache
ENV JUNIT_2_HTML_CACHE=/usr/local/.local/bin
ENV ANDROID_SDK_TOOLS=7302050 
ENV ANDROID_HOME=/usr/local/android-sdk
ENV GLIBC_VERSION=2.35-r0
ENV GIT_ASKPASS=/app/.git-askpass
ENV LANG "en_US.UTF-8"
ENV LANGUAGE "en_US.UTF-8"
ENV LC_ALL "en_US.UTF-8"

ENV PATH=/usr/local/android-sdk/cmdline-tools/latest/bin:/usr/local/android-sdk/platform-tools:/usr/local/android-sdk/tools/bin:$FLUTTER_HOME/bin:$DART_HOME:$PUB_CACHE/bin:$JUNIT_2_HTML_CACHE:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

#ARG COCOAPOD_VERSION="1.11.3"

##INSTALL BASE
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk update && apk upgrade && apk add --no-cache sudo bash curl file git gzip tar xz mesa-gl openjdk11 lcov wget unzip gcompat libexif udev chromium chromium-chromedriver
ENV PYTHONUNBUFFERED=1

##INSTALL GLIBC
WORKDIR /usr/local/glibc
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk && \
    apk add --force-overwrite glibc-${GLIBC_VERSION}.apk glibc-bin-${GLIBC_VERSION}.apk && \
    mkdir ${ANDROID_HOME}

##INSTALL ANDROID-SDK
WORKDIR $ANDROID_HOME/cmdline-tools
RUN wget -q -O sdk.zip https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_SDK_TOOLS}_latest.zip && \
    unzip -q sdk.zip && \
    mv cmdline-tools latest && \
    mkdir -p /root/.android && \
    touch /root/.android/repositories.cfg && \
    rm sdk.zip

WORKDIR $ANDROID_HOME
RUN echo y | sdkmanager "platforms;android-31" "build-tools;29.0.2" >/dev/null
RUN yes | sdkmanager --licenses

##INSTALL PYTHON
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN pip3 install junit2html


HEALTHCHECK NONE

RUN mkdir /app
RUN mkdir /home/flutter
RUN chmod 777 -R /app
RUN chmod 777 -R /home/app
RUN chmod 777 -R /home/flutter
RUN chmod 777 -R /home

RUN touch $GIT_ASKPASS
RUN chmod 777 -R $GIT_ASKPASS

WORKDIR /home/flutter
ARG FLUTTER_VERSION=3.7.9
RUN curl https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz --output flutter.tar.xz && tar xf flutter.tar.xz --strip-components=1 && rm flutter.tar.xz

RUN git config --global --add safe.directory /home/flutter
RUN flutter doctor
RUN flutter pub global activate junitreport
RUN flutter doctor --android-licenses
ENV HOME /home/app

USER app
WORKDIR /app