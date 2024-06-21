import 'dart:math';
import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final apiKey = '***REMOVED***';
final galleryID = "'1n1-oZ9kcTpojhOizqLD-nZ5guaOdDLUq'";

Future<List<Map<String, String>>> listAlbums() async {
  List<dynamic> contentList;
  final url = Uri.parse(
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

  return await albumList.cast<Map<String, String>>();
}

Future<String> getAlbumInfo(String id) async {
  final url = Uri.parse(
      'https://www.googleapis.com/drive/v3/files/${id}?fields=description&key=${apiKey}');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonDecode(response.body)['description'] ?? 'na';
  } else {
    throw Error.throwWithStackTrace(
        'Failed to fetch album description: ${id}', StackTrace.current);
  }
}

Future<List<Map<String, dynamic>>> listFolderContents(String id) async {
  final String ID = "'${id}'";
  final url = Uri.parse(
      'https://www.googleapis.com/drive/v3/files?q=${ID}%20in%20parents&fields=files(id%2Cname%2Cdescription%2CmimeType%2CimageMediaMetadata(time%2CcameraMake%2CcameraModel%2CexposureTime%2Caperture%2CisoSpeed%2Clens))&key=${apiKey}');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    final Map<String, dynamic> folder = jsonDecode(await response.body);
    List<Map<String, dynamic>> files = List.generate(
        folder['files'].length,
        (index) => {
              'mimeType': folder['files'][index]['mimeType'],
              'id': folder['files'][index]['id'],
              'name': folder['files'][index]['name'],
              'description': folder['files'][index]['description'] ?? '',
              'metadata':
                  folder['files'][index]['imageMediaMetadata'] ?? {'type': 'na'}
            });
    return await files;
  } else {
    throw Error.throwWithStackTrace(
        'Unable to fetch contents of folder ${ID}', StackTrace.current);
  }
}

Future<String> GetSampleImage() async {
  final albums = await listAlbums();
  final images = await listFolderContents(albums[0]['id'] as String);
  final idx = Random().nextInt(images.length);
  return images[idx]['id']!;
}

void main() async {
  Map<String, dynamic> file = {
    'metadata': {'type': 'na'},
    'id': '000'
  };
  print(file['metadata'].toString() + '\n');
  print(file['id'] as String);
  print(file['metadata']['aperture']);
  // print("Sample image id:" + await GetSampleImage());
}
