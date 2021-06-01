import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'load_album_ntuclose.dart';
import 'load_album_penghu.dart';

import 'Viewer.dart';
import 'AlbumGrid.dart';

import 'album.dart';

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

  final List<Album> albums = [ntuclose, penghu];

  final _entryControl = PageController();
  final _albumControl = PageController();

  double _upOpa = 0;

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
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_downward_rounded,
                              color: Colors.green.shade200,
                              size: 60,
                            ),
                            onPressed: () => _entryControl.nextPage(
                                duration: Duration(milliseconds: 450),
                                curve: Curves.easeInOut),
                            padding: EdgeInsets.only(bottom: 40),
                          ))
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
                          child: Container(
                            margin: EdgeInsets.all(8),
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Colors.blueGrey.shade500, width: 10),
                                image: DecorationImage(
                                  image: ntuclose.photosList()[14].image,
                                  fit: BoxFit.contain,
                                  alignment: Alignment.centerRight,
                                )),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      'NTU\nUnder Covid',
                                      style: TextStyle(
                                        fontSize: 70,
                                        fontFamily: 'HKGrotesk',
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text('#上學計畫: 臺大封校的疫情紀實',
                                        style: TextStyle(
                                          fontFamily: 'NotoSans',
                                          fontSize: 30,
                                          color: Colors.grey.shade400,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTapUp: (details) => _homeToAlbum(1),
                            child: Container(
                              margin: EdgeInsets.all(8),
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Colors.blueGrey.shade500, width: 10),
                                image: DecorationImage(
                                  image: penghu.photosList()[14].image,
                                  fit: BoxFit.contain,
                                  alignment: Alignment.bottomRight,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Text(
                                        'Peng-Hu, 2021',
                                        style: TextStyle(
                                          fontSize: 70,
                                          fontFamily: 'HKGrotesk',
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Text('冬天的澎湖: 漁獲與風沙',
                                          style: TextStyle(
                                            fontFamily: 'NotoSans',
                                            fontSize: 30,
                                            color: Colors.grey.shade400,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_upward_rounded,
                            color: Colors.pink.shade100,
                            size: 60,
                          ),
                          onPressed: () => _entryControl.previousPage(
                              duration: Duration(milliseconds: 450),
                              curve: Curves.easeInOut),
                          padding: EdgeInsets.only(right: 8),
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.amber.shade200,
                            size: 60,
                          ),
                          onPressed: () => _albumControl.previousPage(
                              duration: Duration(milliseconds: 450),
                              curve: Curves.easeInOut),
                          //padding: EdgeInsets.only(left: 40),
                        )),
                    Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.grey.shade400,
                            size: 60,
                          ),
                          onPressed: () => _albumControl.nextPage(
                              duration: Duration(milliseconds: 450),
                              curve: Curves.easeInOut),
                          padding: EdgeInsets.only(right: 48),
                        )),
                  ])
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
