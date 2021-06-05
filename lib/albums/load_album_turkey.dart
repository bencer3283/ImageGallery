import 'package:flutter/material.dart';
import 'album.dart';

var photoPath_turkey = [
  "albums/turkey/DSCF4487.JPG",
  "albums/turkey/DSCF4510.JPG",
  "albums/turkey/DSCF4633.jpg",
  "albums/turkey/DSCF4640.RAF",
  "albums/turkey/DSCF4765.JPG",
  "albums/turkey/DSCF4810.JPG",
  "albums/turkey/DSCF4861.JPG",
  "albums/turkey/DSCF4996.JPG",
  "albums/turkey/DSCF5122.JPG",
  "albums/turkey/DSCF5200.JPG",
  "albums/turkey/DSCF5219.JPG",
  "albums/turkey/DSCF5222.JPG",
  "albums/turkey/DSCF5332.JPG",
  "albums/turkey/image08.jpg",
];
var photoFullPath_turkey = [
  "albums/turkey/full/DSCF4487.JPG",
  "albums/turkey/full/DSCF4510.JPG",
  "albums/turkey/full/DSCF4633.RAF",
  "albums/turkey/full/DSCF4640.RAF",
  "albums/turkey/full/DSCF4765.JPG",
  "albums/turkey/full/DSCF4810.JPG",
  "albums/turkey/full/DSCF4861.JPG",
  "albums/turkey/full/DSCF4996.JPG",
  "albums/turkey/full/DSCF5122.JPG",
  "albums/turkey/full/DSCF5200.JPG",
  "albums/turkey/full/DSCF5219.JPG",
  "albums/turkey/full/DSCF5222.JPG",
  "albums/turkey/full/DSCF5332.JPG",
  "albums/turkey/full/image08.jpg",
];
var info_turkey = [
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
Album turkey = Album(photoPath_turkey, photoFullPath_turkey, info_turkey,
    'turkey', 'turkey', 'turkey', 'turkey');

class Turkey extends StatelessWidget {
  const Turkey({
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
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blueGrey.shade500, width: 10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Align(
                alignment: Alignment.topRight, child: turkey.photosList()[2]),
            fit: FlexFit.tight,
            flex: 5,
          ),
          Flexible(
            flex: 3,
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  '旅行土耳其',
                  style: textStyle_albumSubtitle,
                ),
              ),
            ),
          ),
          Flexible(
            child: Align(
                alignment: Alignment.bottomRight,
                child: turkey.photosList()[0]),
            fit: FlexFit.tight,
            flex: 3,
          )
        ],
      ),
    );
  }
}
