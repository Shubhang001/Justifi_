import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

// Dead Code

getFilterCategory() async {
  final response = await http.get(
    Uri.parse(
      baseURL,
    ),
  );

  if (response.statusCode == 200) {
    return SortSubCategory.fromJson(jsonDecode(response.body));
  } else {
    return "Operation Failed";
  }
}

class SortSubCategory {
  final String id;
  final String categoryName;
  final String categoryCode;
  final String categoryLogo;
  final String categoryDescription;
  final bool isActive;

  const SortSubCategory({
    required this.id,
    required this.categoryName,
    required this.categoryCode,
    required this.categoryLogo,
    required this.categoryDescription,
    required this.isActive,
  });

  factory SortSubCategory.fromJson(Map<String, dynamic> json) {
    return SortSubCategory(
      id: json['id'],
      categoryName: json['name'],
      categoryCode: json['code'],
      categoryDescription: json['description'],
      categoryLogo: json['logo'],
      isActive: json['is_active'],
    );
  }
}
