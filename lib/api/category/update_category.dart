import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

Future<String> updateCategories(
  int categoryType,
  bool isActive,
) async {
  final response = await http.patch(
    body: {
      "is_active": isActive,
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
