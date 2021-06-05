import 'package:flutter/material.dart';
import 'album.dart';

var photoPath_portugal = [
  "albums/portugal/DSCF4182.JPG",
  "albums/portugal/DSCF4185.JPG",
  "albums/portugal/DSCF4218.JPG",
  "albums/portugal/DSCF4224.JPG",
  "albums/portugal/DSCF4239.JPG",
  "albums/portugal/DSCF4339.JPG",
  "albums/portugal/DSCF4479.JPG",
  "albums/portugal/DSCF4481.JPG",
  "albums/portugal/DSCF4575.JPG",
  "albums/portugal/image07.jpg",
];
var photoFullPath_portugal = [
  "albums/portugal/full/DSCF4182.JPG",
  "albums/portugal/full/DSCF4185.JPG",
  "albums/portugal/full/DSCF4218.JPG",
  "albums/portugal/full/DSCF4224.JPG",
  "albums/portugal/full/DSCF4239.JPG",
  "albums/portugal/full/DSCF4339.JPG",
  "albums/portugal/full/DSCF4479.JPG",
  "albums/portugal/full/DSCF4481.JPG",
  "albums/portugal/full/DSCF4575.JPG",
  "albums/portugal/full/image07.jpg",
];
var info_portugal = [
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
Album portugal = Album(photoPath_portugal, photoFullPath_portugal,
    info_portugal, 'portugal', 'portugal', 'portugal', 'portugal');

class Portugal extends StatelessWidget {
  const Portugal({
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
            image: portugal.photosList()[5].image,
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
              child: Text('Portugal', style: textStyle_albumTitle),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('旅行葡萄牙', style: textStyle_albumSubtitle),
            ),
          ),
        ],
      ),
    );
  }
}
