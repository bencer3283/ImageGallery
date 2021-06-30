import 'package:flutter/material.dart';
import 'album.dart';

var photoPath_airport = [
  "albums/airport/image02.jpg",
  "albums/airport/image03.jpg",
  "albums/airport/image04.jpg",
  "albums/airport/image05.jpg",
  "albums/airport/image06.jpg",
];
var photoFullPath_airport = [
  "albums/airport/full/image02.jpg",
  "albums/airport/full/image03.jpg",
  "albums/airport/full/image04.jpg",
  "albums/airport/full/image05.jpg",
  "albums/airport/full/image06.jpg",
];
var info_airport = [
  ['香港國際機場', 'FUJIFILM X-T2'],
  ['香港國際機場', 'FUJIFILM X-T2'],
  ['卡達，哈瑪德國際機場', 'FUJIFILM X-T2'],
  ['卡達，哈瑪德國際機場', 'FUJIFILM X-T2'],
  ['卡達，哈瑪德國際機場', 'FUJIFILM X-T2'],
];
Album airport = Album(
    photoPath_airport,
    photoFullPath_airport,
    info_airport,
    '機場剪影',
    'Illustration of airport',
    '機場剪影',
    '其實機場裡面的旅人也是這樣吧，重重關卡，複雜的路線，\n但總是上的了飛機。\n對我而言，機場是一個無論旁觀俯視，\n或身陷其中，都特別有趣的地方。');

class Airport extends StatelessWidget {
  const Airport({
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
            image: airport.photosList()[0].image,
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
              child: Text('Airport', style: textStyle_albumTitle),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('機場剪影', style: textStyle_albumSubtitle),
            ),
          ),
        ],
      ),
    );
  }
}
