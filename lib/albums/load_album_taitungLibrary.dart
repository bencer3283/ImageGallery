import 'package:flutter/material.dart';
import 'album.dart';

var photoPath_taitungLibrary = [
  "albums/taitungLibrary/DSCF5104.JPG",
  "albums/taitungLibrary/DSCF5112.JPG",
  "albums/taitungLibrary/DSCF5113.JPG",
  "albums/taitungLibrary/DSCF5114.JPG",
  "albums/taitungLibrary/DSCF5115.JPG",
  "albums/taitungLibrary/DSCF5116.JPG",
  "albums/taitungLibrary/DSCF5118.JPG",
  "albums/taitungLibrary/DSCF5122.JPG",
  "albums/taitungLibrary/DSCF5126.JPG",
  "albums/taitungLibrary/DSCF5127.JPG",
  "albums/taitungLibrary/DSCF5128.JPG",
  "albums/taitungLibrary/DSCF5129.JPG",
  "albums/taitungLibrary/DSCF5133.JPG",
  "albums/taitungLibrary/DSCF5134.JPG",
  "albums/taitungLibrary/DSCF5135.JPG",
  "albums/taitungLibrary/DSCF5137.JPG",
];
var photoFullPath_taitungLibrary = [
  "albums/taitungLibrary/full/DSCF5104.JPG",
  "albums/taitungLibrary/full/DSCF5112.JPG",
  "albums/taitungLibrary/full/DSCF5113.JPG",
  "albums/taitungLibrary/full/DSCF5114.JPG",
  "albums/taitungLibrary/full/DSCF5115.JPG",
  "albums/taitungLibrary/full/DSCF5116.JPG",
  "albums/taitungLibrary/full/DSCF5118.JPG",
  "albums/taitungLibrary/full/DSCF5122.JPG",
  "albums/taitungLibrary/full/DSCF5126.JPG",
  "albums/taitungLibrary/full/DSCF5127.JPG",
  "albums/taitungLibrary/full/DSCF5128.JPG",
  "albums/taitungLibrary/full/DSCF5129.JPG",
  "albums/taitungLibrary/full/DSCF5133.JPG",
  "albums/taitungLibrary/full/DSCF5134.JPG",
  "albums/taitungLibrary/full/DSCF5135.JPG",
  "albums/taitungLibrary/full/DSCF5137.JPG",
];
var info_taitungLibrary = [
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
];
Album taitungLibrary = Album(
    photoPath_taitungLibrary,
    photoFullPath_taitungLibrary,
    info_taitungLibrary,
    'taitungLibrary',
    'taitungLibrary',
    'taitungLibrary',
    'taitungLibrary');

class TaitungLibrary extends StatelessWidget {
  const TaitungLibrary({
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
            image: taitungLibrary.photosList()[7].image,
            fit: BoxFit.contain,
            alignment: Alignment.bottomRight,
          )),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text('Library\nby the Sea', style: textStyle_albumTitle),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('台東大學圖書館', style: textStyle_albumSubtitle),
            ),
          ),
        ],
      ),
    );
  }
}
