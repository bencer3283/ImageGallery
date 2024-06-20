import 'package:flutter/material.dart';
import 'album.dart';

var photoPath_huweitrain = [
  "albums/huweitrain/DSCF4582.jpg",
  "albums/huweitrain/DSCF4585.jpg",
  "albums/huweitrain/DSCF4586.jpg",
  "albums/huweitrain/DSCF4588.jpg",
  "albums/huweitrain/DSCF4591.jpg",
  "albums/huweitrain/DSCF4597.jpg",
  "albums/huweitrain/DSCF4600.jpg",
  "albums/huweitrain/DSCF4603.jpg",
  "albums/huweitrain/DSCF4608.jpg",
  "albums/huweitrain/DSCF4609.jpg",
  "albums/huweitrain/DSCF4615_1.jpg",
  "albums/huweitrain/DSCF4615.jpg",
  "albums/huweitrain/DSCF4616.jpg",
  "albums/huweitrain/DSCF4617.jpg",
  "albums/huweitrain/DSCF4620.jpg",
  "albums/huweitrain/DSCF4621.jpg",
  "albums/huweitrain/DSCF4623.jpg",
  "albums/huweitrain/DSCF4625.jpg",
  "albums/huweitrain/DSCF4627.jpg",
];
var photoFullPath_huweitrain = [
  "albums/huweitrain/full/DSCF4582.jpg",
  "albums/huweitrain/full/DSCF4585.jpg",
  "albums/huweitrain/full/DSCF4586.jpg",
  "albums/huweitrain/full/DSCF4588.jpg",
  "albums/huweitrain/full/DSCF4591.jpg",
  "albums/huweitrain/full/DSCF4597.jpg",
  "albums/huweitrain/full/DSCF4600.jpg",
  "albums/huweitrain/full/DSCF4603.jpg",
  "albums/huweitrain/full/DSCF4608.jpg",
  "albums/huweitrain/full/DSCF4609.jpg",
  "albums/huweitrain/full/DSCF4615_1.jpg",
  "albums/huweitrain/full/DSCF4615.jpg",
  "albums/huweitrain/full/DSCF4616.jpg",
  "albums/huweitrain/full/DSCF4617.jpg",
  "albums/huweitrain/full/DSCF4620.jpg",
  "albums/huweitrain/full/DSCF4621.jpg",
  "albums/huweitrain/full/DSCF4623.jpg",
  "albums/huweitrain/full/DSCF4625.jpg",
  "albums/huweitrain/full/DSCF4627.jpg",
];
var info_huweitrain = [
  ['十一番裝車場', 'FUJIFILM X-T2'],
  ['十一番裝車場', 'FUJIFILM X-T2'],
  ['十一番裝車場', 'FUJIFILM X-T2'],
  ['十一番裝車場', 'FUJIFILM X-T2'],
  ['十一番裝車場', 'FUJIFILM X-T2'],
  ['十一番裝車場', 'FUJIFILM X-T2'],
  ['十一番裝車場', 'FUJIFILM X-T2'],
  ['十一番裝車場', 'FUJIFILM X-T2'],
  ['十一番裝車場', 'FUJIFILM X-T2'],
  ['十一番裝車場', 'FUJIFILM X-T2'],
  ['虎尾糖鐵沿線(往龍岩方向)', 'FUJIFILM X-T2'],
  ['虎尾糖鐵沿線(往龍岩方向)', 'FUJIFILM X-T2'],
  ['虎尾糖鐵沿線(往龍岩方向)', 'FUJIFILM X-T2'],
  ['虎尾糖鐵沿線(往龍岩方向)', 'FUJIFILM X-T2'],
  ['虎尾糖鐵沿線(往龍岩方向)', 'FUJIFILM X-T2'],
  ['虎尾糖鐵沿線(往龍岩方向)', 'FUJIFILM X-T2'],
  ['虎尾糖鐵沿線(往龍岩方向)', 'FUJIFILM X-T2'],
  ['虎尾糖鐵沿線(往龍岩方向)', 'FUJIFILM X-T2'],
  ['虎尾糖鐵沿線(往龍岩方向)', 'FUJIFILM X-T2'],
];
Album huweitrain = Album(
    photoPath_huweitrain,
    photoFullPath_huweitrain,
    info_huweitrain,
    '虎尾糖廠五分車與十一番裝車場',
    'The Line:\nRailway of Hu-Wei Sugar Refinery',
    '虎尾糖鐵',
    '小小的車頭，卻可以拉動54節車廂，滿載甘蔗，從蔗田拉進糖廠。\n特別謝謝那天開車的家父。');

class HuWeiTrain extends StatelessWidget {
  const HuWeiTrain({
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
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Align(
                  alignment: Alignment.topRight,
                  child: huweitrain.photosList[11]),
              fit: FlexFit.tight,
              flex: 5,
            ),
            Spacer(
              flex: 1,
            ),
            Flexible(
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: huweitrain.photosList.last),
              fit: FlexFit.tight,
              flex: 3,
            )
          ],
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              '虎尾糖廠鐵路',
              style: textStyle_albumSubtitle,
            ),
          ),
        ),
      ]),
    );
  }
}
