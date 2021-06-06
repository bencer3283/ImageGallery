import 'package:flutter/material.dart';
import 'album.dart';

var photoPath_ckshow = [
  "albums/ckshow/_DSF0066.jpg",
  "albums/ckshow/_DSF0166.jpg",
  "albums/ckshow/_DSF0222.jpg",
  "albums/ckshow/_DSF0224.jpg",
  "albums/ckshow/_DSF0520.jpg",
  "albums/ckshow/_DSF7782.jpg",
  "albums/ckshow/_DSF7826.jpg",
  "albums/ckshow/_DSF7832.jpg",
  "albums/ckshow/_DSF7849.jpg",
  "albums/ckshow/_DSF7892.jpg",
  "albums/ckshow/_DSF8007.jpg",
  "albums/ckshow/_DSF8240.jpg",
  "albums/ckshow/_DSF8449.jpg",
  "albums/ckshow/_DSF8611.jpg",
  "albums/ckshow/_DSF8677.jpg",
  "albums/ckshow/_DSF9049.jpg",
  "albums/ckshow/_DSF9177.jpg",
  "albums/ckshow/_DSF9313.jpg",
  "albums/ckshow/_DSF9387.jpg",
  "albums/ckshow/_DSF9464.jpg",
  "albums/ckshow/_DSF9531.jpg",
  "albums/ckshow/_DSF9550.jpg",
  "albums/ckshow/_DSF9633.jpg",
  "albums/ckshow/_DSF9806.jpg",
];
var photoFullPath_ckshow = [
  "albums/ckshow/full/_DSF0066.jpg",
  "albums/ckshow/full/_DSF0166.jpg",
  "albums/ckshow/full/_DSF0222.jpg",
  "albums/ckshow/full/_DSF0224.jpg",
  "albums/ckshow/full/_DSF0520.jpg",
  "albums/ckshow/full/_DSF7782.jpg",
  "albums/ckshow/full/_DSF7826.jpg",
  "albums/ckshow/full/_DSF7832.jpg",
  "albums/ckshow/full/_DSF7849.jpg",
  "albums/ckshow/full/_DSF7892.jpg",
  "albums/ckshow/full/_DSF8007.jpg",
  "albums/ckshow/full/_DSF8240.jpg",
  "albums/ckshow/full/_DSF8449.jpg",
  "albums/ckshow/full/_DSF8611.jpg",
  "albums/ckshow/full/_DSF8677.jpg",
  "albums/ckshow/full/_DSF9049.jpg",
  "albums/ckshow/full/_DSF9177.jpg",
  "albums/ckshow/full/_DSF9313.jpg",
  "albums/ckshow/full/_DSF9387.jpg",
  "albums/ckshow/full/_DSF9464.jpg",
  "albums/ckshow/full/_DSF9531.jpg",
  "albums/ckshow/full/_DSF9550.jpg",
  "albums/ckshow/full/_DSF9633.jpg",
  "albums/ckshow/full/_DSF9806.jpg",
];
var info_ckshow = [
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
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
  [' ', ' '],
];
Album ckshow = Album(photoPath_ckshow, photoFullPath_ckshow, info_ckshow,
    'ckshow', 'ckshow', 'ckshow', 'ckshow');

class CkShow extends StatelessWidget {
  const CkShow({
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
                alignment: Alignment.topRight, child: ckshow.photosList()[0]),
            fit: FlexFit.tight,
            flex: 4,
          ),
          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  '2020 建中舞會',
                  style: textStyle_albumSubtitle,
                ),
              ),
            ),
          ),
          Flexible(
            child: Align(
                alignment: Alignment.bottomRight,
                child: ckshow.photosList()[4]),
            fit: FlexFit.tight,
            flex: 6,
          )
        ],
      ),
    );
  }
}
