import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

Future<List<String>> getSubcategoryNames(int categoryId) async {
  final response = await http.get(
    Uri.parse("$baseURL/v1/categories/$categoryId/sub_categories"),
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body)['results'];
    List<String> subcategoryNames = [];

    for (var subcategoryData in data) {
      subcategoryNames.add(subcategoryData['name']);
    }

    return subcategoryNames;
  } else {
    throw Exception("Failed to load subcategories");
  }
}
