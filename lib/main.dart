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
  final ScrollController gridControl =
      ScrollController(initialScrollOffset: -100, keepScrollOffset: true);

  List<double> _elevation = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < ntuclose.photosList().length; i++) {
      _elevation.add(16.0);
    }

    ntucloseSetStr();
    return Stack(children: [
      Container(
        color: Colors.grey.shade400,
        child: GridView.builder(
          controller: gridControl,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                AnimatedPhysicalModel(
                    duration: Duration(milliseconds: 200),
                    shape: BoxShape.rectangle,
                    shadowColor: Colors.black,
                    color: Colors.transparent,
                    elevation: _elevation[index],
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTapDown: (details) {
                        setState(() {
                          _elevation[index] = 0;
                        });
                        Timer(Duration(milliseconds: 300), () {
                          setState(() {
                            _elevation[index] = 16;
                          });
                        });
                      },
                      child: Container(
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
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(10),
                          )),
                    )),
                AnimatedPhysicalModel(
                  duration: Duration(milliseconds: 800),
                  shape: BoxShape.rectangle,
                  shadowColor: Colors.black,
                  color: Colors.transparent,
                  elevation: _elevation[index],
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [Colors.blue.shade200, Colors.red.shade200],
                          stops: [0.3, 1.0]),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${ntuclose.photos[index].des}",
                          style: TextStyle(
                              fontSize: 10,
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
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width >
                      MediaQuery.of(context).size.height
                  ? 3
                  : 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 10,
              childAspectRatio: 1),
          itemCount: ntuclose.photosList().length,
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
              gradient: LinearGradient(
                  colors: [Colors.blue.shade200, Colors.red.shade200],
                  stops: [0.3, 1.0]),
            ),
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, right: 10, left: 100),
              child: Text(
                "疫情三級警戒，臺大封校",
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
