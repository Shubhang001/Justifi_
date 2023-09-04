import 'dart:convert';

class MyModel {
  int count;
  String next;
  String previous;
  List<MyResult> results;

  MyModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory MyModel.fromJson(Map<String, dynamic> json) {
    List<MyResult> resultsList = (json['results'] as List)
        .map((resultJson) => MyResult.fromJson(resultJson))
        .toList();

    return MyModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: resultsList,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> resultsList =
        results.map((result) => result.toJson()).toList();

    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': resultsList,
    };
  }
}

class MyResult {
  int id;
  String createdAt;
  String updatedAt;
  bool isActive;
  bool isDeleted;
  String title;
  String description;
  int connectType;
  int courtType;
  int feesType;
  int status;
  int amountOffer;
  String deadline;
  int client;
  int caseType;

  MyResult({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.isDeleted,
    required this.title,
    required this.description,
    required this.connectType,
    required this.courtType,
    required this.feesType,
    required this.status,
    required this.amountOffer,
    required this.deadline,
    required this.client,
    required this.caseType,
  });

  factory MyResult.fromJson(Map<String, dynamic> json) {
    return MyResult(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isActive: json['is_active'],
      isDeleted: json['is_deleted'],
      title: json['title'],
      description: json['description'],
      connectType: json['connect_type'],
      courtType: json['court_type'],
      feesType: json['fees_type'],
      status: json['status'],
      amountOffer: json['amount_offer'],
      deadline: json['deadline'],
      client: json['client'],
      caseType: json['case_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'is_active': isActive,
      'is_deleted': isDeleted,
      'title': title,
      'description': description,
      'connect_type': connectType,
      'court_type': courtType,
      'fees_type': feesType,
      'status': status,
      'amount_offer': amountOffer,
      'deadline': deadline,
      'client': client,
      'case_type': caseType,
    };
  }
}
