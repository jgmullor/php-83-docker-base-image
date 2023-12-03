#!/bin/sh

if [ -z $TARGETPLATFORM ]; then
    echo "WARNING: Docker TARGETARCH not defined. Using x86_64."
    TARGETPLATFORM=x86_64
fi

if [ $TARGETPLATFORM = "arm64" ]; then
    wget -O datadog-php-tracer.apk https://github.com/DataDog/dd-trace-php/releases/download/0.94.1/datadog-php-tracer_${DD_AGENT_VERSION}_aarch64.apk
else
    wget -O datadog-php-tracer.apk https://github.com/DataDog/dd-trace-php/releases/download/0.94.1/datadog-php-tracer_${DD_AGENT_VERSION}_x86_64.apk
fi

apk add --allow-untrusted datadog-php-tracer.apk
rm datadog-php-tracer.apk