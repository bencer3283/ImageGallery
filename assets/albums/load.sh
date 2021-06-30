#!/bin/zsh
for album in *
do
if [ -d "${album}" ]
then
test -e "load_album_${album}.dart" && rm "load_album_${album}.dart"
touch "load_album_${album}.dart"
echo "import 'package:flutter/material.dart';"  >> load_album_${album}.dart
echo "import 'album.dart';" >> load_album_${album}.dart

echo "var photoPath_${album} = [ " >> load_album_${album}.dart
for photo in ${album}/*
do 
if [ -f "${photo}" ]
then
echo "\"albums/${photo}\"," >> load_album_${album}.dart
fi
done
echo "];" >> load_album_${album}.dart

echo "var photoFullPath_${album} = [ " >> load_album_${album}.dart
for photo in ${album}/full/*
do
echo "\"albums/${photo}\"," >> load_album_${album}.dart
done
echo "];" >> load_album_${album}.dart

echo "var info_${album} = [ " >> load_album_${album}.dart
for photo in ${album}/full/*
do 
echo "[ ' ', ' ' ]," >> load_album_${album}.dart
done
echo "];" >> load_album_${album}.dart

echo "Album ${album} = Album(photoPath_${album}, photoFullPath_${album}, info_${album}, 'Title', 'EngTitle', 'Nav_Title', 'Description');" >> load_album_${album}.dart
fi
done
