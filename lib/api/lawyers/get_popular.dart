import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

getPopular() async {
  final http.Response response = await http.delete(
    Uri.parse('$baseURL/v1/nearest-advocates'),
  );

  if (response.statusCode == 200) {
    return PopularLawyer.fromJson(
      jsonDecode(response.body),
    );
  } else {
    return "Something went wrong";
  }
}

class PopularLawyer {
  final int count;
  final String next;
  final String previous;
  final List<Map> results;

  const PopularLawyer({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PopularLawyer.fromJson(Map<String, dynamic> json) {
    return PopularLawyer(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: json['results'],
    );
  }
}
