import 'dart:async';
import 'package:flutter/material.dart';
import 'load_album_ntuclose.dart';
import 'package:flutter/foundation.dart';

class AlbumGrid extends StatefulWidget {
  AlbumGrid({required this.handleTap});

  final ValueChanged<int> handleTap;

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

  var imagepanelcolor = Colors.grey.shade600.withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < ntuclose.photosList().length; i++) {
      _elevation.add(16.0);
      _greenradius.add(imagepanelcolor);
    }

    ntucloseSetStr();

    return Container(
      decoration: BoxDecoration(gradient: linearGradient),
      child: Stack(children: [
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width >
                    MediaQuery.of(context).size.height
                ? 3
                : 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 5,
          ),
          itemCount: ntuclose.photosList().length,
          padding: EdgeInsets.only(top: 80, right: 8.0, bottom: 8.0, left: 8.0),
          itemBuilder: (context, index) {
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
                                image: ntuclose.photosList()[index].image,
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
                              border: Border.all(
                                  color: imagepanelcolor, width: 0.0))),
                    ),
                  )),
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(top: 1.5, left: 5),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black, width: 1.5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 2.5),
                  child: Text(
                    "${ntuclose.photos[index].des}",
                    style: TextStyle(
                        fontSize:
                            defaultTargetPlatform == TargetPlatform.android ||
                                    defaultTargetPlatform == TargetPlatform.iOS
                                ? 8
                                : 12,
                        fontFamily: 'NotoSans',
                        color: Colors.black),
                  ),
                ),
              )
            ]);
          },
        ),
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
