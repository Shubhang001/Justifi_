import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

// v1/categories/:category/sub_categories/

Future<String> addSubCategory(
  String categoryName,
  subcategoryCode,
  subcategoryLogo,
) async {
  var bytes = await rootBundle.load(subcategoryLogo);
  var buffer = bytes.buffer;
  var imageBytes = buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  var base64Image = base64Encode(imageBytes);

  final response = await http.post(
    Uri.parse("$baseURL/v1/categories/$categoryName/sub_categories/"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': categoryName,
      'code': subcategoryCode,
      'logo': base64Image,
    }),
  );

  if (response.statusCode == 201) {
    return "Succesfully Added";
  } else {
    return "Operation Failed";
  }
}
