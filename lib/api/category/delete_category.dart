import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

Future<String> deleteCategory(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('$baseURL/$id'),
  );

  if (response.statusCode == 200) {
    return "Successfully Deleted";
  } else {
    return "The Operation failed";
  }
}
