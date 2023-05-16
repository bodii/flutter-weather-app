#!/bin/bash

# 密码
# android

# generate keystore
keytool -genkey -v -keystore debug.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key

# view keystore
keytool -list -keystore debug.jks  -v