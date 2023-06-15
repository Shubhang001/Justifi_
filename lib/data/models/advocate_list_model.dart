// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AdvocateListModel advocateListFromJson(String str) =>
    AdvocateListModel.fromJson(json.decode(str));

String advocateListToJson(AdvocateListModel data) => json.encode(data.toJson());

class AdvocateListModel {
  int count;
  dynamic next;
  dynamic previous;
  List<Advocate> advocateList;

  AdvocateListModel({
    required this.count,
    this.next,
    this.previous,
    required this.advocateList,
  });

  factory AdvocateListModel.fromJson(Map<String, dynamic> json) =>
      AdvocateListModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        advocateList: List<Advocate>.from(
            json["results"].map((x) => Advocate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(advocateList.map((x) => x.toJson())),
      };
}

//client
Advocate advocateFromJson(String str) => Advocate.fromJson(json.decode(str));
String advocateToJson(Advocate data) => json.encode(data.toJson());

class Advocate {
  int id;
  String firstName;
  String lastName;
  String practicePlace;
  String phone;
  String email;
  int user;
  int rating;
  String? undergradUniversity;
  String? undergradYear;
  String? postgradUniversity;
  String? postgradYear;
  DateTime? dob;
  String? onlineTime;
  String? barRegistrationDate;
  String? barCouncilID;
  String? barCouncilDoc;
  int? gender;

  Advocate({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.practicePlace,
    required this.phone,
    required this.email,
    required this.user,
    required this.rating,
  });

  factory Advocate.fromJson(Map<String, dynamic> json) => Advocate(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        practicePlace: json["practice_place"],
        phone: json["phone"],
        email: json["email"],
        user: json["user"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "practice_place": practicePlace,
        "phone": phone,
        "email": email,
        "user": user,
        "rating": rating,
      };
}
