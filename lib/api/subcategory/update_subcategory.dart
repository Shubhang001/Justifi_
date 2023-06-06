import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

// {{base_url}}/v1/categories/:category/sub_categories/:sub_category

Future<String> updateCategories(
  String categoryId,
  subCategoryId,
  isActive,
  description,
) async {
  final response = await http.patch(
    body: {
      "is_active": isActive,
      "description": description,
    },
    Uri.parse(
      "$baseURL/v1/categories/$subCategoryId/",
    ),
  );

  if (response.statusCode == 200) {
    return "Success";
  } else {
    return "Failed";
  }
}
