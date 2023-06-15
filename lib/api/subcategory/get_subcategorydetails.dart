import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

// {{base_url}}/v1/categories/:category/sub_categories/:sub_category

getSubcategoryDetails(String categoryType, subCategory) async {
  final response = await http.get(
    Uri.parse(
      "$baseURL/v1/categories/$categoryType/sub_categories/$subCategory",
    ),
  );

  if (response.statusCode == 200) {
    return SubCategoryDetailModel.fromJson(jsonDecode(response.body));
  } else {
    return "Failed";
  }
}

class SubCategoryDetailModel {
  final int id;
  final String name;
  final String code;
  final String logo;
  final String description;
  final String category;
  final bool isActive;

  const SubCategoryDetailModel({
    required this.id,
    required this.name,
    required this.code,
    required this.logo,
    required this.description,
    required this.category,
    required this.isActive,
  });

  factory SubCategoryDetailModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryDetailModel(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      logo: json['logo'],
      description: json['description'],
      category: json['category'],
      isActive: json['is_active'],
    );
  }
}
