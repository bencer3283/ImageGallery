import 'dart:async';

import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

import 'load_album.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Viewer(),
        backgroundColor: Colors.black,
      ),
    );
  }
}

class Viewer extends StatefulWidget {
  const Viewer({
    Key? key,
  }) : super(key: key);

  @override
  _ViewerState createState() => _ViewerState();
}

class _ViewerState extends State<Viewer> with AfterLayoutMixin<Viewer> {
  void nextImage() {
    pagecontrol.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  void previousImage() {
    pagecontrol.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  void goBack() {}

  void toggleUI() {
    if (!isHide) {
      hideUI();
    } else if (isHide) {
      showUI();
    }
    // if (!isHide) {
    //   Timer(Duration(seconds: 3), () {
    //     hideUI();
    //   });
    // }
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      hideUI();
    });
  }

  void showUI() {
    setState(() {
      hideNextButtonTween = Tween<Offset>(begin: Offset.zero, end: Offset.zero);
      hidePreviousButtonTween =
          Tween<Offset>(begin: Offset.zero, end: Offset.zero);
      bottomInfoHideNumberTween =
          Tween<Offset>(begin: Offset.zero, end: Offset(0, 0));
      hideBackButtonTween =
          Tween<Offset>(begin: Offset.zero, end: Offset(0, 0));
    });
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        bottomInfoHideDescripTween =
            Tween<Offset>(begin: Offset.zero, end: Offset.zero);
      });
    });
    Timer(Duration(milliseconds: 150), () {
      setState(() {
        bottomInfoHideExposTween =
            Tween<Offset>(begin: Offset.zero, end: Offset.zero);
      });
    });
    isHide = !isHide;
  }

  void hideUI() {
    setState(() {
      hideNextButtonTween =
          Tween<Offset>(begin: Offset.zero, end: Offset(100.0, 0));
      hidePreviousButtonTween =
          Tween<Offset>(begin: Offset.zero, end: Offset(-100, 0));
      hideBackButtonTween =
          Tween<Offset>(begin: Offset.zero, end: Offset(0, -150));
      bottomInfoHideNumberTween =
          Tween<Offset>(begin: Offset.zero, end: Offset(0, 150));
    });
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        bottomInfoHideDescripTween =
            Tween<Offset>(begin: Offset.zero, end: Offset(0, 150));
      });
    });
    Timer(Duration(milliseconds: 150), () {
      setState(() {
        bottomInfoHideExposTween =
            Tween<Offset>(begin: Offset.zero, end: Offset(0, 150));
      });
    });
    isHide = !isHide;
  }

  var hideNextButtonTween = Tween<Offset>(begin: Offset.zero, end: Offset.zero);
  var hidePreviousButtonTween =
      Tween<Offset>(begin: Offset.zero, end: Offset.zero);
  var hideBackButtonTween = Tween<Offset>(begin: Offset.zero, end: Offset.zero);
  var bottomInfoHideNumberTween =
      Tween<Offset>(begin: Offset.zero, end: Offset.zero);
  var bottomInfoHideDescripTween =
      Tween<Offset>(begin: Offset.zero, end: Offset.zero);
  var bottomInfoHideExposTween =
      Tween<Offset>(begin: Offset.zero, end: Offset.zero);
  var isHide = false;

  final pagecontrol = PageController();

  bool _loadFullRes = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          itemBuilder: (context, i) {
            return Center(
                child: InteractiveViewer(
              child: _loadFullRes ? photos_full[i] : photos[i],
              clipBehavior: Clip.none,
              onInteractionUpdate: (details) {
                setState(() {
                  _loadFullRes = true;
                });
              },
            ));
          },
          itemCount: photos.length,
          controller: pagecontrol,
          onPageChanged: (value) {
            setState(() {
              _loadFullRes = false;
            });
            if (!isHide) {
              Timer(Duration(seconds: 2), () {
                hideUI();
              });
            }
          },
        ),
        GestureDetector(
          onTap: () => toggleUI(),
        ),
        BottomInfo(
          hideNumberTween: bottomInfoHideNumberTween,
          hideDescripTween: bottomInfoHideDescripTween,
          hideExposTween: bottomInfoHideExposTween,
        ),
        TweenAnimationBuilder<Offset>(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInBack,
          builder: (context, offset, child) {
            return Transform.translate(
              offset: offset,
              child: child,
            );
          },
          tween: hideNextButtonTween,
          child: Opacity(
            opacity: 0.75,
            child: Padding(
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
          ),
        ),
        TweenAnimationBuilder<Offset>(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInBack,
          builder: (context, offset, child) {
            return Transform.translate(
              offset: offset,
              child: child,
            );
          },
          tween: hidePreviousButtonTween,
          child: Opacity(
            opacity: 0.75,
            child: Padding(
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
          ),
        ),
        TweenAnimationBuilder<Offset>(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInBack,
          builder: (context, offset, child) {
            return Transform.translate(
              offset: offset,
              child: child,
            );
          },
          tween: hideBackButtonTween,
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: PhysicalModel(
                  color: Colors.red.shade100,
                  elevation: 16.0,
                  borderRadius: BorderRadius.circular(100),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: IconButton(
                      iconSize: 40,
                      icon: Icon(Icons.arrow_back_rounded),
                      onPressed: goBack,
                    ),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}

class BottomInfo extends StatefulWidget {
  BottomInfo({
    Key? key,
    required this.hideNumberTween,
    required this.hideDescripTween,
    required this.hideExposTween,
  }) : super(key: key);

  var hideNumberTween = Tween<Offset>(begin: Offset.zero, end: Offset.zero);
  var hideDescripTween = Tween<Offset>(begin: Offset.zero, end: Offset.zero);
  var hideExposTween = Tween<Offset>(begin: Offset.zero, end: Offset.zero);

  @override
  _BottomInfoState createState() => _BottomInfoState();
}

class _BottomInfoState extends State<BottomInfo> {
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
              flex: 6,
              fit: FlexFit.loose,
              child: TweenAnimationBuilder<Offset>(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInBack,
                  builder: (context, offset, child) {
                    return Transform.translate(
                      offset: offset,
                      child: child,
                    );
                  },
                  tween: widget.hideNumberTween,
                  child: PhysicalModel(
                    color: Colors.yellow.shade300,
                    elevation: 16.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'HKGrotesk',
                                    color: Colors.black),
                              ),
                              Text(
                                '/2',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'HKGrotesk',
                                    color: Colors.black),
                              ),
                            ]),
                      ),
                    ),
                  )),
            ),
            Spacer(
              flex: 2,
            ),
            Flexible(
                flex: 15,
                fit: FlexFit.loose,
                child: TweenAnimationBuilder<Offset>(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInBack,
                  builder: (context, offset, child) {
                    return Transform.translate(
                      offset: offset,
                      child: child,
                    );
                  },
                  tween: widget.hideDescripTween,
                  child: PhysicalModel(
                    color: Colors.blueGrey.shade300,
                    elevation: 16.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: SelectableText(
                          '社會科學院大樓',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'NotoSans',
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                )),
            Spacer(
              flex: 1,
            ),
            Flexible(
                flex: 9,
                fit: FlexFit.loose,
                child: TweenAnimationBuilder<Offset>(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInBack,
                  builder: (context, offset, child) {
                    return Transform.translate(
                      offset: offset,
                      child: child,
                    );
                  },
                  tween: widget.hideExposTween,
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
                                fontSize: 16,
                                fontFamily: 'HKGrotesk',
                                color: Colors.black),
                          ),
                        )),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
