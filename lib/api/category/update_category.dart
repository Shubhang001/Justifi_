import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

Future<String> updateCategories(
  int categoryType,
  String updatedCategory,
) async {
  final response = await http.patch(
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: {
      "first_name": updatedCategory,
    },
    Uri.parse(
      "$baseURL/v1/categories/$categoryType/",
    ),
  );

  if (response.statusCode == 200) {
    return "Success";
  } else {
    return "Failed";
  }
}
