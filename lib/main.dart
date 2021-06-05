import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'albums/load_album_ntuclose.dart';
import 'albums/load_album_penghu.dart';
import 'albums/load_album_airport.dart';
import 'albums/load_album_ckconstruction.dart';
import 'albums/load_album_ckpcevent.dart';
import 'albums/load_album_ckpcsport.dart';
import 'albums/load_album_ckpcstage.dart';
import 'albums/load_album_ckshow.dart';
import 'albums/load_album_huweitrain.dart';
import 'albums/load_album_portugal.dart';
import 'albums/load_album_russia.dart';
import 'albums/load_album_taitungLibrary.dart';
import 'albums/load_album_thai.dart';
import 'albums/load_album_turkey.dart';
import 'albums/load_album_uk.dart';

import 'Viewer.dart';
import 'AlbumGrid.dart';

import 'albums/album.dart';

var _currentOffset = 0.0;

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GalleryRouterDelegate _routerDelegate = GalleryRouterDelegate();
  GalleryRouteInformationParser _routeInformationParser =
      GalleryRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Gallery of Cheng Po Sheng\'s photography',
        routeInformationParser: _routeInformationParser,
        routerDelegate: _routerDelegate);
  }
}

class RoutePath {
  final String name;

  RoutePath.ntuclose() : name = 'ntuclose';
  RoutePath.ntucloseViewer() : name = 'ntucloseViewer';

  bool get isntuclose => name == 'ntuclose';
  bool get isntucloseViewer => name == 'ntucloseViewer';
}

class GalleryRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  int? _selectedAlbum = null;
  int? _selectedPhoto = null;

  GalleryRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  RoutePath get currentConfiguration {
    if (_selectedPhoto == null) {
      return RoutePath.ntuclose();
    } else {
      return RoutePath.ntucloseViewer();
    }
  }

  void _gridToViewer(int i) {
    _selectedPhoto = i;
    notifyListeners();
  }

  void _homeToAlbum(int i) {
    _selectedAlbum = i;
    notifyListeners();
  }

  final List<Album> albums = [
    //featured
    ntuclose,
    penghu,
    airport,
    huweitrain,
    taitungLibrary,
    //ckpc
    ckshow,
    ckconstruction,
    ckpcsport,
    ckpcstage,
    ckpcevent,
    //traval
    uk,
    portugal,
    turkey,
    russia,
    thai
  ];

  final _entryControl = PageController();
  final _albumControl = ScrollController();
  final _album2Control = ScrollController();
  final _album3Control = ScrollController();

  final textStyle_albumTitle = TextStyle(
    fontSize: defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS
        ? 36
        : 70,
    fontFamily: 'HKGrotesk',
    color: Colors.grey.shade400,
    shadows: [
      Shadow(
          color: Colors.grey.shade700,
          offset: Offset(0.1, -0.1),
          blurRadius: 10)
    ],
  );

  final textStyle_albumSubtitle = TextStyle(
    fontFamily: 'NotoSans',
    fontSize: defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS
        ? 24
        : 30,
    color: Colors.grey.shade400,
    shadows: [
      Shadow(
          color: Colors.grey.shade700,
          offset: Offset(0.1, -0.1),
          blurRadius: 10)
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: navigatorKey,
        pages: [
          MaterialPage(
            child: PageView(
                scrollDirection: Axis.vertical,
                controller: _entryControl,
                onPageChanged: (value) => _currentOffset = 0.0,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(children: [
                      Text(
                        'Galley of\nCheng Po Sheng\'s\nPhotography',
                        style: GoogleFonts.playfairDisplay(
                            textStyle: TextStyle(
                          fontSize: defaultTargetPlatform ==
                                      TargetPlatform.android ||
                                  defaultTargetPlatform == TargetPlatform.iOS
                              ? 60
                              : 80,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade400,
                        )),
                      ),
                      NextPage(entryControl: _entryControl)
                    ]),
                  ),
                  Stack(children: [
                    ListView(
                      controller: _albumControl,
                      scrollDirection: Axis.horizontal,
                      children: [
                        GestureDetector(
                          onTapUp: (context) {
                            _homeToAlbum(0);
                          },
                          child: NtuClose(
                              textStyle_albumTitle: textStyle_albumTitle,
                              textStyle_albumSubtitle: textStyle_albumSubtitle),
                        ),
                        GestureDetector(
                            onTapUp: (details) => _homeToAlbum(1),
                            child: PengHu(
                                textStyle_albumTitle: textStyle_albumTitle,
                                textStyle_albumSubtitle:
                                    textStyle_albumSubtitle)),
                        GestureDetector(
                            onTapUp: (details) => _homeToAlbum(2),
                            child: Airport(
                                textStyle_albumTitle: textStyle_albumTitle,
                                textStyle_albumSubtitle:
                                    textStyle_albumSubtitle)),
                        GestureDetector(
                            onTapUp: (details) => _homeToAlbum(3),
                            child: HuWeiTrain(
                                textStyle_albumTitle: textStyle_albumTitle,
                                textStyle_albumSubtitle:
                                    textStyle_albumSubtitle)),
                        GestureDetector(
                            onTapUp: (details) => _homeToAlbum(4),
                            child: TaitungLibrary(
                                textStyle_albumTitle: textStyle_albumTitle,
                                textStyle_albumSubtitle:
                                    textStyle_albumSubtitle)),
                      ],
                    ),
                    LastPage(entryControl: _entryControl),
                    LastAlbum(
                      albumControl: _albumControl,
                    ),
                    NextAlbum(
                      albumControl: _albumControl,
                    ),
                    NextPage(entryControl: _entryControl),
                  ]),
                  Stack(children: [
                    ListView(
                      controller: _albumControl,
                      scrollDirection: Axis.horizontal,
                      children: [
                        GestureDetector(
                          onTapUp: (context) {
                            _homeToAlbum(5);
                          },
                          child: CkShow(
                              textStyle_albumTitle: textStyle_albumTitle,
                              textStyle_albumSubtitle: textStyle_albumSubtitle),
                        ),
                        GestureDetector(
                            onTapUp: (details) => _homeToAlbum(6),
                            child: CkConstrution(
                                textStyle_albumTitle: textStyle_albumTitle,
                                textStyle_albumSubtitle:
                                    textStyle_albumSubtitle)),
                        GestureDetector(
                            onTapUp: (details) => _homeToAlbum(7),
                            child: CkpcSport(
                                textStyle_albumTitle: textStyle_albumTitle,
                                textStyle_albumSubtitle:
                                    textStyle_albumSubtitle)),
                        GestureDetector(
                            onTapUp: (details) => _homeToAlbum(8),
                            child: CkpcStage(
                                textStyle_albumTitle: textStyle_albumTitle,
                                textStyle_albumSubtitle:
                                    textStyle_albumSubtitle)),
                        GestureDetector(
                            onTapUp: (details) => _homeToAlbum(9),
                            child: CkpcEvent(
                                textStyle_albumTitle: textStyle_albumTitle,
                                textStyle_albumSubtitle:
                                    textStyle_albumSubtitle)),
                      ],
                    ),
                    LastPage(entryControl: _entryControl),
                    LastAlbum(
                      albumControl: _albumControl,
                    ),
                    NextAlbum(
                      albumControl: _albumControl,
                    ),
                    NextPage(entryControl: _entryControl),
                  ]),
                  Stack(children: [
                    ListView(
                      controller: _albumControl,
                      scrollDirection: Axis.horizontal,
                      children: [
                        GestureDetector(
                          onTapUp: (context) {
                            _homeToAlbum(10);
                          },
                          child: UK(
                              textStyle_albumTitle: textStyle_albumTitle,
                              textStyle_albumSubtitle: textStyle_albumSubtitle),
                        ),
                        GestureDetector(
                            onTapUp: (details) => _homeToAlbum(11),
                            child: Portugal(
                                textStyle_albumTitle: textStyle_albumTitle,
                                textStyle_albumSubtitle:
                                    textStyle_albumSubtitle)),
                        GestureDetector(
                            onTapUp: (details) => _homeToAlbum(12),
                            child: Turkey(
                                textStyle_albumTitle: textStyle_albumTitle,
                                textStyle_albumSubtitle:
                                    textStyle_albumSubtitle)),
                        GestureDetector(
                            onTapUp: (details) => _homeToAlbum(13),
                            child: Russia(
                                textStyle_albumTitle: textStyle_albumTitle,
                                textStyle_albumSubtitle:
                                    textStyle_albumSubtitle)),
                        GestureDetector(
                            onTapUp: (details) => _homeToAlbum(14),
                            child: Thai(
                                textStyle_albumTitle: textStyle_albumTitle,
                                textStyle_albumSubtitle:
                                    textStyle_albumSubtitle)),
                      ],
                    ),
                    LastPage(entryControl: _entryControl),
                    LastAlbum(
                      albumControl: _albumControl,
                    ),
                    NextAlbum(
                      albumControl: _albumControl,
                    ),
                  ]),
                ]),
          ),
          if (_selectedAlbum != null)
            MaterialPage(
                child: AlbumGrid(
                  handleTap: _gridToViewer,
                  album: albums[_selectedAlbum ?? 0],
                ),
                key: ValueKey('album in grid view')),
          if (_selectedPhoto != null)
            CupertinoPage(
              child: Viewer(
                initialIndex: _selectedPhoto,
                album: albums[_selectedAlbum ?? 0],
              ),
              key: ValueKey('photo viewer'),
            ),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          if (_selectedAlbum != null && _selectedPhoto != null) {
            _selectedPhoto = null;
          } else if (_selectedAlbum != null && _selectedPhoto == null) {
            _selectedAlbum = null;
          }
          notifyListeners();
          return true;
        },
      ),
      backgroundColor: Colors.black,
    );
  }

  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    if (configuration.isntuclose) {
      _selectedPhoto = null;
      notifyListeners();
    } else if (configuration.isntucloseViewer) {
      _selectedPhoto = 0;
      notifyListeners();
    }
    ;
  }
}

class NextAlbum extends StatelessWidget {
  NextAlbum({
    Key? key,
    required ScrollController albumControl,
  })  : _albumControl = albumControl,
        super(key: key);

  final ScrollController _albumControl;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          icon: Icon(
            Icons.arrow_forward_rounded,
            color: Colors.grey.shade400,
            size: 60,
          ),
          onPressed: () {
            _currentOffset++;
            _albumControl.animateTo(
                MediaQuery.of(context).size.width * 0.6 * _currentOffset,
                duration: Duration(milliseconds: 450),
                curve: Curves.easeInOut);
          },
          padding: EdgeInsets.only(right: 48),
        ));
  }
}

class LastAlbum extends StatelessWidget {
  LastAlbum({
    Key? key,
    required ScrollController albumControl,
  })  : _albumControl = albumControl,
        super(key: key);

  final ScrollController _albumControl;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.amber.shade200,
              size: 60,
            ),
            onPressed: () {
              _currentOffset--;
              _albumControl.animateTo(
                  MediaQuery.of(context).size.width * 0.6 * _currentOffset,
                  duration: Duration(milliseconds: 450),
                  curve: Curves.easeInOut);
            }
            //padding: EdgeInsets.only(left: 40),
            ));
  }
}

class LastPage extends StatelessWidget {
  const LastPage({
    Key? key,
    required PageController entryControl,
  })  : _entryControl = entryControl,
        super(key: key);

  final PageController _entryControl;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: IconButton(
          icon: Icon(
            Icons.arrow_upward_rounded,
            color: Colors.pink.shade100,
            size: 60,
          ),
          onPressed: () => _entryControl.previousPage(
              duration: Duration(milliseconds: 450), curve: Curves.easeInOut),
          padding: EdgeInsets.only(right: 8),
        ));
  }
}

class NextPage extends StatelessWidget {
  const NextPage({
    Key? key,
    required PageController entryControl,
  })  : _entryControl = entryControl,
        super(key: key);

  final PageController _entryControl;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: IconButton(
          icon: Icon(
            Icons.arrow_downward_rounded,
            color: Colors.green.shade200,
            size: 60,
          ),
          onPressed: () => _entryControl.nextPage(
              duration: Duration(milliseconds: 450), curve: Curves.easeInOut),
          padding: EdgeInsets.only(bottom: 40),
        ));
  }
}

class GalleryRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    // Handle '/'

    // if (uri.pathSegments.length == 0) {
    //   return BookRoutePath.home();
    // }

    // Handle '/ntuclose/'
    if (uri.pathSegments.toString() == '/ntuclose/') {
      return RoutePath.ntuclose();
    }

    if (uri.pathSegments.toString() == '/ntuclose/viewer/') {
      return RoutePath.ntucloseViewer();
    }

    // Handle unknown routes
    return RoutePath.ntuclose();
  }

  @override
  RouteInformation restoreRouteInformation(RoutePath path) {
    if (path.isntuclose) {
      return RouteInformation(location: '/ntuclose/');
    }
    if (path.isntucloseViewer) {
      return RouteInformation(location: '/ntuclose/viewer/');
    }
    return RouteInformation(location: '/');
  }
}
