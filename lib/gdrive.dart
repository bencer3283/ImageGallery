import 'package:http/http.dart' as http;

final apiKey = '***REMOVED***';
final galleryID = "'1n1-oZ9kcTpojhOizqLD-nZ5guaOdDLUq'";

void ListAlbums() async {
  var url = Uri.parse(
      'https://www.googleapis.com/drive/v3/files?q=${galleryID}%20in%20parents&key=${apiKey}');
  var response = await http.get(url);

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

void main() async {
  ListAlbums();
}
