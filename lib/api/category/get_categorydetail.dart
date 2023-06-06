import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

getCategoryDetails(int categoryType) async {
  final response =
      await http.get(Uri.parse("$baseURL/v1/categories/$categoryType"));

  if (response.statusCode == 200) {
    return CategoryDetail.fromJson(jsonDecode(response.body));
  } else {
    return "Operation Failed";
  }
}

class CategoryDetail {
  final String id;
  final String categoryName;
  final String categoryCode;
  final String categoryLogo;
  final String categoryDescription;
  final bool isActive;

  const CategoryDetail({
    required this.id,
    required this.categoryName,
    required this.categoryCode,
    required this.categoryLogo,
    required this.categoryDescription,
    required this.isActive,
  });

  factory CategoryDetail.fromJson(Map<String, dynamic> json) {
    return CategoryDetail(
      id: json['id'],
      categoryName: json['name'],
      categoryCode: json['code'],
      categoryDescription: json['description'],
      categoryLogo: json['logo'],
      isActive: json['is_active'],
    );
  }
}
