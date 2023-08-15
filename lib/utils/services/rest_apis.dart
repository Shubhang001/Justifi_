import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/utils/models/usermodel.dart';

String url = "http://15.206.28.255:8000";

registerUserWithEmail(String email, String role) async {
  var body = {"email": email, "role": role};
  http.Response response =
      await http.post(Uri.parse("$url/v1/signup/"), body: jsonEncode(body));

  if (response.statusCode == 201) {
    return UserEmailModel.fromJson(json.decode(response.body));
  } else {
    return Exception("Error Registering User");
  }
}

registerUserWithPhone(String phone, String role) async {
  var body = {"phone": phone, "role": role};
  http.Response response =
      await http.post(Uri.parse("$url/v1/signup/"), body: jsonEncode(body));

  if (response.statusCode == 201) {
    return UserPhoneModel.fromJson(json.decode(response.body));
  } else {
    return Exception("Error Registering User");
  }
}

loginUserWithEmail(String email) async {
  var body = {"email": email};
  http.Response response =
      await http.post(Uri.parse("$url/v1/login/"), body: jsonEncode(body));

  if (response.statusCode == 200) {
    final user = {
      "success": json.decode(response.body)['success'],
      "message": json.decode(response.body)['message'],
    };
    return user;
  } else {
    return Exception("Error logging User");
  }
}

loginUserWithPhone(String phone) async {
  var body = {"phone": phone};
  http.Response response = await http.post(Uri.parse("$url/v1/login/"),
      headers: {"Content-Type": "application/json"}, body: jsonEncode(body));

  if (response.statusCode == 200) {
    final user = {
      "success": json.decode(response.body)['success'],
      "message": json.decode(response.body)['message'],
    };
    return user;
  } else {
    return Exception("Error logging User");
  }
}

verifyUserSignUp(String id, String otp) async {
  var body = {"user_id": id, "otp": otp};
  http.Response response = await http
      .post(Uri.parse("$url/v1/signup/validate-otp/"), body: jsonEncode(body));

  if (response.statusCode == 200) {
    final user = {
      "success": json.decode(response.body)['success'],
      "message": json.decode(response.body)['message'],
    };
    return user;
  } else {
    return Exception("Error verifying User");
  }
}

verifyUserLogin(String id, String otp) async {
  var body = {"user_id": id, "otp": otp};
  http.Response response = await http
      .post(Uri.parse("$url/v1/login/validate-otp/"), body: jsonEncode(body));

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

userLogout(String token) async {
  http.Response response =
      await http.post(Uri.parse("$url/v1/logout/"), headers: {
    "Authorization": "token $token",
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
