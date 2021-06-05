import 'package:flutter/material.dart';
import 'album.dart';

var photoPath_ckpcsport = [
  "albums/ckpcsport/DSC_1309.jpg",
  "albums/ckpcsport/DSC_1314.jpg",
  "albums/ckpcsport/DSC_1401.jpg",
  "albums/ckpcsport/DSC_1450.jpg",
  "albums/ckpcsport/DSC_1705.jpg",
  "albums/ckpcsport/DSC_1726.jpg",
  "albums/ckpcsport/DSC_1835.jpg",
  "albums/ckpcsport/DSC_3094.jpg",
  "albums/ckpcsport/DSC_3102-D4S.jpg",
  "albums/ckpcsport/DSC_4086.jpg",
  "albums/ckpcsport/DSC_4248.jpg",
  "albums/ckpcsport/DSC_4318.jpg",
  "albums/ckpcsport/RW3A0540.jpg",
];
var photoFullPath_ckpcsport = [
  "albums/ckpcsport/full/DSC_1309.jpg",
  "albums/ckpcsport/full/DSC_1314.jpg",
  "albums/ckpcsport/full/DSC_1401.jpg",
  "albums/ckpcsport/full/DSC_1450.jpg",
  "albums/ckpcsport/full/DSC_1705.jpg",
  "albums/ckpcsport/full/DSC_1726.jpg",
  "albums/ckpcsport/full/DSC_1835.jpg",
  "albums/ckpcsport/full/DSC_3094.jpg",
  "albums/ckpcsport/full/DSC_3102-D4S.jpg",
  "albums/ckpcsport/full/DSC_4086.jpg",
  "albums/ckpcsport/full/DSC_4248.jpg",
  "albums/ckpcsport/full/DSC_4318.jpg",
  "albums/ckpcsport/full/RW3A0540.jpg",
];
var info_ckpcsport = [
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
Album ckpcsport = Album(photoPath_ckpcsport, photoFullPath_ckpcsport,
    info_ckpcsport, 'ckpcsport', 'ckpcsport', 'ckpcsport', 'ckpcsport');

class CkpcSport extends StatelessWidget {
  const CkpcSport({
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
            image: ckpcsport.photosList()[6].image,
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
              child: Text('CKPC: Sports', style: textStyle_albumTitle),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('建中攝影: 體育', style: textStyle_albumSubtitle),
            ),
          ),
        ],
      ),
    );
  }
}
