import 'package:flutter/material.dart';
import 'album.dart';

var photoPath_turkey = [
  "albums/turkey/DSCF4487.JPG",
  "albums/turkey/DSCF4510.JPG",
  "albums/turkey/DSCF4633.jpg",
  "albums/turkey/DSCF4640.jpg",
  "albums/turkey/DSCF4765.JPG",
  "albums/turkey/DSCF4810.JPG",
  "albums/turkey/DSCF4861.JPG",
  "albums/turkey/DSCF4996.JPG",
  "albums/turkey/DSCF5122.jpg",
  "albums/turkey/DSCF5200.JPG",
  "albums/turkey/DSCF5219.JPG",
  "albums/turkey/DSCF5222.jpg",
  "albums/turkey/DSCF5332.JPG",
  "albums/turkey/image08.jpg",
];
var photoFullPath_turkey = [
  "albums/turkey/full/DSCF4487.JPG",
  "albums/turkey/full/DSCF4510.JPG",
  "albums/turkey/full/DSCF4633.jpg",
  "albums/turkey/full/DSCF4640.jpg",
  "albums/turkey/full/DSCF4765.JPG",
  "albums/turkey/full/DSCF4810.JPG",
  "albums/turkey/full/DSCF4861.JPG",
  "albums/turkey/full/DSCF4996.JPG",
  "albums/turkey/full/DSCF5122.jpg",
  "albums/turkey/full/DSCF5200.JPG",
  "albums/turkey/full/DSCF5219.JPG",
  "albums/turkey/full/DSCF5222.jpg",
  "albums/turkey/full/DSCF5332.JPG",
  "albums/turkey/full/image08.jpg",
];
var info_turkey = [
  ['Cappatokia', 'FUJIFILM X-T2'],
  ['Cappatokia', 'FUJIFILM X-T2'],
  ['Cappatokia', 'FUJIFILM X-T2'],
  ['Cappatokia', 'FUJIFILM X-T2'],
  ['Cappatokia', 'FUJIFILM X-T2'],
  ['Cappatokia', 'FUJIFILM X-T2'],
  ['Cappatokia', 'FUJIFILM X-T2'],
  ['Istanbul', 'FUJIFILM X-T2'],
  ['Istanbul', 'FUJIFILM X-T2'],
  ['Istanbul', 'FUJIFILM X-T2'],
  ['Istanbul', 'FUJIFILM X-T2'],
  ['Istanbul', 'FUJIFILM X-T2'],
  ['Transfer at Doha', 'FUJIFILM X-T2'],
  ['Cappatokia', 'FUJIFILM X-T2'],
];
Album turkey = Album(photoPath_turkey, photoFullPath_turkey, info_turkey,
    '旅行土耳其: 景致與人', 'Traveling Turkey: Scenery and Portrait', '旅行土耳其', '2018');

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
      child: Stack(children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Align(
                  alignment: Alignment.topRight, child: turkey.photosList()[2]),
              fit: FlexFit.tight,
              flex: 5,
            ),
            Spacer(
              flex: 1,
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
        Column(children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Turkey', style: textStyle_albumTitle),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                '旅行土耳其',
                style: textStyle_albumSubtitle,
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}
