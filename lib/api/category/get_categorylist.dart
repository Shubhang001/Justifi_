import 'dart:convert';
import 'package:http/http.dart' as http;

class CategoryDetail {
  final int id;
  final String categoryName;

  CategoryDetail({
    required this.id,
    required this.categoryName,
  });

  factory CategoryDetail.fromJson(Map<String, dynamic> json) {
    return CategoryDetail(
      id: json['id'],
      categoryName: json['name'],
    );
  }
}

Future<List<CategoryDetail>> getCategories() async {
  final String baseUrl = "http://15.206.28.255:8000/v1/categories";
  final response = await http.get(Uri.parse("$baseUrl"));
  List<CategoryDetail> categoryList = [];

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    // Check if there are more pages and fetch them
    final int count = data['count'];
    for (var i = 1; i <= (count / 10).ceil(); i++) {
      final pageResponse = await http.get(Uri.parse("$baseUrl?page=$i"));
      final List<dynamic> pageData = jsonDecode(pageResponse.body)['results'];
      for (var categoryData in pageData) {
        CategoryDetail category = CategoryDetail.fromJson(categoryData);
        categoryList.add(category);
      }
    }

    return categoryList;
  } else {
    throw Exception("Failed to load categories");
  }
}
