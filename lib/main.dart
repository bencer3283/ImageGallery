import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

import 'load_album_ntuclose.dart';
import 'load_album_penghu.dart';

import 'Viewer.dart';
import 'AlbumGrid.dart';

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

  int? _selectedAlbum = 0;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: navigatorKey,
        pages: [
          if (_selectedAlbum != null)
            MaterialPage(
                child: AlbumGrid(
                  handleTap: _gridToViewer,
                  album: ntuclose,
                ),
                key: ValueKey('album in grid view')),
          if (_selectedPhoto != null)
            CupertinoPage(
              child: Viewer(
                initialIndex: _selectedPhoto,
                album: ntuclose,
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
