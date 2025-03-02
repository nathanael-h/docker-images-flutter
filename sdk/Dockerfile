FROM ghcr.io/cirruslabs/android-sdk:34

LABEL org.opencontainers.image.source=https://github.com/nathanael-h/docker-images-flutter
USER root

ARG flutter_version=3.29.0

ENV FLUTTER_HOME=${HOME}/sdks/flutter \
    FLUTTER_VERSION=$flutter_version
ENV FLUTTER_ROOT=$FLUTTER_HOME

ENV PATH=${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin

RUN git clone --branch ${FLUTTER_VERSION} https://github.com/flutter/flutter.git ${FLUTTER_HOME} 
COPY patch.patch /root/patch.patch
RUN cd ${FLUTTER_HOME} && git apply /root/patch.patch

RUN yes | flutter doctor --android-licenses \
    && flutter doctor \
    && chown -R root:root ${FLUTTER_HOME}

RUN flutter precache --android
