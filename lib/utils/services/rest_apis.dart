import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/utils/models/usermodel.dart';

String url = "http://15.206.28.255:8000";

Future registerUserWithEmail(String email, String role) async {
  var body = {"email": email, "role": role};
  http.Response response = await http.post(Uri.parse("$url/v1/signup/"),
      headers: {"Content-Type": "application/json"}, body: jsonEncode(body));

  if (response.statusCode == 201) {
    return UserEmailModel.fromJson(json.decode(response.body));
  } else {
    return Exception(response.reasonPhrase);
  }
}

Future registerUserWithPhone(String phone, String role) async {
  var body = {"phone": "+91$phone", "role": role};
  http.Response response = await http.post(Uri.parse("$url/v1/signup/"),
      headers: {"Content-Type": "application/json"}, body: jsonEncode(body));

  if (response.statusCode == 201) {
    return UserPhoneModel.fromJson(json.decode(response.body));
  } else {
    return Exception(response.reasonPhrase);
  }
}

Future loginUserWithEmail(String email) async {
  var body = {"email": email};
  http.Response response = await http.post(Uri.parse("$url/v1/login/"),
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
  http.Response response = await http.post(Uri.parse("$url/v1/login/"),
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
  http.Response response = await http.post(
      Uri.parse("$url/v1/signup/validate-otp/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body));

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
  http.Response response = await http.post(
      Uri.parse("$url/v1/login/validate-otp/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body));

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
  http.Response response = await http.post(Uri.parse("$url/v1/logout/"),
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
