import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Viewer());
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
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InteractiveViewer(child: Image.asset('albums/_DSF1278.jpg')),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: PhysicalModel(
                    color: Colors.yellow.shade300,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
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
      ],
    );
  }
}
