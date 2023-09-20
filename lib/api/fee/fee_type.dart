import 'dart:convert';
import 'package:http/http.dart' as http;

class FeeDetail {
  final int id;
  final String feeName;

  FeeDetail({
    required this.id,
    required this.feeName,
  });

  factory FeeDetail.fromJson(Map<String, dynamic> json) {
    return FeeDetail(
      id: json['id'],
      feeName: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': feeName,
    };
  }
}

Future<List<FeeDetail>> getFees() async {
  final response =
      await http.get(Uri.parse("http://15.206.28.255:8000/v1/fee-type"));
  List<FeeDetail> feeList = [];

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    final List<dynamic> results = data['data'];

    for (var feeData in results) {
      FeeDetail category = FeeDetail.fromJson(feeData);
      feeList.add(category);
    }

    return feeList;
  } else {
    throw Exception("Failed to load categories");
  }
}
