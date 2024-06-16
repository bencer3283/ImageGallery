import 'dart:collection';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'dart:convert';

final apiKey = '***REMOVED***';
final galleryID = "'1n1-oZ9kcTpojhOizqLD-nZ5guaOdDLUq'";

dynamic ListAlbums() async {
  var url = Uri.parse(
      'https://www.googleapis.com/drive/v3/files?q=${galleryID}%20in%20parents&key=${apiKey}');
  var response = await http.get(url);
  final Map<String, dynamic> albumlist = jsonDecode(await response.body);

  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');

  // print(albumlist['files'][0]);

  return await albumlist['files'];
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

Future<String> GetSmapleImage() async {
  final albums = await ListAlbums();
  final images = await ListImages("'${albums[0]['id']}'");
  final idx = Random().nextInt(images.length);
  return images[idx]['id'];
}

void main() async {
  print("Sample image id:" + await GetSmapleImage());
}
