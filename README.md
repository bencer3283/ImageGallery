# gallery

A Flutter project to develope a responsive and modern image gallery *only* for the web.

## Components

Under the `lib` directory, the `main.dart` contains the code of the app's main body, basically the flutter navigation routing system: router. `main.dart` also includes the UI of the home page. The project currently has another two parts:
1. The image viewer coded in `viewer.dart`.
2. The grid view of a full album in `AlbumGrid.dart`. 

### Routing
This app uses the flutter router interface for routing. Previous versions of this app used the default `HashUrlStrategy()`, which means when running in web browsers only the fragment part (`#*`) of the url is considered the route path name. For better compatability with social media sharing, the app now uses `PathUrlStrategy()`. This means the app now uses the path part (`\path\to\page`) of the url as the route path name. To ensure backward compatability with older links that uses fragment as route path name and also to eliminate any url decoding error, a handful of pre-processing of the route path name needs to happen in the `main()` function. It also means that the static property `Uri.base` is used to get the raw, original url from the browser. This makes the app only works on the web platform as the same call to the static property will yield the running directory of the app (which does not contain any routing information) in other platforms.

Previous versions of the app uses `WidgetsFlutterBinding.ensureInitialized()` paired with `WidgetsBinding.instance.platformDispatcher.defaultRouteName` to obtain the initial route path name, which is arguably a better way to achieve deep linking.

## Back-end
The current version of this image gallery fetches images from a google drive folder with folder id defined in `gdrive.dart`. The file also contains functions to connect to and fetch metadata and thumbnail of the images from google drive. It automatically fetches jpeg camera settings and a description field in each folder and image. The description field can be set in the google drive UI. Each folder in the root folder represents an album in the gallery.

The `albums/album.dart` file defines the data structure of the album object. It has a `album.gdrive()` constructor that calls functions in `gdrive.dart` to contruct each album object with neccessary data. There is also a `constructAlbumStream()` function that is called in the initialization process(`initState()`) in `main.dart` to construct the whole gallery, which is a list of albums.

### Image fetching
This application uses the Google Drive API `thumbnalLink` field to fetch a thumbnail for displaying images. It modifies the default sz=s220 query parameter in the `thumbnailLink` to sz=s1440. For full-res image only loaded when the user zooms in, a `file.get` api call with `alt=media` is used as the link to the image.

## Deployment
The `web/netlify.toml` file adds a redirect rule to the hosting service of my choice for this project: Netlify. Adding the rule ensure it redirect every url to the root `index.html`. This reflect the use of `PathUrlStrategy()` in the `main()` function. It ensures better compatability with social network sharing with added ad tracking query parameter like `fbclid`.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
