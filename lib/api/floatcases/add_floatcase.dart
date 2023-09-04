import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/utils/models/floatcasesmodel.dart';

class MyApi {
  static const baseUrl = "http://15.206.28.255:8000";

  Future<List<MyResult>> fetchCaseData() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/v1/case-connect"));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final resultsList = (jsonData['results'] as List)
            .map((resultJson) => MyResult.fromJson(resultJson))
            .toList();
        return resultsList;
      } else {
        return throw ('Failed to load case data');
      }
    } catch (e) {
      print(e);
      return throw ('Failed to load case data');
    }
  }
}
