import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

getSubcategory(int categoryType) async {
  final response = await http
      .get(Uri.parse("$baseURL/v1/categories/$categoryType/sub_categories/"));

  if (response.statusCode == 200) {
    return SubCategoryModel.fromJson(jsonDecode(response.body));
  } else {
    return "Failed";
  }
}

class SubCategoryModel {
  final int count;
  final bool next;
  final bool previous;
  final List results;

  const SubCategoryModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      count: json['id'],
      next: json['next'],
      previous: json['previous'],
      results: json['results'],
    );
  }
}
