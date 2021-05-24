import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Viewer()));
  }
}

class Viewer extends StatefulWidget {
  const Viewer({
    Key? key,
  }) : super(key: key);

  @override
  _ViewerState createState() => _ViewerState();
}

class _ViewerState extends State<Viewer> {
  void nextImage() {}
  void previousImage() {}
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InteractiveViewer(child: Image.asset('albums/_DSF1278.jpg')),
        BottomInfo(),
        Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: PhysicalModel(
                color: Colors.lightGreen.shade200,
                elevation: 16.0,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: IconButton(
                    iconSize: 40,
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    onPressed: nextImage,
                  ),
                ),
              ),
            )),
        Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: PhysicalModel(
                color: Colors.lightGreen.shade200,
                elevation: 16.0,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: IconButton(
                    iconSize: 40,
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    onPressed: previousImage,
                  ),
                ),
              ),
            )),
        Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: PhysicalModel(
                color: Colors.red.shade100,
                elevation: 16.0,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: IconButton(
                    iconSize: 40,
                    icon: Icon(Icons.arrow_back_rounded),
                    onPressed: previousImage,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

class BottomInfo extends StatelessWidget {
  const BottomInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: PhysicalModel(
                  color: Colors.yellow.shade300,
                  elevation: 16.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        '1',
                        style: TextStyle(
                            fontSize: 60,
                            fontFamily: 'HKGrotesk',
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
            Spacer(
              flex: 2,
            ),
            Flexible(
                flex: 5,
                fit: FlexFit.loose,
                child: PhysicalModel(
                  color: Colors.blueGrey.shade300,
                  elevation: 16.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        '社會科學院大樓',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'NotoSans',
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
            Spacer(),
            Flexible(
                flex: 3,
                fit: FlexFit.loose,
                child: PhysicalModel(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 16.0,
                  color: Colors.grey.shade300,
                  child: Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          '1/200, F/5.6',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'HKGrotesk',
                              color: Colors.black),
                        ),
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
