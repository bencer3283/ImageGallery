import 'package:flutter/cupertino.dart';

class Album {
  Album(List<String> path, List<String> pathFull, List<List<String>> des_exp,
      String t, String te, String s, String des) {
    for (String p in path) {
      photos.add(Photo(p));
    }
    for (String p in pathFull) {
      photosFull.add(Photo(p));
    }
    for (int i = 0; i < des_exp.length; i++) {
      photos[i].setDescripExpos(des_exp[i][0], des_exp[i][1]);
    }
    title = t;
    titleEng = te;
    subtitle = s;
    description = des;
  }
  List<Photo> photos = [];
  List<Photo> photosFull = [];
  List<List<String>> strings = [];

  late String title;
  late String titleEng;
  late String subtitle;
  late String description;

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

  void setDescripExpos(String d, String e) {
    this.des = d;
    this.exp = e;
  }
}
