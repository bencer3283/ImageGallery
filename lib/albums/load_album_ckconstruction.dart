import 'package:flutter/material.dart';
import 'album.dart';

var photoPath_ckconstruction = [
  "albums/ckconstruction/DSCF9009.jpg",
  "albums/ckconstruction/DSCF9012.jpg",
  "albums/ckconstruction/DSCF9020.jpg",
  "albums/ckconstruction/DSCF9023.jpg",
  "albums/ckconstruction/DSCF9031.jpg",
  "albums/ckconstruction/DSCF9038.jpg",
  "albums/ckconstruction/DSCF9042.jpg",
  "albums/ckconstruction/DSCF9048.jpg",
  "albums/ckconstruction/DSCF9050.jpg",
  "albums/ckconstruction/DSCF9068.jpg",
  "albums/ckconstruction/DSCF9076.jpg",
  "albums/ckconstruction/DSCF9081.jpg",
  "albums/ckconstruction/DSCF9085.jpg",
  "albums/ckconstruction/DSCF9088.jpg",
  "albums/ckconstruction/DSCF9089.jpg",
  "albums/ckconstruction/DSCF9095.jpg",
  "albums/ckconstruction/DSCF9101.jpg",
];
var photoFullPath_ckconstruction = [
  "albums/ckconstruction/full/DSCF9009.jpg",
  "albums/ckconstruction/full/DSCF9012.jpg",
  "albums/ckconstruction/full/DSCF9020.jpg",
  "albums/ckconstruction/full/DSCF9023.jpg",
  "albums/ckconstruction/full/DSCF9031.jpg",
  "albums/ckconstruction/full/DSCF9038.jpg",
  "albums/ckconstruction/full/DSCF9042.jpg",
  "albums/ckconstruction/full/DSCF9048.jpg",
  "albums/ckconstruction/full/DSCF9050.jpg",
  "albums/ckconstruction/full/DSCF9068.jpg",
  "albums/ckconstruction/full/DSCF9076.jpg",
  "albums/ckconstruction/full/DSCF9081.jpg",
  "albums/ckconstruction/full/DSCF9085.jpg",
  "albums/ckconstruction/full/DSCF9088.jpg",
  "albums/ckconstruction/full/DSCF9089.jpg",
  "albums/ckconstruction/full/DSCF9095.jpg",
  "albums/ckconstruction/full/DSCF9101.jpg",
];
var info_ckconstruction = [
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
Album ckconstruction = Album(
    photoPath_ckconstruction,
    photoFullPath_ckconstruction,
    info_ckconstruction,
    'ckconstruction',
    'ckconstruction',
    'ckconstruction',
    'ckconstruction');

class CkConstrution extends StatelessWidget {
  const CkConstrution({
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
            image: ckconstruction.photosList()[4].image,
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
              child: Text('建中工程紀實', style: textStyle_albumSubtitle),
            ),
          ),
        ],
      ),
    );
  }
}
