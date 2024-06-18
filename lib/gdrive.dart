import 'dart:math';
import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final apiKey = '***REMOVED***';
final galleryID = "'1n1-oZ9kcTpojhOizqLD-nZ5guaOdDLUq'";

Future<List> ListAlbums() async {
  List<dynamic> contentList;
  var url = Uri.parse(
      'https://www.googleapis.com/drive/v3/files?q=${galleryID}%20in%20parents&key=${apiKey}');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    contentList = jsonDecode(await response.body)['files'];
  } else {
    throw Error.throwWithStackTrace(
        'Unable to retreive album list: ${response.statusCode}',
        StackTrace.current);
  }

  final albumList = List.generate(contentList.length, ((index) {
    if (contentList[index]['mimeType'] ==
        'application/vnd.google-apps.folder') {
      return {
        'name': '${contentList[index]['name']}',
        'id': '${contentList[index]['id']}'
      };
    }
  }), growable: false)
      .whereNotNull()
      .toList(growable: false);

  return await albumList;
}

Future<List<dynamic>> ListImages(String ID) async {
  var url = Uri.parse(
      'https://www.googleapis.com/drive/v3/files?q=${ID}%20in%20parents&key=${apiKey}');
  var response = await http.get(url);
  final Map<String, dynamic> imagefolder = jsonDecode(await response.body);
  final List<dynamic> imagelist = await imagefolder['files'];

  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');

  return await imagelist;
}

Future<String> GetSampleImage() async {
  final albums = await ListAlbums();
  final images = await ListImages("'${albums[0]['id']}'");
  final idx = Random().nextInt(images.length);
  return images[idx]['id'];
}

void main() async {
  print("Sample image id:" + await GetSampleImage());
}
