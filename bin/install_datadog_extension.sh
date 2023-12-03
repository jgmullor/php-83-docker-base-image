#!/bin/sh

if [ `arch` = "arm64" ]; then
    echo "Using ARM64 version of Datadog"
    wget -O datadog-php-tracer.apk https://github.com/DataDog/dd-trace-php/releases/download/0.94.1/datadog-php-tracer_0.94.1_aarch64.apk
else
    echo "Using ARM64 version of Datadog"
    wget -O datadog-php-tracer.apk https://github.com/DataDog/dd-trace-php/releases/download/0.94.1/datadog-php-tracer_0.94.1_x86_64.apk
fi

apk add --allow-untrusted datadog-php-tracer.apk
rm datadog-php-tracer.apk