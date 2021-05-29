import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'viewer.dart';
import 'load_album_ntuclose.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: AlbumGrid(),
          backgroundColor: Colors.black,
        ),
        theme: ThemeData(
          backgroundColor: Colors.grey,
        ));
  }
}

class AlbumGrid extends StatefulWidget {
  @override
  _AlbumGridState createState() => _AlbumGridState();
}

class _AlbumGridState extends State<AlbumGrid> {
  List<double> _elevation = [];

  Gradient linearGradient = SweepGradient(colors: [
    Colors.grey.shade400,
    Colors.green.shade200,
    Colors.amber.shade200,
    Colors.grey.shade400,
  ], stops: [
    0.1,
    0.3,
    0.8,
    1.0
  ], center: Alignment(-0.9, 0));

  Gradient linearGradient3 = LinearGradient(colors: [
    Colors.grey.shade400,
    Colors.blueGrey.shade200,
    Colors.red.shade200
  ], stops: [
    0.3,
    0.8,
    1.0
  ]);

  List<Color> _greenradius = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < ntuclose.photosList().length; i++) {
      _elevation.add(16.0);
      _greenradius.add(Colors.grey.shade400);
    }

    ntucloseSetStr();

    return Stack(children: [
      Container(
        color: Colors.grey.shade400,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width >
                      MediaQuery.of(context).size.height
                  ? 3
                  : 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 10,
              childAspectRatio: 1),
          itemCount: ntuclose.photosList().length,
          padding: EdgeInsets.only(top: 80),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                AnimatedPhysicalModel(
                    duration: Duration(milliseconds: 300),
                    shape: BoxShape.rectangle,
                    shadowColor: Colors.black,
                    color: Colors.transparent,
                    elevation: _elevation[index],
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTapDown: (details) {
                        setState(() {
                          _elevation[index] = 0;
                          _greenradius[index] = Colors.green.shade200;
                        });
                        Timer(Duration(milliseconds: 400), () {
                          setState(() {
                            _elevation[index] = 16;
                            _greenradius[index] = Colors.grey.shade400;
                          });
                        });
                      },
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
                              Colors.grey.shade400,
                            ], stops: [
                              0.8,
                              1.0
                            ]),
                            borderRadius: BorderRadius.circular(10),
                          )),
                    )),
                AnimatedPhysicalModel(
                  duration: Duration(milliseconds: 200),
                  shape: BoxShape.rectangle,
                  shadowColor: Colors.black,
                  color: Colors.transparent,
                  elevation: _elevation[index],
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: linearGradient,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${ntuclose.photos[index].des}",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'NotoSans',
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            );
          },
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: PhysicalModel(
          color: Colors.transparent,
          elevation: 18,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: linearGradient3,
            ),
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, right: 10, left: 100),
              child: Text(
                "臺大封校影像紀錄",
                style: TextStyle(
                    fontSize: 20, fontFamily: 'NotoSans', color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
