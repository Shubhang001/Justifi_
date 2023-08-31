import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

Future<List<dynamic>>getCategories() async {

  final response = await http.get(Uri.parse("$baseURL/v1/categories"));
  final int count=jsonDecode(response.body)['count'];
  List<dynamic> alldata=[];




  if (response.statusCode == 200) {


    for(var i=1;i<=(count/10).ceil();i++){
      final response = await http.get(Uri.parse("$baseURL/v1/categories?page=$i"));
      final List<dynamic> data=jsonDecode(response.body)['results'];
      for(var j in data){
        alldata.add(j);
      }



    }




    return alldata;
  } else {
    throw Exception("Failed to load");
  }
}









class CategoryDetail {
  final String id;
  final String categoryName;
  final String categoryCode;
  final String categoryLogo;
  final String categoryDescription;
  final bool isActive;

  const CategoryDetail({
    required this.id,
    required this.categoryName,
    required this.categoryCode,
    required this.categoryLogo,
    required this.categoryDescription,
    required this.isActive,
  });

  factory CategoryDetail.fromJson(Map<String, dynamic> json) {
    return CategoryDetail(
id: json['id'],
            categoryName: json['count'],
        categoryLogo: json['next'],
       categoryCode: json['previous'],
       categoryDescription: json['results'],

    isActive: json['is_active']
    );
  }



}
