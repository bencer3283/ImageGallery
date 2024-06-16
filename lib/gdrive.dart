import 'package:http/http.dart' as http;
import 'dart:convert';

final apiKey = '***REMOVED***';
final galleryID = "'1n1-oZ9kcTpojhOizqLD-nZ5guaOdDLUq'";

dynamic ListAlbums() async {
  var url = Uri.parse(
      'https://www.googleapis.com/drive/v3/files?q=${galleryID}%20in%20parents&key=${apiKey}');
  var response = await http.get(url);
  final albumlist = jsonDecode(await response.body);

  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');

  // print(albumlist['files'][0]);

  return await albumlist['files'];
}

dynamic ListImages(String ID) async {
  var url = Uri.parse(
      'https://www.googleapis.com/drive/v3/files?q=${ID}%20in%20parents&key=${apiKey}');
  var response = await http.get(url);
  final imagelist = jsonDecode(await response.body);

  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');

  // print(imagelist['files']);

  return await imagelist['files'];
}

Future<String> GetSmapleImage() async {
  final albums = await ListAlbums();
  final images = await ListImages("'${albums[0]['id']}'");
  return images[0]['id'];
}

void main() async {
  print("Sample image id:" + await GetSmapleImage());
}
