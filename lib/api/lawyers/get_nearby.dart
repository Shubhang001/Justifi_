import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

// Dead Code

getNearby() async {
  final http.Response response = await http.delete(
    Uri.parse('$baseURL/v1/nearest-advocates'),
  );

  if (response.statusCode == 200) {
    return LawyerNearMe.fromJson(
      jsonDecode(response.body),
    );
  } else {
    return "Something went wrong";
  }
}

class LawyerNearMe {
  final String id;
  final String categoryName;
  final String categoryCode;
  final String categoryLogo;
  final String categoryDescription;
  final bool isActive;

  const LawyerNearMe({
    required this.id,
    required this.categoryName,
    required this.categoryCode,
    required this.categoryLogo,
    required this.categoryDescription,
    required this.isActive,
  });

  factory LawyerNearMe.fromJson(Map<String, dynamic> json) {
    return LawyerNearMe(
      id: json['id'],
      categoryName: json['name'],
      categoryCode: json['code'],
      categoryDescription: json['description'],
      categoryLogo: json['logo'],
      isActive: json['is_active'],
    );
  }
}
