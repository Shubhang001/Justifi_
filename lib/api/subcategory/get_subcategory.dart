import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

Future<List<dynamic>> getsubcategories(id) async {
  final response =
      await http.get(Uri.parse("$baseURL/v1/categories/$id/sub_categories/"));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body)['results'];
    return data;
  } else {
    throw Exception("Failed to load");
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
