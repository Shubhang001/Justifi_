import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

Future<CategoryTypes> getCategories() async {
  final response = await http.get(Uri.parse("$baseURL/v1/categories"));

  if (response.statusCode == 200) {
    return CategoryTypes.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class CategoryTypes {
  final int count;
  final String nextPage;
  final bool previous;
  final List<Map> results;

  const CategoryTypes({
    required this.count,
    required this.nextPage,
    required this.previous,
    required this.results,
  });

  factory CategoryTypes.fromJson(Map<String, dynamic> json) {
    return CategoryTypes(
        count: json['count'],
        nextPage: json['next'],
        previous: json['previous'],
        results: json['results']);
  }
}
