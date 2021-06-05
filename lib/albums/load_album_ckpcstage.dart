import 'package:flutter/material.dart';
import 'album.dart';

var photoPath_ckpcstage = [
  "albums/ckpcstage/DSCF4603.jpg",
  "albums/ckpcstage/DSCF4994.jpg",
  "albums/ckpcstage/DSCF6083.jpg",
  "albums/ckpcstage/DSCF6165_2.jpg",
  "albums/ckpcstage/DSCF6658.jpg",
  "albums/ckpcstage/DSCF9487.jpg",
  "albums/ckpcstage/R00057.jpg",
  "albums/ckpcstage/R00119.jpg",
  "albums/ckpcstage/R00198.jpg",
  "albums/ckpcstage/R00200_1.jpg",
  "albums/ckpcstage/R00218.jpg",
];
var photoFullPath_ckpcstage = [
  "albums/ckpcstage/full/DSCF4603.jpg",
  "albums/ckpcstage/full/DSCF4994.jpg",
  "albums/ckpcstage/full/DSCF6083.jpg",
  "albums/ckpcstage/full/DSCF6165_2.jpg",
  "albums/ckpcstage/full/DSCF6658.jpg",
  "albums/ckpcstage/full/DSCF9487.jpg",
  "albums/ckpcstage/full/R00057.jpg",
  "albums/ckpcstage/full/R00119.jpg",
  "albums/ckpcstage/full/R00198.jpg",
  "albums/ckpcstage/full/R00200_1.jpg",
  "albums/ckpcstage/full/R00218.jpg",
];
var info_ckpcstage = [
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
Album ckpcstage = Album(photoPath_ckpcstage, photoFullPath_ckpcstage,
    info_ckpcstage, 'ckpcstage', 'ckpcstage', 'ckpcstage', 'ckpcstage');

class CkpcStage extends StatelessWidget {
  const CkpcStage({
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
                alignment: Alignment.topRight,
                child: ckpcstage.photosList()[6]),
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
                  'CKPC: Performance',
                  style: textStyle_albumTitle,
                ),
              ),
            ),
          ),
          Flexible(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('建中攝影: 舞台', style: textStyle_albumSubtitle),
              ),
            ),
          ),
          Flexible(
            child: Align(
                alignment: Alignment.bottomRight,
                child: ckpcstage.photosList()[4]),
            fit: FlexFit.tight,
            flex: 5,
          )
        ],
      ),
    );
  }
}
