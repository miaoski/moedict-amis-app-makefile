#!/bin/bash
# Copy from moedict-amis (amis-react branch) to make a new APK

src="/Users/philippe/github/moedict-webkit"
dst="/Users/philippe/github/apk-amis/moedict-amis/assets/www"

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
rm -fr pmck
cp -av "$src/images" .
cp -av "$src/js" .
cp -av "$src/fonts" .
cp -av "$src/css" .
cp -av "$src/ppck" .
cp -av "$src/pmck" .
cp -v "$src/p/index.json" ./p/index.1.json
cp -v "$src/m/index.json" ./m/index.1.json
