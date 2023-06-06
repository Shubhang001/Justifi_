import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

Future<http.Response> deleteAlbum(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('$baseURL/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  return response;
}
