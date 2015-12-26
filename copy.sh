#!/bin/bash
# Copy from moedict-amis (amis-react branch) to make a new APK

if [ $# -ne 2 ]; then
	echo "Usage: $0 [path-to-moedict-amis] [path-to-new-apk]"
	exit 1
fi

pushd .
cd "$1"
src="`pwd`"
popd
pushd .
cd "$2/assets/www"
dst="`pwd`"
popd

cd $src
make js/deps.js

cd $dst
cp -v "$src/about.html" .
cp -v "$src/index.html" .
cp -v "$src/main.ls" .
cp -v "$src/view.ls" .
cp -v "$src/revdict-amis-def.txt" .
cp -v "$src/revdict-amis-ex.txt" .
lsc -c main.ls
lsc -c view.ls
rm -fr images
rm -fr js
rm -fr fonts
rm -fr css
rm -fr ppck
cp -av "$src/images" .
cp -av "$src/js" .
cp -av "$src/fonts" .
cp -av "$src/css" .
cp -v "$1/p/index.json" ./p/index.1.json
cp -av "$src/ppck" .
