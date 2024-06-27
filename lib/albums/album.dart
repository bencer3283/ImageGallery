import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../gdrive.dart';
import '../apikey.dart';

Stream<Album> constructAlbumStream(list) async* {
  for (final album in list) {
    final folderContent = await listFolderContents(album['id']);
    final albumInfo = await getAlbumInfo(album['id']);
    yield Album.gdrive(folderContent, albumInfo);
  }
  return;
}

void main() async {
  List<Album> gallery = [];
  final albumList = await listAlbums();
  final albumsStream = constructAlbumStream(albumList);
  await for (final album in albumsStream) {
    print("event: " + album.title + ' added');
    gallery.add(album);
  }
  final uk = gallery[0];
  print(uk.title +
      '\n' +
      uk.titleEng +
      '\n' +
      uk.subtitle +
      '\n' +
      uk.description +
      '\n');
  print(uk.photos.length);
  uk.photos.forEach((element) {
    print(element.des + '\n' + element.par);
  });
  return;
}

class Album {
  Album(List<String> path, List<String> pathFull, List<List<String>> des_exp,
      String t, String te, String s, String des) {
    for (String p in path) {
      photos.add(Photo(p));
    }
    for (String p in pathFull) {
      //photosFull.add(Photo(p));
    }
    for (int i = 0; i < des_exp.length; i++) {
      photos[i].des = des_exp[i][0];
      photos[i].par = des_exp[i][1];
    }
    title = t;
    titleEng = te;
    subtitle = s;
    description = des;
  }

  Album.gdrive(List folderContent, String folderInfo) {
    List infos = folderInfo.split(',; ');
    if (infos.length == 4) {
      this.title = infos[0];
      this.titleEng = infos[1];
      this.subtitle = infos[2];
      this.description = infos[3];
    }
    for (final file in folderContent) {
      if (file['mimeType'] == 'image/jpeg' || file['mimeType'] == 'image/jpg') {
        if (file['metadata'] != 'na') {
          final exposureTime = file['metadata']['exposureTime'] ?? '';
          double shutter;
          try {
            shutter = 1 / double.parse(exposureTime.toString());
          } catch (e) {
            shutter = 0.1;
          }
          final shutterStr = "1/${shutter.round()}";
          final apertureStr = "f/${file['metadata']['aperture'] ?? ''}";
          final cameraStr = "${file['metadata']['cameraMake'] ?? ''}" +
              ' ' +
              "${file['metadata']['cameraModel']}";
          this.photos.add(Photo.gdrive(file['id'], file['thumbnail'])
            ..des = file['description'] ?? ''
            ..par = shutterStr + ', ' + apertureStr + ', ' + cameraStr);
        } else {
          this.photos.add(Photo.gdrive(file['id'], file['thumbnail'])
            ..des = file['description'] ?? '');
        }
      }
    }
  }

  List<Photo> photos = [];
  List<List<String>> strings = [];

  String title = '';
  String titleEng = '';
  String subtitle = '';
  String description = '';

  List<Image> get photosList {
    List<Image> image = [];
    for (int i = 0; i < photos.length; i++) {
      image.add(photos[i].thumbnail);
    }
    return image;
  }

  List<FadeInImage> get photosFullList {
    List<FadeInImage> image = [];
    for (int i = 0; i < photos.length; i++) {
      image.add(photos[i].fullResPhoto);
    }
    return image;
  }
}

class Photo {
  late Image thumbnail;
  late FadeInImage fullResPhoto;
  String des = ' ';
  String par = ' ';

  Photo(String path) {
    this.thumbnail = Image.asset(path);
  }

  Photo.gdrive(String id, String thumbnailLink) {
    final thumbnailLinkSegments = thumbnailLink.split('s220');
    this.thumbnail = Image.network(
      thumbnailLinkSegments[0] + 's1440',
      fit: BoxFit.contain,
      alignment: Alignment.center,
    );
    this.fullResPhoto = FadeInImage(
      placeholder: this.thumbnail.image,
      image: Image.network(
        'https://www.googleapis.com/drive/v3/files/${id}?alt=media&key=${apiKey}',
      ).image,
      fit: BoxFit.contain,
      alignment: Alignment.center,
      fadeInDuration: Duration(milliseconds: 400),
      fadeOutDuration: Duration(milliseconds: 200),
    );
  }
}
