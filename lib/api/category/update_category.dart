import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

Future<CategoryDetail> updateCategories(int categoryType) async {
  final response =
      await http.get(Uri.parse("$baseURL/v1/categories/$categoryType"));

  if (response.statusCode == 200) {
    return CategoryDetail.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class CategoryDetail {
  final int id;

  const CategoryDetail({
    required this.id,
  });

  factory CategoryDetail.fromJson(Map<String, dynamic> json) {
    return CategoryDetail(
      id: json['id'],
    );
  }
}
