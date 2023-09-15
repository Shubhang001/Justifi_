import 'dart:convert';
import 'package:http/http.dart' as http;

class CourtDetail {
  final int id;
  final String courtName;

  CourtDetail({
    required this.id,
    required this.courtName,
  });

  factory CourtDetail.fromJson(Map<String, dynamic> json) {
    return CourtDetail(
      id: json['id'],
      courtName: json['name'],
    );
  }
}

Future<List<CourtDetail>> getCourts() async {
  final response =
      await http.get(Uri.parse("http://15.206.28.255:8000/v1/court-type"));
  List<CourtDetail> courtList = [];

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    final List<dynamic> results = data['data'];

    for (var courtData in results) {
      CourtDetail category = CourtDetail.fromJson(courtData);
      courtList.add(category);
    }

    return courtList;
  } else {
    throw Exception("Failed to load categories");
  }
}
