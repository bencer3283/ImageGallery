import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'album.dart';

class AlbumGrid extends StatefulWidget {
  AlbumGrid({required this.handleTap, required this.album});

  final ValueChanged<int> handleTap;
  final Album album;

  @override
  _AlbumGridState createState() => _AlbumGridState();
}

class _AlbumGridState extends State<AlbumGrid> {
  List<double> _elevation = [];

  Gradient linearGradient = SweepGradient(
      colors: [
        Colors.grey.shade500,
        Colors.green.shade200,
        Colors.amber.shade200,
        Colors.grey.shade500,
      ],
      stops: [
        0.3,
        0.5,
        0.7,
        1.0
      ],
      center: defaultTargetPlatform == TargetPlatform.android ||
              defaultTargetPlatform == TargetPlatform.iOS
          ? Alignment(0, 0)
          : Alignment(-0.5, 0));

  Gradient linearGradient2 = LinearGradient(colors: [
    Colors.green.shade200,
    Colors.amber.shade200,
    Colors.grey.shade500,
  ], stops: [
    0.0,
    0.25,
    0.5
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  Gradient linearGradient3 = LinearGradient(colors: [
    Colors.grey.shade500,
    Colors.blueGrey.shade200,
    Colors.pink.shade100
  ], stops: [
    0.3,
    0.9,
    1.0
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  List<Color> _greenradius = [];

  var imagepanelcolor = Colors.grey.shade500.withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.album.photosList().length; i++) {
      _elevation.add(16.0);
      _greenradius.add(imagepanelcolor);
    }

    //widget.albumSetStr();

    return Container(
      color: Colors.grey.shade500,
      child: Stack(children: [
        CustomScrollView(slivers: [
          SliverPadding(
            padding: EdgeInsets.only(top: 60, left: 16, right: 16, bottom: 8),
            sliver: SliverToBoxAdapter(
              child: PhysicalModel(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                elevation: 16,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: defaultTargetPlatform == TargetPlatform.android ||
                            defaultTargetPlatform == TargetPlatform.iOS
                        ? linearGradient2
                        : linearGradient,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, right: 12, left: 20, bottom: 12),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '#上學計畫',
                            style:
                                TextStyle(fontSize: 40, fontFamily: "NotoSans"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: Text(
                              'The GoToSchool Project',
                              style: TextStyle(
                                  fontSize: 24, fontFamily: "HKGrotesk"),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '2021年5月，新冠肺炎在臺灣重新肆虐，\n臺大宣布該學期全面遠距教學，\n所有同學不必再到學校上課。\n這系列影像希望呈現出空無一人的校園，\n如何在疫情之下守護所有同學的安全，展現韌性與堅毅。',
                              style: TextStyle(
                                  fontSize: defaultTargetPlatform ==
                                              TargetPlatform.android ||
                                          defaultTargetPlatform ==
                                              TargetPlatform.iOS
                                      ? 12
                                      : 14,
                                  fontFamily: "NotoSans"),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Column(children: [
                    AnimatedPhysicalModel(
                        duration: Duration(milliseconds: 300),
                        shape: BoxShape.rectangle,
                        shadowColor: Colors.black,
                        color: Colors.transparent,
                        elevation: _elevation[index],
                        borderRadius: BorderRadius.circular(10),
                        child: GestureDetector(
                          onTapUp: (details) {
                            setState(() {
                              _elevation[index] = 0;
                              _greenradius[index] = Colors.green.shade200;
                            });
                            Timer(Duration(milliseconds: 400), () {
                              setState(() {
                                _elevation[index] = 16;
                                _greenradius[index] = imagepanelcolor;
                              });
                            });
                            Timer(Duration(milliseconds: 600), () {
                              widget.handleTap(index);
                            });
                          },
                          child: Hero(
                            tag: index,
                            child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                height: MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.width >
                                            MediaQuery.of(context).size.height
                                        ? 3
                                        : 2) *
                                    0.75,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        widget.album.photosList()[index].image,
                                    fit: BoxFit.contain,
                                  ),
                                  gradient: RadialGradient(colors: [
                                    _greenradius[index],
                                    imagepanelcolor,
                                  ], stops: [
                                    0.8,
                                    1.0
                                  ]),
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        )),
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(top: 1.5, left: 5),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black, width: 1.5)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 2.5),
                        child: Text(
                          "${widget.album.photos[index].des}",
                          style: TextStyle(
                              fontSize: defaultTargetPlatform ==
                                          TargetPlatform.android ||
                                      defaultTargetPlatform ==
                                          TargetPlatform.iOS
                                  ? 8
                                  : 12,
                              fontFamily: 'NotoSans',
                              color: Colors.black),
                        ),
                      ),
                    )
                  ]);
                }, childCount: widget.album.photosList().length),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width >
                          MediaQuery.of(context).size.height
                      ? 3
                      : 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 5,
                )),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: PhysicalModel(
              color: Colors.transparent,
              elevation: 18,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: linearGradient3,
                ),
                child: Align(
                  heightFactor: 1.0,
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 6, bottom: 6, left: 6, right: 40),
                    child: Text(
                      "臺大封校影像紀錄",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'NotoSans',
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
