import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

getReviews(
  int advocateID,
) async {
  final response = await http.get(
    Uri.parse(
      "$baseURL/v1/advocate/$advocateID/reviews",
    ),
  );

  if (response.statusCode == 200) {
    return AdvocateReviews.fromJson(jsonDecode(response.body));
  } else {
    return "Operation Failed";
  }
}

class AdvocateReviews {
  final int count;
  final String next;
  final String previous;
  final List<Map> results;

  const AdvocateReviews({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory AdvocateReviews.fromJson(Map<String, dynamic> json) {
    return AdvocateReviews(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: json['results'],
    );
  }
}
