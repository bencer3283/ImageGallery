import 'package:flutter/material.dart';
import 'album.dart';

var photoPath_uk = [
  "albums/uk/DSCF5651.JPG",
  "albums/uk/DSCF5727.jpg",
  "albums/uk/DSCF5760.JPG",
  "albums/uk/DSCF6031.JPG",
  "albums/uk/DSCF6172.jpg",
  "albums/uk/DSCF6209.jpg",
  "albums/uk/DSCF6317.jpg",
  "albums/uk/DSCF6328.jpg",
  "albums/uk/DSCF6491.jpg",
  "albums/uk/DSCF6524.jpg",
  "albums/uk/DSCF6550.jpg",
  "albums/uk/DSCF6642.jpg",
  "albums/uk/DSCF6729.jpg",
  "albums/uk/DSCF6756.jpg",
  "albums/uk/DSCF6775.jpg",
  "albums/uk/DSCF6908.jpg",
  "albums/uk/DSCF6960.jpg",
  "albums/uk/DSCF7083.jpg",
  "albums/uk/DSCF7582.jpg",
  "albums/uk/DSCF8020.JPG",
  "albums/uk/DSCF8039.JPG",
  "albums/uk/DSCF8056.jpg",
  "albums/uk/DSCF8312.JPG",
  "albums/uk/DSCF8514.JPG",
  "albums/uk/DSCF8687.JPG",
  "albums/uk/DSCF8826.jpg",
];
var photoFullPath_uk = [
  "albums/uk/full/DSCF5651.JPG",
  "albums/uk/full/DSCF5727.jpg",
  "albums/uk/full/DSCF5760.JPG",
  "albums/uk/full/DSCF6031.JPG",
  "albums/uk/full/DSCF6172.jpg",
  "albums/uk/full/DSCF6209.jpg",
  "albums/uk/full/DSCF6317.jpg",
  "albums/uk/full/DSCF6328.jpg",
  "albums/uk/full/DSCF6491.jpg",
  "albums/uk/full/DSCF6524.jpg",
  "albums/uk/full/DSCF6550.jpg",
  "albums/uk/full/DSCF6642.jpg",
  "albums/uk/full/DSCF6729.jpg",
  "albums/uk/full/DSCF6756.jpg",
  "albums/uk/full/DSCF6775.jpg",
  "albums/uk/full/DSCF6908.jpg",
  "albums/uk/full/DSCF6960.jpg",
  "albums/uk/full/DSCF7083.jpg",
  "albums/uk/full/DSCF7582.jpg",
  "albums/uk/full/DSCF8020.JPG",
  "albums/uk/full/DSCF8039.JPG",
  "albums/uk/full/DSCF8056.jpg",
  "albums/uk/full/DSCF8312.JPG",
  "albums/uk/full/DSCF8514.JPG",
  "albums/uk/full/DSCF8687.JPG",
  "albums/uk/full/DSCF8826.jpg",
];
var info_uk = [
  ['Inverness, Scotland', 'FUJIFILM X-T2'],
  ['Aviemore, Scotland', 'FUJIFILM X-T2'],
  ['Aviemore, Scotland', 'FUJIFILM X-T2'],
  ['Aviemore, Scotland', 'FUJIFILM X-T2'],
  ['Aviemore, Scotland', 'FUJIFILM X-T2'],
  ['Aviemore, Scotland', 'FUJIFILM X-T2'],
  ['Aviemore, Scotland', 'FUJIFILM X-T2'],
  ['Aviemore, Scotland', 'FUJIFILM X-T2'],
  ['Isle of Skye, Scotland', 'FUJIFILM X-T2'],
  ['Isle of Skye, Scotland', 'FUJIFILM X-T2'],
  ['Isle of Skye, Scotland', 'FUJIFILM X-T2'],
  ['Isle of Skye, Scotland', 'FUJIFILM X-T2'],
  ['Isle of Skye, Scotland', 'FUJIFILM X-T2'],
  ['Isle of Skye, Scotland', 'FUJIFILM X-T2'],
  ['Isle of Skye, Scotland', 'FUJIFILM X-T2'],
  ['Isle of Skye, Scotland', 'FUJIFILM X-T2'],
  ['Isle of Skye, Scotland', 'FUJIFILM X-T2'],
  ['Isle of Skye, Scotland', 'FUJIFILM X-T2'],
  ['Isle of Skye, Scotland', 'FUJIFILM X-T2'],
  ['Edinburgh', 'FUJIFILM X-T2'],
  ['Edinburgh', 'FUJIFILM X-T2'],
  ['Edinburgh', 'FUJIFILM X-T2'],
  ['London', 'FUJIFILM X-T2'],
  ['London', 'FUJIFILM X-T2'],
  ['London', 'FUJIFILM X-T2'],
  ['Brighton', 'FUJIFILM X-T2'],
];
Album uk = Album(
    photoPath_uk,
    photoFullPath_uk,
    info_uk,
    '旅行英國: 大海與大地',
    'Scenery across the UK',
    '旅行英國',
    '我在2018年夏季獨自前往英國，三周的時間中，\n除了倫敦與愛丁堡兩個大城外，我花了更多的行程在蘇格蘭與斯凱島的曠野，\n在壯闊驚人的景色中度過大學前的最後一個假期。');

class UK extends StatelessWidget {
  const UK({
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
            child:
                Align(alignment: Alignment.topRight, child: uk.photosList[17]),
            fit: FlexFit.tight,
            flex: 5,
          ),
          Flexible(
            flex: 4,
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Scotland & London',
                  style: textStyle_albumTitle,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('旅行英國', style: textStyle_albumSubtitle),
              ),
            ),
          ),
          Flexible(
            child: Align(
                alignment: Alignment.bottomRight, child: uk.photosList[19]),
            fit: FlexFit.tight,
            flex: 5,
          )
        ],
      ),
    );
  }
}
