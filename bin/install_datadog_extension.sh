#!/bin/sh

if [ -z $TARGETARCH ]; then
    echo "WARNING: Docker TARGETPLATFORM not defined. Using x86_64."
    TARGETARCH=x86_64
fi

if [ $TARGETARCH = "arm64" ]; then
    wget -O datadog-php-tracer.apk https://github.com/DataDog/dd-trace-php/releases/download/0.94.1/datadog-php-tracer_0.94.1_aarch64.apk
else
    wget -O datadog-php-tracer.apk https://github.com/DataDog/dd-trace-php/releases/download/0.94.1/datadog-php-tracer_0.94.1_x86_64.apk
fi

apk add --allow-untrusted datadog-php-tracer.apk
rm datadog-php-tracer.apk