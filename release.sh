#!/bin/bash
./zipalign 4 moedict-amis-${ver}-signed.apk moedict-amis-${ver}-aligned.apk
echo "Don't forget to modify moedict-amis/apktool.yml"
