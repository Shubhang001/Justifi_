// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ClientListModel clientListFromJson(String str) =>
    ClientListModel.fromJson(json.decode(str));

String clientListToJson(ClientListModel data) => json.encode(data.toJson());

class ClientListModel {
  int count;
  dynamic next;
  dynamic previous;
  List<Client> clientList;

  ClientListModel({
    required this.count,
    this.next,
    this.previous,
    required this.clientList,
  });

  factory ClientListModel.fromJson(Map<String, dynamic> json) =>
      ClientListModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        clientList:
            List<Client>.from(json["results"].map((x) => Client.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(clientList.map((x) => x.toJson())),
      };
}

//client
Client clientFromJson(String str) => Client.fromJson(json.decode(str));
String clientToJson(Client data) => json.encode(data.toJson());

class Client {
  int id;
  String firstName;
  String lastName;
  dynamic profileImage;
  String phone;
  String email;
  int gender;
  DateTime dob;
  dynamic location;
  bool isActive;
  String? type;

  Client({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.profileImage,
    required this.phone,
    required this.email,
    required this.gender,
    required this.dob,
    this.location,
    required this.isActive,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        profileImage: json["profile_image"],
        phone: json["phone"],
        email: json["email"],
        gender: json["gender"],
        dob: DateTime.parse(json["dob"]),
        location: json["location"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "profile_image": profileImage,
        "phone": phone,
        "email": email,
        "gender": gender,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "location": location,
        "is_active": isActive,
      };
}
