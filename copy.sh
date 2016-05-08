#!/bin/bash
# Copy from moedict-amis (amis-react branch) to make a new APK

src="/home/ljm/github/moedict-webkit"
dst="/home/ljm/github/apk-amis/moedict-amis/assets/www"

# cd $src
# gulp build

cd $dst || exit 10
cp -v "$src/about.html" .
cp -v "$src/index.html" .
cp -v "$src/main.ls" .
cp -v "$src/view.ls" .
cp -v "$src/styles.css" .
for lang in p m s; do
	mkdir -p $lang
	cp -v "$src/$lang/revdict-amis-def.txt" ./$lang/
	cp -v "$src/$lang/revdict-amis-ex.txt" ./$lang/
	cp -v "$src/$lang/index.json" ./$lang/index.1.json
done
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
cp -av "$src/psck" .
