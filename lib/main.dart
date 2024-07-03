import 'dart:js' as js;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animations/animations.dart';

import 'Viewer.dart';
import 'AlbumGrid.dart';

import 'albums/album.dart';
import 'gdrive.dart';

var _currentOffset = 0.0;
late final List<Map<String, String>> albumList;
Uri? initialRoute;
RoutePath? initialRoutePath;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Store the initial route
  final initialRouteName =
      WidgetsBinding.instance.platformDispatcher.defaultRouteName;
  if (initialRouteName != '/') {
    initialRoute = Uri.parse(initialRouteName);
  }

  if (defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }
  albumList = await listAlbums();
  print(albumList);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<bool> isFetched;
  List<Album> gallery = [];
  late GalleryRouterDelegate _routerDelegate;
  late GalleryRouteInformationParser _routeInformationParser;

  Future<bool> fetchGallery() async {
    final albumsStream = constructAlbumStream(albumList);
    await for (final album in albumsStream) {
      setState(() {
        this.gallery.add(album);
      });
    }
    _routerDelegate = GalleryRouterDelegate(this.gallery);
    _routeInformationParser = GalleryRouteInformationParser(albumList);
    if (initialRoute != null) {
      initialRoutePath = await _routeInformationParser
          .parseRouteInformation(RouteInformation(uri: initialRoute));
      initialRoute = null; // Clear the initial route
    }

    return true;
  }

  @override
  void initState() {
    super.initState();
    isFetched = fetchGallery();
  }

  @override
  void reassemble() {
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: this.isFetched,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!) {
          // Apply the initial route if it exists

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
            routerDelegate: _routerDelegate,
          );
        } else {
          final colors = [
            Colors.green.shade200,
            Colors.yellow.shade300,
            Colors.red.shade100,
            Colors.blueGrey.shade500
          ];
          return MaterialApp(
            home: Scaffold(
              body: Container(
                decoration: BoxDecoration(color: Colors.black),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(
                        flex: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'loading albums',
                          style: TextStyle(
                            fontFamily: 'HKGrotesk',
                            fontSize: defaultTargetPlatform ==
                                        TargetPlatform.android ||
                                    defaultTargetPlatform == TargetPlatform.iOS
                                ? 21
                                : 30,
                            color: Colors.grey.shade300,
                            shadows: [
                              Shadow(
                                  color: Colors.grey.shade700,
                                  offset: Offset(0.1, -0.1),
                                  blurRadius: 10)
                            ],
                            height: 1.15,
                            leadingDistribution:
                                TextLeadingDistribution.proportional,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: TweenAnimationBuilder<Color?>(
                            tween: ColorTween(
                              begin: colors[gallery.length % 4],
                              end: colors[gallery.length % 4 == 3
                                  ? 0
                                  : gallery.length % 4 + 1],
                            ),
                            duration: Duration(milliseconds: 200),
                            builder: (context, value, child) =>
                                CircularProgressIndicator(
                              value: gallery.length / albumList.length,
                              backgroundColor: Colors.grey.shade500,
                              strokeWidth: 16,
                              valueColor: AlwaysStoppedAnimation(value),
                              strokeCap: StrokeCap.round,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${gallery.length} / ${albumList.length}',
                          style: TextStyle(
                            fontFamily: 'HKGrotesk',
                            fontSize: defaultTargetPlatform ==
                                        TargetPlatform.android ||
                                    defaultTargetPlatform == TargetPlatform.iOS
                                ? 21
                                : 30,
                            color: Colors.grey.shade300,
                            shadows: [
                              Shadow(
                                  color: Colors.grey.shade700,
                                  offset: Offset(0.1, -0.1),
                                  blurRadius: 10)
                            ],
                            height: 1.15,
                            leadingDistribution:
                                TextLeadingDistribution.proportional,
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 5,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class RoutePath {
  final int? albumIndex;
  final int? photoIndex;
  final bool isViewer;

  RoutePath({this.albumIndex, this.photoIndex, required this.isViewer});
}

class GalleryRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  late final GlobalKey<NavigatorState> navigatorKey;

  int? _selectedAlbum = null;
  int? _selectedPhoto = null;

  GalleryRouterDelegate(albums) {
    this.navigatorKey = GlobalKey<NavigatorState>();
    this.albums = albums;
  }

  RoutePath get currentConfiguration {
    if (_selectedAlbum == null) {
      return RoutePath(isViewer: false);
    } else if (_selectedPhoto == null) {
      return RoutePath(isViewer: false, albumIndex: _selectedAlbum);
    } else {
      return RoutePath(
          isViewer: true,
          albumIndex: _selectedAlbum,
          photoIndex: _selectedPhoto);
    }
  }

  @override
  Future<void> setNewRoutePath(RoutePath config) async {
    if (config.albumIndex == null) {
      // home
      _selectedPhoto = null;
      _selectedAlbum = null;
      notifyListeners();
    } else if (!config.isViewer) {
      // album grid view
      _selectedAlbum = config.albumIndex;
      _selectedPhoto = null;
      notifyListeners();
    } else if (config.photoIndex == null) {
      // no photo index -> album viewer photo 0
      _selectedAlbum = config.albumIndex;
      _selectedPhoto = 0;
      notifyListeners();
    } else {
      // album viewer photo x
      _selectedAlbum = config.albumIndex;
      _selectedPhoto = config.photoIndex;
      notifyListeners();
    }
  }

  @override
  Future<void> setInitialRoutePath(RoutePath configuration) async {
    if (initialRoutePath != null) {
      setNewRoutePath(initialRoutePath!);
    } else {
      setNewRoutePath(configuration);
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

  @override
  Future<bool> popRoute() {
    if (_selectedAlbum != null && _selectedPhoto != null) {
      setNewRoutePath(RoutePath(isViewer: false, albumIndex: _selectedAlbum));
    } else if (_selectedAlbum != null && _selectedPhoto == null) {
      setNewRoutePath(RoutePath(isViewer: false));
    } else {
      return SynchronousFuture<bool>(false);
    }
    return SynchronousFuture<bool>(true);
  }

  late final List<Album> albums;
  //  = [
  //   //also declare a string in GalleryRouteInformationParser
  //   //featured
  //   ntuclose,
  //   penghu,
  //   airport,
  //   huweitrain,
  //   taitungLibrary,
  //   //ckpc
  //   ckshow,
  //   ckconstruction,
  //   ckpcsport,
  //   ckpcstage,
  //   ckpcevent,
  //   //traval
  //   uk,
  //   portugal,
  //   turkey,
  //   russia,
  //   thai
  // ];

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
        : 40,
    fontFamily: 'HKGrotesk',
    color: Colors.grey.shade300,
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
    color: Colors.grey.shade300,
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
                            h = h /
                                (MediaQuery.of(context).size.height / 2) *
                                constraints.maxWidth /
                                2;

                          return FlexibleSpaceBar(
                            background: Container(
                              color: Colors.black,
                            ),
                            collapseMode: CollapseMode.pin,
                            centerTitle: false,
                            titlePadding:
                                EdgeInsets.only(left: 20.0, bottom: 12),
                            title: Text(
                              'Gallery of\nCheng Po Sheng\'s\nPhotography',
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
                  SliverToBoxAdapter(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: NextPage(entryControl: _entryControl),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(right: 16, left: 16),
                    sliver: SliverGrid.count(
                        crossAxisCount: MediaQuery.of(context).size.width >
                                MediaQuery.of(context).size.height
                            ? 2
                            : 1,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        children: List.generate(
                            albums.length,
                            (index) => GestureDetector(
                                  onTapUp: (details) {
                                    _homeToAlbum(index);
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.9,
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueGrey.shade500,
                                            width: 8),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        image: DecorationImage(
                                            image: albums[index]
                                                .photos[0]
                                                .thumbnail
                                                .image,
                                            fit: BoxFit.contain,
                                            alignment: Alignment.bottomRight)),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        children: [
                                          Text(
                                            albums[index].title,
                                            style: textStyle_albumSubtitle,
                                          ),
                                          Text(albums[index].titleEng,
                                              style: textStyle_albumTitle)
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                      ),
                                    ),
                                  ),
                                ))),
                  ),
                ]),
          ),
          if (_selectedAlbum != null)
            AlbumGridPage(
                childWidget: AlbumGrid(
                  handleTap: _gridToViewer,
                  album: albums[_selectedAlbum ?? 0],
                ),
                key: ValueKey(albums[_selectedAlbum!].titleEng)),
          if (_selectedPhoto != null)
            CupertinoPage(
              child: Viewer(
                initialIndex: _selectedPhoto,
                album: albums[_selectedAlbum ?? 0],
              ),
              key: ValueKey(albums[_selectedAlbum!].titleEng +
                  ' photo viewer: ' +
                  _selectedPhoto.toString()),
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
  late final List<String> albums;

  @override
  GalleryRouteInformationParser(list) {
    this.albums = [for (var i = 0; i < list.length; i++) list[i]['name']!];
  }

  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final pathSeg = routeInformation.uri.pathSegments;

    if (pathSeg.isNotEmpty && albums.contains(pathSeg[0])) {
      if (pathSeg.length == 1) {
        // album home
        return RoutePath(
            isViewer: false, albumIndex: albums.indexOf(pathSeg[0]));
      } else if (pathSeg.length >= 2 && pathSeg.contains('viewer')) {
        if (pathSeg.length == 3) {
          // album specified photo
          final photoIdx = int.tryParse(pathSeg[2]) ?? 1;
          return RoutePath(
              isViewer: true,
              albumIndex: albums.indexOf(pathSeg[0]),
              photoIndex: photoIdx - 1);
        } else {
          // album photo 0
          return RoutePath(
              isViewer: true,
              albumIndex: albums.indexOf(pathSeg[0]),
              photoIndex: 0);
        }
      } else {
        return RoutePath(
            isViewer: false, albumIndex: albums.indexOf(pathSeg[0]));
      }
    } else {
      // gallery home
      return RoutePath(isViewer: false);
    }
  }

  @override
  RouteInformation restoreRouteInformation(RoutePath route) {
    if (route.albumIndex == null) {
      return RouteInformation(uri: Uri.parse('/'));
    } else {
      if (route.isViewer) {
        if (route.photoIndex == null) {
          return RouteInformation(
              uri: Uri.parse('/${albums[route.albumIndex!]}/viewer'));
        } else {
          return RouteInformation(
              uri: Uri.parse(
                  '/${albums[route.albumIndex!]}/viewer/${route.photoIndex! + 1}'));
        }
      } else {
        return RouteInformation(
            uri: Uri.parse('/${albums[route.albumIndex!]}'));
      }
    }
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
        child: IconButton.outlined(
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
        child: PhysicalModel(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(40),
          child: IconButton(
            alignment: Alignment.bottomCenter,
            iconSize: 50,
            color: Colors.green.shade200,
            icon: Icon(Icons.arrow_downward_rounded),
            onPressed: () {
              _entryControl.nextPage(
                  duration: Duration(milliseconds: 450),
                  curve: Curves.easeInOut);
              _currentOffset = 0.0;
            },
            padding: EdgeInsets.only(top: 40),
          ),
        ));
  }
}

class AlbumGridPage extends Page {
  AlbumGridPage({required this.childWidget, super.key});
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
