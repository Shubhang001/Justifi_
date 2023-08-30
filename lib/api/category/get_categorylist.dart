import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

Future<List<dynamic>>getCategories() async {

  final response = await http.get(Uri.parse("$baseURL/v1/categories"));
 final List<dynamic> data=jsonDecode(response.body)['results'];


  if (response.statusCode == 200) {






    return data;
  } else {
    throw Exception("Failed to load");
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
            categoryName: json['count'],
        categoryLogo: json['next'],
       categoryCode: json['previous'],
       categoryDescription: json['results'],

    isActive: json['is_active']
    );
  }



}
