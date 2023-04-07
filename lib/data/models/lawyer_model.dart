// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Lawyer {
  String name;
  String image;
  String education;
  double distance;
  double rating;
  int clients;
  int cases;
  int experience;

  Lawyer({
    required this.name,
    required this.image,
    required this.education,
    required this.distance,
    required this.rating,
    required this.clients,
    required this.cases,
    required this.experience,
  });

  Lawyer copyWith({
    String? name,
    String? image,
    String? education,
    double? distance,
    double? rating,
    int? clients,
    int? cases,
    int? experience,
  }) {
    return Lawyer(
      name: name ?? this.name,
      image: image ?? this.image,
      education: education ?? this.education,
      distance: distance ?? this.distance,
      rating: rating ?? this.rating,
      clients: clients ?? this.clients,
      cases: cases ?? this.cases,
      experience: experience ?? this.experience,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'education': education,
      'distance': distance,
      'rating': rating,
      'clients': clients,
      'cases': cases,
      'experience': experience,
    };
  }

  factory Lawyer.fromMap(Map<String, dynamic> map) {
    return Lawyer(
      name: map['name'] as String,
      image: map['image'] as String,
      education: map['education'] as String,
      distance: map['distance'] as double,
      rating: map['rating'] as double,
      clients: map['clients'] as int,
      cases: map['cases'] as int,
      experience: map['experience'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Lawyer.fromJson(String source) => Lawyer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Lawyer(name: $name, image: $image, education: $education, distance: $distance, rating: $rating, clients: $clients, cases: $cases, experience: $experience)';
  }

  @override
  bool operator ==(covariant Lawyer other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.image == image &&
      other.education == education &&
      other.distance == distance &&
      other.rating == rating &&
      other.clients == clients &&
      other.cases == cases &&
      other.experience == experience;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      image.hashCode ^
      education.hashCode ^
      distance.hashCode ^
      rating.hashCode ^
      clients.hashCode ^
      cases.hashCode ^
      experience.hashCode;
  }
}
