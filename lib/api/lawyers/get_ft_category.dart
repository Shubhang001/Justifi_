import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

// Dead Code

getFilterSubCategory() async {
  final response = await http.get(
    Uri.parse(
      baseURL,
    ),
  );

  if (response.statusCode == 200) {
    return SortCategory.fromJson(jsonDecode(response.body));
  } else {
    return "Operation Failed";
  }
}

class SortCategory {
  final String id;
  final String categoryName;
  final String categoryCode;
  final String categoryLogo;
  final String categoryDescription;
  final bool isActive;

  const SortCategory({
    required this.id,
    required this.categoryName,
    required this.categoryCode,
    required this.categoryLogo,
    required this.categoryDescription,
    required this.isActive,
  });

  factory SortCategory.fromJson(Map<String, dynamic> json) {
    return SortCategory(
      id: json['id'],
      categoryName: json['name'],
      categoryCode: json['code'],
      categoryDescription: json['description'],
      categoryLogo: json['logo'],
      isActive: json['is_active'],
    );
  }
}
