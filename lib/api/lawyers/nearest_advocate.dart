// To parse this JSON data, do
//
//     final nearestAdvocate = nearestAdvocateFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;

NearestAdvocate nearestAdvocateFromJson(String str) =>
    NearestAdvocate.fromJson(json.decode(str));

String nearestAdvocateToJson(NearestAdvocate data) =>
    json.encode(data.toJson());

class NearestAdvocate {
  Items items;

  NearestAdvocate({
    required this.items,
  });

  factory NearestAdvocate.fromJson(Map<String, dynamic> json) =>
      NearestAdvocate(
        items: Items.fromJson(json["items"]),
      );

  get name => null;

  get image => null;

  get education => null;

  get distance => null;

  get rating => null;

  get clients => null;

  get cases => null;

  get experience => null;

  Map<String, dynamic> toJson() => {
        "items": items.toJson(),
      };
}

class Items {
  String name;
  String image;
  String education;
  int distance;
  double rating;
  int clients;
  int cases;
  int experience;

  Items({
    required this.name,
    required this.image,
    required this.education,
    required this.distance,
    required this.rating,
    required this.clients,
    required this.cases,
    required this.experience,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        name: json["name"],
        image: json["image"],
        education: json["education"],
        distance: json["distance"],
        rating: json["rating"]?.toDouble(),
        clients: json["clients"],
        cases: json["cases"],
        experience: json["experience"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "education": education,
        "distance": distance,
        "rating": rating,
        "clients": clients,
        "cases": cases,
        "experience": experience,
      };
}

class RemoteService {
  Future<List<NearestAdvocate>?> getNearestAdvocate() async {
    var client = http.Client();
    var uri = Uri.parse("http://15.206.28.255:8000/v1/popular-advocates/");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return jsonDecode(json);
    }
    return null;
  }
}
