import 'package:flutter/material.dart';
import 'album.dart';

var photoPath_russia = [
  "albums/russia/DSCF3408.JPG",
  "albums/russia/DSCF3421.JPG",
  "albums/russia/DSCF3440.JPG",
  "albums/russia/DSCF3503.JPG",
  "albums/russia/DSCF3514.JPG",
  "albums/russia/DSCF3700.JPG",
];
var photoFullPath_russia = [
  "albums/russia/full/DSCF3408.JPG",
  "albums/russia/full/DSCF3421.JPG",
  "albums/russia/full/DSCF3440.JPG",
  "albums/russia/full/DSCF3503.JPG",
  "albums/russia/full/DSCF3514.JPG",
  "albums/russia/full/DSCF3700.JPG",
];
var info_russia = [
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
];
Album russia = Album(photoPath_russia, photoFullPath_russia, info_russia,
    'russia', 'russia', 'russia', 'russia');

class Russia extends StatelessWidget {
  const Russia({
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
            image: russia.photosList()[4].image,
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
              child: Text('Russia', style: textStyle_albumTitle),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('旅行俄羅斯', style: textStyle_albumSubtitle),
            ),
          ),
        ],
      ),
    );
  }
}
