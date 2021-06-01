import 'package:flutter/material.dart';
import 'package:gallery/album.dart';
import 'package:flutter/foundation.dart';

class BottomInfo extends StatefulWidget {
  BottomInfo({
    Key? key,
    required this.hideNumberTween,
    required this.hideDescripTween,
    required this.hideExposTween,
    required this.photoIndex,
    required this.currentAlbum,
  }) : super(key: key);

  var hideNumberTween = Tween<Offset>(begin: Offset.zero, end: Offset.zero);
  var hideDescripTween = Tween<Offset>(begin: Offset.zero, end: Offset.zero);
  var hideExposTween = Tween<Offset>(begin: Offset.zero, end: Offset.zero);

  var photoIndex;
  Album currentAlbum;

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
                                '${widget.photoIndex + 1}',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'HKGrotesk',
                                    color: Colors.black),
                              ),
                              Text(
                                '/${widget.currentAlbum.photosList().length}',
                                style: TextStyle(
                                    fontSize: 16,
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
                          '${widget.currentAlbum.photos[widget.photoIndex].des}',
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
                            '${widget.currentAlbum.photos[widget.photoIndex].exp}',
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
