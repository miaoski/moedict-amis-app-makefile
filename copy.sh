#!/bin/bash
# Copy from moedict-amis (amis-react branch) to make a new APK

if [ $# -ne 1 ]; then
	echo "Usage: $0 <p|m|s>"
	exit 10
fi

src="/home/ljm/github/moedict-webkit"
dst="/home/ljm/github/apk-amis/moedict-amis/assets/www"

cd $src
cp main.ls main.ls.bak
perl -i -pe 's/^###APP###.*/window.STANDALONE = \\'$1'/g' main.ls
gulp build

cd $dst || exit 10
cp -v "$src/about.html" .
cp -v "$src/index.html" .
cp -v "$src/main.ls" .
cp -v "$src/view.ls" .
cp -v "$src/styles.css" .
lsc -c main.ls
lsc -c view.ls
mv $src/main.ls.bak $src/main.ls

rm -fr images
rm -fr js
rm -fr fonts
rm -fr css
rm -fr ppck pmck psck
rm -fr p m s
lang=$1
mkdir -p $lang
cp -v "$src/$lang/revdict-amis-def.txt" ./$lang/
cp -v "$src/$lang/revdict-amis-ex.txt" ./$lang/
cp -v "$src/$lang/index.json" ./$lang/index.1.json
cp -av "$src/images" .
cp -av "$src/js" .
cp -av "$src/fonts" .
cp -av "$src/css" .
cp -av "$src/p${lang}ck" .
:> ./$lang/index.2.json
:> ./$lang/xref.json
echo '[]' > ./$lang/=.json
