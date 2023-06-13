import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

Future<String> deleteSubcategory(
  String categoryId,
  subCategoryId,
) async {
  final http.Response response = await http.delete(
    Uri.parse(
        '$baseURL/v1/categories/$categoryId/sub_categories/$subCategoryId'),
  );

  if (response.statusCode == 200) {
    return "Successfully Deleted";
  } else {
    return "The Operation failed";
  }
}
