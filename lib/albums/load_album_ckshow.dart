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
  ['建中熱舞社', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['建中手語社', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['建中手語社', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['建中手語社', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['Leo王', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['現場紀實', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['現場紀實', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['現場紀實', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['現場紀實', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['後台準備', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['現場紀實', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['怕胖團', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['社團表演', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['社團表演', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['社團表演', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['社團表演', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['李有廷', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['社團表演', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['社團表演', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['社團表演', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['社團表演', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['社團表演', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['社團表演', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
  ['社團表演', 'FUJIFILM X-T2, Agency: 建中攝影 CKPC'],
];
Album ckshow = Album(
  photoPath_ckshow,
  photoFullPath_ckshow,
  info_ckshow,
  '舞台攝影:\n2020 建中舞會',
  '2020 CK High School Party',
  '舞台攝影: 2020 建中舞會',
  '本系列影像作為我在舞台表演攝影類別的代表，\n除了有歌唱與舞蹈表演外，也兼具部分活動紀實。\n舞台攝影的情境使攝影者必須在極短的時間內，\n捕捉合適的光線、構圖、表情、動作，並顧及影像畫質，\n特別感謝建中攝影ckpc提供我許多拍攝與成長的機會。',
);

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
                  '舞台攝影: 2020 建中舞會',
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
