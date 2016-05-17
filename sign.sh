#!/bin/bash -x
if [ $# -ne 2 ]; then
	echo "Usage: $0 [version] [dictname]"
	exit 1
fi
ver=$1
vint=`echo $1 | sed 's/[.]//g'`"00"
case $2 in
	"p") classname="moe_p"; dic="fey" ;;
	"m") classname="moe_m"; dic="poinsot" ;;
	"s") classname="moe_s"; dic="safolu" ;;
	*) echo "Wrong dictionary name."; exit 10 ;;
esac
lang=$2
cp strings-${lang}.xml moedict-amis/res/values/strings.xml
cat apktool.yml.in | sed "s/VER/$ver/g;s/VINT/$vint/g;s/DIC/$dic/g" > moedict-amis/apktool.yml
cat AndroidManifest.xml.in | sed "s/MOECLASSNAME/$classname/g" > moedict-amis/AndroidManifest.xml
cp -v moedict-amis/assets/www/cordova.js.orig moedict-amis/assets/www/cordova.js
apktool b -f -o moedict-amis-${dic}-${ver}.apk moedict-amis
java -jar SignApk/signapk.jar cert.x509.pem private.pk8 moedict-amis-${dic}-${ver}.apk moedict-amis-${dic}-${ver}-signed.apk
zipalign -f 4 moedict-amis-${dic}-${ver}-signed.apk moedict-amis-${dic}-${ver}-aligned.apk
echo "Upload moedict-amis-${dic}-${ver}-aligned.apk"
ls -l *${dic}-${ver}*.apk
