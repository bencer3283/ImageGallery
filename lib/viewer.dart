import 'dart:async';

import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'BottomInfo.dart';
import 'albums/album.dart';

class Viewer extends StatefulWidget {
  Viewer({Key? key, required this.initialIndex, required this.album})
      : super(key: key);

  final initialIndex;
  final Album album;

  @override
  _ViewerState createState() => _ViewerState();
}

class _ViewerState extends State<Viewer>
    with AfterLayoutMixin<Viewer>, TickerProviderStateMixin {
  void nextImage() {
    pagecontrol.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  void previousImage() {
    pagecontrol.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  void goBack() {
    Navigator.of(context).pop();
  }

  void toggleUI() {
    if (!isHide) {
      hideUI();
    } else if (isHide) {
      showUI();
    }
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Timer(Duration(milliseconds: 1500), () {
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

  var _interactiveviewcontrol = TransformationController();

  Animation<Matrix4>? doubletap;

  late AnimationController doubletapControl;

  bool _loadFullRes = false;
  bool _ignoreSlide = false;

  var currentIndex = 0;

  late TapDownDetails tapposition;

  late final pagecontrol;

  @override
  @override
  void initState() {
    super.initState();
    doubletapControl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    pagecontrol = PageController(initialPage: widget.initialIndex);
    currentIndex = widget.initialIndex;
  }

  @override
  void dispose() {
    doubletapControl.dispose();
    pagecontrol.dispose();
    _interactiveviewcontrol.dispose();

    super.dispose();
  }

  void _onAnimateReset() {
    _interactiveviewcontrol.value = doubletap!.value;
    if (!doubletapControl.isAnimating) {
      doubletap!.removeListener(_onAnimateReset);
      doubletap = null;
      doubletapControl.reset();
    }
  }

  FocusNode keyboardNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => toggleUI(),
      onDoubleTapDown: (details) {
        tapposition = details;
      },
      onDoubleTap: () {
        if (_interactiveviewcontrol.value.entry(1, 1) != 1 ||
            _interactiveviewcontrol.value.entry(2, 2) != 1) {
          doubletapControl.reset();
          doubletap = Matrix4Tween(
                  begin: _interactiveviewcontrol.value, end: Matrix4.identity())
              .animate(CurveTween(curve: Curves.easeInOutQuart)
                  .animate(doubletapControl));
          doubletap!.addListener(_onAnimateReset);
          doubletapControl.forward();
          setState(() {
            _ignoreSlide = false;
          });
          Timer(Duration(milliseconds: 200), () {
            setState(() {
              _interactiveviewcontrol.value = Matrix4.identity();
            });
          });
        } else {
          doubletapControl.reset();
          doubletap = Matrix4Tween(
                  begin: Matrix4.identity(),
                  end: Matrix4.identity()
                    ..translate(-tapposition.localPosition.dx * 2,
                        -tapposition.localPosition.dy * 2)
                    ..scale(3.0))
              .animate(CurveTween(curve: Curves.easeInOutQuart)
                  .animate(doubletapControl));
          doubletap!.addListener(_onAnimateReset);
          doubletapControl.forward();
          setState(() {
            _ignoreSlide = true;
          });
          Timer(Duration(milliseconds: 200), () {
            setState(() {
              _interactiveviewcontrol.value = Matrix4.identity()
                ..translate(-tapposition.localPosition.dx * 2,
                    -tapposition.localPosition.dy * 2)
                ..scale(3.0);
            });
          });
          if (!_loadFullRes) {
            setState(() {
              _loadFullRes = true;
            });
          }
        }
      },
      child: RawKeyboardListener(
        autofocus: true,
        focusNode: keyboardNode,
        onKey: (value) {
          if (value.logicalKey == LogicalKeyboardKey.arrowRight) {
            nextImage();
          } else if (value.logicalKey == LogicalKeyboardKey.arrowLeft) {
            previousImage();
          }
        },
        child: Stack(
          children: [
            Container(
              color: Colors.black,
            ),
            InteractiveViewer(
              maxScale: 5.0,
              transformationController: _interactiveviewcontrol,
              onInteractionEnd: (details) {
                if (!_loadFullRes) {
                  setState(() {
                    _loadFullRes = true;
                  });
                }
                if (_interactiveviewcontrol.value.entry(1, 1) != 1 ||
                    _interactiveviewcontrol.value.entry(2, 2) != 1) {
                  setState(() {
                    _ignoreSlide = true;
                  });
                } else {
                  setState(() {
                    _ignoreSlide = false;
                  });
                }
              },
              child: IgnorePointer(
                ignoring: _ignoreSlide,
                child: PageView.builder(
                  itemBuilder: (context, i) {
                    return Center(
                        child: _loadFullRes
                            ? widget.album.photosFullList()[i]
                            : Hero(
                                tag: i, child: widget.album.photosList()[i]));
                  },
                  itemCount: widget.album.photosList().length,
                  controller: pagecontrol,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                      _loadFullRes = false;
                    });
                    // if (!isHide) {
                    //   Timer(Duration(seconds: 5), () {
                    //     hideUI();
                    //   });
                    //}
                  },
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: MouseRegion(
                    opaque: false,
                    onEnter: (event) {
                      if (isHide) {
                        showUI();
                      }
                    },
                    onExit: (event) {
                      if (!isHide) {
                        Timer(Duration(milliseconds: 0), () {
                          hideUI();
                        });
                      }
                    },
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: TweenAnimationBuilder<Offset>(
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
                              )),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TweenAnimationBuilder<Offset>(
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
                                )),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.centerRight,
                  child: MouseRegion(
                    opaque: false,
                    onEnter: (event) {
                      if (isHide) {
                        showUI();
                      }
                    },
                    onExit: (event) {
                      if (!isHide) {
                        Timer(Duration(milliseconds: 0), () {
                          hideUI();
                        });
                      }
                    },
                    child: TweenAnimationBuilder<Offset>(
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
                  ),
                )
              ],
            ),
            BottomInfo(
              hideNumberTween: bottomInfoHideNumberTween,
              hideDescripTween: bottomInfoHideDescripTween,
              hideExposTween: bottomInfoHideExposTween,
              photoIndex: currentIndex,
              currentAlbum: widget.album,
            ),
          ],
        ),
      ),
    );
  }
}
