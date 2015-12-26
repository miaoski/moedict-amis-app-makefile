#!/bin/bash
if [ $# -ne 1 ]; then
	echo "Usage: $0 [version]"
fi
ver=$1
cp -v moedict-amis/assets/www/cordova.js.orig moedict-amis/assets/www/cordova.js
apktool b -o moedict-amis-${ver}.apk moedict-amis
java -jar SignApk/signapk.jar cert.x509.pem private.pk8 moedict-amis-${ver}.apk moedict-amis-${ver}-signed.apk
