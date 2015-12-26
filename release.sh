#!/bin/bash
if [ $# -ne 1 ]; then
	echo "Usage: $0 [version]"
	exit 1
fi
ver="$1"
./zipalign -f 4 moedict-amis-${ver}-signed.apk moedict-amis-${ver}-aligned.apk
echo "Don't forget to modify moedict-amis/apktool.yml"
echo "Upload moedict-amis-${ver}-aligned.apk"
