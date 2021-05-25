import 'package:flutter/cupertino.dart';

class Album {
  Album(List<String> path, List<String> pathFull) {
    for (String p in path) {
      photos.add(Photo(p));
    }
    for (String p in pathFull) {
      photosFull.add(Photo(p));
    }
  }
  List<Photo> photos = [];
  List<Photo> photosFull = [];

  List<Image> photosList() {
    List<Image> image = [];
    for (int i = 0; i < photos.length; i++) {
      image.add(photos[i].photo);
    }
    return image;
  }

  List<Image> photosFullList() {
    List<Image> image = [];
    for (int i = 0; i < photos.length; i++) {
      image.add(photosFull[i].photo);
    }
    return image;
  }
}

class Photo {
  late Image photo;
  String des = ' ';
  String exp = ' ';

  Photo(String path) {
    this.photo = Image.asset(path);
  }
}
