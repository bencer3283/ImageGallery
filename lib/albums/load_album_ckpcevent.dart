import 'package:flutter/material.dart';
import 'album.dart';

var photoPath_ckpcevent = [
  "albums/ckpcevent/DSCF1866(2).jpg",
  "albums/ckpcevent/DSCF3696.jpg",
  "albums/ckpcevent/DSCF7251.jpg",
  "albums/ckpcevent/DSC_0900.jpg",
  "albums/ckpcevent/DSC_3725.JPG",
  "albums/ckpcevent/DSC_3729.JPG",
  "albums/ckpcevent/DSC_4556.jpg",
  "albums/ckpcevent/DSC_4559.jpg",
  "albums/ckpcevent/DSC_4588.JPG",
  "albums/ckpcevent/DSC_4609.JPG",
  "albums/ckpcevent/DSC_5833.jpg",
  "albums/ckpcevent/DSC_5881.jpg",
  "albums/ckpcevent/DSC_5892.jpg",
  "albums/ckpcevent/DSC_6118.jpg",
  "albums/ckpcevent/DSC_6139.jpg",
  "albums/ckpcevent/DSC_6194.jpg",
  "albums/ckpcevent/DSC_6273.jpg",
  "albums/ckpcevent/DSC_6282.jpg",
  "albums/ckpcevent/DSC_6310.jpg",
];
var photoFullPath_ckpcevent = [
  "albums/ckpcevent/full/DSCF1866(2).jpg",
  "albums/ckpcevent/full/DSCF3696.jpg",
  "albums/ckpcevent/full/DSCF7251.jpg",
  "albums/ckpcevent/full/DSC_0900.jpg",
  "albums/ckpcevent/full/DSC_3725.JPG",
  "albums/ckpcevent/full/DSC_3729.JPG",
  "albums/ckpcevent/full/DSC_4556.jpg",
  "albums/ckpcevent/full/DSC_4559.jpg",
  "albums/ckpcevent/full/DSC_4588.JPG",
  "albums/ckpcevent/full/DSC_4609.JPG",
  "albums/ckpcevent/full/DSC_5833.jpg",
  "albums/ckpcevent/full/DSC_5881.jpg",
  "albums/ckpcevent/full/DSC_5892.jpg",
  "albums/ckpcevent/full/DSC_6118.jpg",
  "albums/ckpcevent/full/DSC_6139.jpg",
  "albums/ckpcevent/full/DSC_6194.jpg",
  "albums/ckpcevent/full/DSC_6273.jpg",
  "albums/ckpcevent/full/DSC_6282.jpg",
  "albums/ckpcevent/full/DSC_6310.jpg",
];
var info_ckpcevent = [
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
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
];
Album ckpcevent = Album(photoPath_ckpcevent, photoFullPath_ckpcevent,
    info_ckpcevent, 'ckpcevent', 'ckpcevent', 'ckpcevent', 'ckpcevent');

class CkpcEvent extends StatelessWidget {
  const CkpcEvent({
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
            image: ckpcevent.photosList().last.image,
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
              child: Text('CKPC: Event', style: textStyle_albumTitle),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('建中攝影: 紀實', style: textStyle_albumSubtitle),
            ),
          ),
        ],
      ),
    );
  }
}
