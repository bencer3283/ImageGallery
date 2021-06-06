import 'dart:js' as js;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animations/animations.dart';

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
        theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: SharedAxisPageTransitionsBuilder(
                  transitionType: SharedAxisTransitionType.scaled,
                  fillColor: Colors.black),
              TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
                  transitionType: SharedAxisTransitionType.scaled,
                  fillColor: Colors.black),
              TargetPlatform.windows: SharedAxisPageTransitionsBuilder(
                  transitionType: SharedAxisTransitionType.scaled,
                  fillColor: Colors.black),
            },
          ),
        ),
        routeInformationParser: _routeInformationParser,
        routerDelegate: _routerDelegate);
  }
}

class RoutePath {
  final int? albumIndex;
  final bool isViewer;

  RoutePath({this.albumIndex, required this.isViewer});
}

class GalleryRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  int? _selectedAlbum = null;
  int? _selectedPhoto = null;

  GalleryRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  RoutePath get currentConfiguration {
    if (_selectedPhoto == null) {
      return RoutePath(albumIndex: _selectedAlbum, isViewer: false);
    } else {
      return RoutePath(albumIndex: _selectedAlbum, isViewer: true);
    }
  }

  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    if (configuration.albumIndex == null) {
      _selectedPhoto = null;
      _selectedAlbum = null;
      notifyListeners();
    } else if (!configuration.isViewer) {
      _selectedAlbum = configuration.albumIndex;
      _selectedPhoto = null;
      notifyListeners();
    } else {
      _selectedAlbum = configuration.albumIndex;
      _selectedPhoto = 0;
      notifyListeners();
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
    //also declare a string in GalleryRouteInformationParser
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

  void _listener() {
    _currentOffset = 0.0;
  }

  final _entryControl = PageController();
  final _albumControl = ScrollController(initialScrollOffset: _currentOffset);
  final _albumControl2 = ScrollController(initialScrollOffset: _currentOffset);
  final _albumControl3 = ScrollController(initialScrollOffset: _currentOffset);

  final textStyle_albumTitle = TextStyle(
    fontSize: defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS
        ? 24
        : 50,
    fontFamily: 'HKGrotesk',
    color: Colors.grey.shade400,
    shadows: [
      Shadow(
          color: Colors.grey.shade700,
          offset: Offset(0.1, -0.1),
          blurRadius: 10)
    ],
    height: 1.15,
    leadingDistribution: TextLeadingDistribution.proportional,
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
    height: 1.15,
    leadingDistribution: TextLeadingDistribution.proportional,
  );

  @override
  void dispose() {
    _entryControl.dispose();
    _albumControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _entryControl.addListener(_listener);
    return Scaffold(
      body: Navigator(
        key: navigatorKey,
        pages: [
          MaterialPage(
            child: CustomScrollView(
                scrollDirection: Axis.vertical,
                controller: _entryControl,
                //onPageChanged: (value) => _currentOffset = 0.0,
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    sliver: SliverAppBar(
                      stretch: false,
                      floating: false,
                      pinned: true,
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 8),
                          child: Container(
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () => js.context.callMethod(
                                  'open', ['https://bencer3283.github.io/']),
                              child: Text('Learn more',
                                  style: TextStyle(
                                      fontFamily: "HKGrotesk",
                                      color: Colors.grey.shade700)),
                            ),
                          ),
                        )
                      ],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.blueGrey.shade800,
                      expandedHeight: MediaQuery.of(context).size.height / 2,
                      collapsedHeight: 72,
                      flexibleSpace: LayoutBuilder(
                        builder: (context, constraints) {
                          var h = constraints.maxHeight;
                          if (MediaQuery.of(context).size.height >
                              MediaQuery.of(context).size.width)
                            h = h / constraints.maxWidth * 240;

                          return FlexibleSpaceBar(
                            background: Container(
                              color: Colors.black,
                            ),
                            collapseMode: CollapseMode.pin,
                            centerTitle: false,
                            titlePadding:
                                EdgeInsets.only(left: 20.0, bottom: 12),
                            title: Text(
                              'Galley of\nCheng Po Sheng\'s\nPhotography',
                              style: GoogleFonts.playfairDisplay(
                                  textStyle: TextStyle(
                                fontSize:
                                    constraints.maxHeight < 80 ? 13.1 : h / 6.5,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade400,
                              )),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: NextPage(entryControl: _entryControl),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.9,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                        child: Stack(children: [
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
                                    textStyle_albumSubtitle:
                                        textStyle_albumSubtitle),
                              ),
                              GestureDetector(
                                  onTapUp: (details) => _homeToAlbum(1),
                                  child: PengHu(
                                      textStyle_albumTitle:
                                          textStyle_albumTitle,
                                      textStyle_albumSubtitle:
                                          textStyle_albumSubtitle)),
                              GestureDetector(
                                  onTapUp: (details) => _homeToAlbum(2),
                                  child: Airport(
                                      textStyle_albumTitle:
                                          textStyle_albumTitle,
                                      textStyle_albumSubtitle:
                                          textStyle_albumSubtitle)),
                              GestureDetector(
                                  onTapUp: (details) => _homeToAlbum(3),
                                  child: HuWeiTrain(
                                      textStyle_albumTitle:
                                          textStyle_albumTitle,
                                      textStyle_albumSubtitle:
                                          textStyle_albumSubtitle)),
                              GestureDetector(
                                  onTapUp: (details) => _homeToAlbum(4),
                                  child: TaitungLibrary(
                                      textStyle_albumTitle:
                                          textStyle_albumTitle,
                                      textStyle_albumSubtitle:
                                          textStyle_albumSubtitle)),
                            ],
                          ),
                          LastPage(entryControl: _entryControl),
                          Opacity(
                            opacity: defaultTargetPlatform ==
                                        TargetPlatform.android ||
                                    defaultTargetPlatform == TargetPlatform.iOS
                                ? 0
                                : 1.0,
                            child: LastAlbum(
                              albumControl: _albumControl,
                            ),
                          ),
                          Opacity(
                            opacity: defaultTargetPlatform ==
                                        TargetPlatform.android ||
                                    defaultTargetPlatform == TargetPlatform.iOS
                                ? 0
                                : 1.0,
                            child: NextAlbum(
                              albumControl: _albumControl,
                            ),
                          ),
                          NextPage(entryControl: _entryControl),
                        ]),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.9,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                        child: Stack(children: [
                          ListView(
                            controller: _albumControl2,
                            scrollDirection: Axis.horizontal,
                            children: [
                              GestureDetector(
                                onTapUp: (context) {
                                  _homeToAlbum(5);
                                },
                                child: CkShow(
                                    textStyle_albumTitle: textStyle_albumTitle,
                                    textStyle_albumSubtitle:
                                        textStyle_albumSubtitle),
                              ),
                              GestureDetector(
                                  onTapUp: (details) => _homeToAlbum(6),
                                  child: CkConstrution(
                                      textStyle_albumTitle:
                                          textStyle_albumTitle,
                                      textStyle_albumSubtitle:
                                          textStyle_albumSubtitle)),
                              GestureDetector(
                                  onTapUp: (details) => _homeToAlbum(7),
                                  child: CkpcSport(
                                      textStyle_albumTitle:
                                          textStyle_albumTitle,
                                      textStyle_albumSubtitle:
                                          textStyle_albumSubtitle)),
                              GestureDetector(
                                  onTapUp: (details) => _homeToAlbum(8),
                                  child: CkpcStage(
                                      textStyle_albumTitle:
                                          textStyle_albumTitle,
                                      textStyle_albumSubtitle:
                                          textStyle_albumSubtitle)),
                              GestureDetector(
                                  onTapUp: (details) => _homeToAlbum(9),
                                  child: CkpcEvent(
                                      textStyle_albumTitle:
                                          textStyle_albumTitle,
                                      textStyle_albumSubtitle:
                                          textStyle_albumSubtitle)),
                            ],
                          ),
                          LastPage(entryControl: _entryControl),
                          Opacity(
                            opacity: defaultTargetPlatform ==
                                        TargetPlatform.android ||
                                    defaultTargetPlatform == TargetPlatform.iOS
                                ? 0
                                : 1.0,
                            child: LastAlbum(
                              albumControl: _albumControl2,
                            ),
                          ),
                          Opacity(
                            opacity: defaultTargetPlatform ==
                                        TargetPlatform.android ||
                                    defaultTargetPlatform == TargetPlatform.iOS
                                ? 0
                                : 1.0,
                            child: NextAlbum(
                              albumControl: _albumControl2,
                            ),
                          ),
                          NextPage(entryControl: _entryControl),
                        ]),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.9,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                        child: Stack(children: [
                          ListView(
                            controller: _albumControl3,
                            scrollDirection: Axis.horizontal,
                            children: [
                              GestureDetector(
                                onTapUp: (context) {
                                  _homeToAlbum(10);
                                },
                                child: UK(
                                    textStyle_albumTitle: textStyle_albumTitle,
                                    textStyle_albumSubtitle:
                                        textStyle_albumSubtitle),
                              ),
                              GestureDetector(
                                  onTapUp: (details) => _homeToAlbum(11),
                                  child: Portugal(
                                      textStyle_albumTitle:
                                          textStyle_albumTitle,
                                      textStyle_albumSubtitle:
                                          textStyle_albumSubtitle)),
                              GestureDetector(
                                  onTapUp: (details) => _homeToAlbum(12),
                                  child: Turkey(
                                      textStyle_albumTitle:
                                          textStyle_albumTitle,
                                      textStyle_albumSubtitle:
                                          textStyle_albumSubtitle)),
                              GestureDetector(
                                  onTapUp: (details) => _homeToAlbum(13),
                                  child: Russia(
                                      textStyle_albumTitle:
                                          textStyle_albumTitle,
                                      textStyle_albumSubtitle:
                                          textStyle_albumSubtitle)),
                              GestureDetector(
                                  onTapUp: (details) => _homeToAlbum(14),
                                  child: Thai(
                                      textStyle_albumTitle:
                                          textStyle_albumTitle,
                                      textStyle_albumSubtitle:
                                          textStyle_albumSubtitle)),
                            ],
                          ),
                          LastPage(entryControl: _entryControl),
                          Opacity(
                            opacity: defaultTargetPlatform ==
                                        TargetPlatform.android ||
                                    defaultTargetPlatform == TargetPlatform.iOS
                                ? 0
                                : 1.0,
                            child: LastAlbum(
                              albumControl: _albumControl3,
                            ),
                          ),
                          Opacity(
                            opacity: defaultTargetPlatform ==
                                        TargetPlatform.android ||
                                    defaultTargetPlatform == TargetPlatform.iOS
                                ? 0
                                : 1.0,
                            child: NextAlbum(
                              albumControl: _albumControl3,
                            ),
                          ),
                        ]),
                      ),
                    ]),
                  )
                ]),
          ),
          if (_selectedAlbum != null)
            AlbumGridPage(
              childWidget: AlbumGrid(
                handleTap: _gridToViewer,
                album: albums[_selectedAlbum ?? 0],
              ),
              //key: ValueKey('album in grid view')
            ),
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
}

class GalleryRouteInformationParser extends RouteInformationParser<RoutePath> {
  final List<String> albums = [
    //featured
    'ntuclose',
    'penghu',
    'airport',
    'huweitrain',
    'taitungLibrary',
    //ckpc
    'ckshow',
    'ckconstruction',
    'ckpcsport',
    'ckpcstage',
    'ckpcevent',
    //traval
    'uk',
    'portugal',
    'turkey',
    'russia',
    'thai'
  ];
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!).pathSegments;
    // Handle '/'

    // if (uri.pathSegments.length == 0) {
    //   return BookRoutePath.home();
    // }

    // Handle '/ntuclose/'
    if (uri.length == 0) {
      return RoutePath(isViewer: false);
    } else if (uri.last == 'viewer') {
      return RoutePath(
          isViewer: true, albumIndex: albums.indexOf(uri[uri.length - 2]));
    } else if (albums.contains(uri.last)) {
      return RoutePath(isViewer: false, albumIndex: albums.indexOf(uri.last));
    } else
      return RoutePath(isViewer: false);
  }

  @override
  RouteInformation restoreRouteInformation(RoutePath path) {
    if (path.isViewer) {
      return RouteInformation(location: '/${albums[path.albumIndex!]}/viewer');
    } else if (path.albumIndex != null) {
      return RouteInformation(location: '/${albums[path.albumIndex!]}');
    } else
      return RouteInformation(location: '/');
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
          onPressed: () {
            _entryControl.previousPage(
                duration: Duration(milliseconds: 450), curve: Curves.easeInOut);
            _currentOffset = 0.0;
          },
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
          onPressed: () {
            _entryControl.nextPage(
                duration: Duration(milliseconds: 450), curve: Curves.easeInOut);
            _currentOffset = 0.0;
          },
          padding: EdgeInsets.only(bottom: 40),
        ));
  }
}

class AlbumGridPage extends Page {
  AlbumGridPage({required this.childWidget});
  final childWidget;
  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) {
          return FadeScaleTransition(
            animation: animation1,
            child: childWidget,
          );
        },
        settings: this);
  }
}
