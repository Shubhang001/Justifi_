// To parse this JSON data, do
//
//     final nearestAdvocate = nearestAdvocateFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;

/*NearestAdvocate nearestAdvocateFromJson(String str) =>
    NearestAdvocate.fromJson(json.decode(str));

String nearestAdvocateToJson(NearestAdvocate data) =>
    json.encode(data.toJson());

class NearestAdvocate {
  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;

  NearestAdvocate({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory NearestAdvocate.fromJson(Map<String, dynamic> json) =>
      NearestAdvocate(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  int id;
  String fullName;
  String profileImage;
  dynamic qualification;
  String practicePlace;
  double distance;
  int rating;
  int totalClientHandled;
  int totalCaseHandled;
  dynamic totalExperience;

  Result({
    required this.id,
    required this.fullName,
    required this.profileImage,
    required this.qualification,
    required this.practicePlace,
    required this.distance,
    required this.rating,
    required this.totalClientHandled,
    required this.totalCaseHandled,
    required this.totalExperience,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        fullName: json["full_name"],
        profileImage: json["profile_image"],
        qualification: json["qualification"],
        practicePlace: json["practice_place"],
        distance: json["distance"]?.toDouble(),
        rating: json["rating"],
        totalClientHandled: json["total_client_handled"],
        totalCaseHandled: json["total_case_handled"],
        totalExperience: json["total_experience"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "profile_image": profileImage,
        "qualification": qualification,
        "practice_place": practicePlace,
        "distance": distance,
        "rating": rating,
        "total_client_handled": totalClientHandled,
        "total_case_handled": totalCaseHandled,
        "total_experience": totalExperience,
      };
}

class RemoteService {
  Future<dynamic> getNearestAdvocate() async {
    var client = http.Client();
    var uri = Uri.parse("http://15.206.28.255:8000/v1/popular-advocates/");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
}*/

/*class RemoteService {
  Future<void> fetchUsers() async {
    var uri = Uri.parse("http://15.206.28.255:8000/v1/popular-advocates/");
    var response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    if (response.statusCode == 200) {
      return json;
    }
  }
}*/
