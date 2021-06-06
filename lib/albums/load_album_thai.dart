import 'package:flutter/material.dart';
import 'album.dart';

var photoPath_thai = [
  "albums/thai/DSCF3849.JPG",
  "albums/thai/DSCF3854.JPG",
  "albums/thai/DSCF3917.JPG",
  "albums/thai/DSCF4059.JPG",
];
var photoFullPath_thai = [
  "albums/thai/full/DSCF3849.JPG",
  "albums/thai/full/DSCF3854.JPG",
  "albums/thai/full/DSCF3917.JPG",
  "albums/thai/full/DSCF4059.JPG",
];
var info_thai = [
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
];
Album thai = Album(photoPath_thai, photoFullPath_thai, info_thai, 'thai',
    'thai', 'thai', 'thai');

class Thai extends StatelessWidget {
  const Thai({
    Key? key,
    required this.textStyle_albumTitle,
    required this.textStyle_albumSubtitle,
  }) : super(key: key);

  final TextStyle textStyle_albumTitle;
  final TextStyle textStyle_albumSubtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blueGrey.shade500, width: 10),
          image: DecorationImage(
            image: thai.photosList()[0].image,
            fit: BoxFit.contain,
            alignment: Alignment.bottomRight,
          )),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Thailand', style: textStyle_albumTitle),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('旅行泰國', style: textStyle_albumSubtitle),
            ),
          ),
        ],
      ),
    );
  }
}
