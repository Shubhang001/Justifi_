import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

getCategories() async {
  final response = await http.get(Uri.parse("$baseURL/v1/categories"));

  if (response.statusCode == 200) {
    return CategoryTypes.fromJson(jsonDecode(response.body));
  } else {
    return "Operation was Cancelled";
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
