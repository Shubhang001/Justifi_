import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/utils/models/usermodel.dart';

String url = "http://65.0.130.67:8000";

Future registerUserWithEmail(String email, String role) async {
  try {
    var body = {"email": email, "role": role};
    http.Response response = await http.post(
      Uri.parse("$url/client/client-profile/create/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 201) {
      return UserEmailModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to register user: ${response.reasonPhrase}");
    }
  } catch (e) {
    print('Error: $e');
    throw e;
  }
}

Future registerUserWithPhone(String phone, String role) async {
  try {
    var body = {"phone": "+91$phone", "role": role};
    http.Response response = await http.post(
        Uri.parse("$url/client/client-profile/create/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body));

    if (response.statusCode == 201) {
      return UserPhoneModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 400) {
      final responseJson = json.decode(response.body);
      if (responseJson['message'] ==
          "Phone number already exists. Please Login") {
        throw Exception("Phone number already exists. Please log in.");
      } else {
        throw Exception("Failed to register user: ${response.reasonPhrase}");
      }
    } else {
      throw Exception("Failed to register user: ${response.reasonPhrase}");
    }
  } catch (e) {
    print('Error: $e');
    throw e;
  }
}

Future loginUserWithEmail(String email) async {
  var body = {"email": email};
  http.Response response = await http.post(Uri.parse("$url/client/login/"),
      headers: {"Content-Type": "application/json"}, body: jsonEncode(body));

  var res = jsonDecode(response.body);

  if (response.statusCode == 200) {
    final user = {
      "success": res['success'],
      "message": res['message'],
    };
    return user;
  } else {
    return Exception(response.reasonPhrase);
  }
}

Future loginUserWithPhone(String phone) async {
  var body = {"phone": phone};
  http.Response response = await http.post(Uri.parse("$url/client/login/"),
      headers: {"Content-Type": "application/json"}, body: jsonEncode(body));

  var res = jsonDecode(response.body);

  if (response.statusCode == 200) {
    final user = {
      "success": res['success'],
      "message": res['message'],
    };
    return user;
  } else {
    return Exception(response.reasonPhrase);
  }
}

Future verifyUserSignUp(String id, String otp) async {
  var body = {"user_id": id, "otp": otp};
  http.Response response = await http.post(Uri.parse("$url/client/verify-otp/"),
      headers: {"Content-Type": "application/json"}, body: jsonEncode(body));

  var res = json.decode(response.body);
  if (response.statusCode == 201) {
    final user = {
      "success": res['success'],
      "message": res['message'],
      "token": res["data"]["token"]
    };
    return user;
  } else {
    final user = {
      "success": res['success'],
      "message": res['error']['non_field_errors'],
    };
    return user;
  }
}

Future verifyUserLogin(String id, String otp) async {
  var body = {"user_id": id, "otp": otp};
  http.Response response = await http.post(Uri.parse("$url/client/verify-otp/"),
      headers: {"Content-Type": "application/json"}, body: jsonEncode(body));

  var res = json.decode(response.body);
  if (response.statusCode == 201) {
    final user = {
      "success": res['success'],
      "message": res['message'],
      "token": res["data"]["token"]
    };
    return user;
  } else {
    final user = {
      "success": res['success'],
      "message": res['error']['non_field_errors'][0],
    };
    return user;
  }
}

userLogout(String token) async {
  http.Response response = await http.post(Uri.parse("$url/client/logout/"),
      headers: {
        "Authorization": "token $token",
        "Content-Type": "application/json"
      });

  if (response.statusCode == 200) {
    // final user = {
    //   "success": json.decode(response.body)['success'],
    //   "message": json.decode(response.body)['message'],
    // };
    // return user;
  } else {
    return Exception("Error verifying User");
  }
}
