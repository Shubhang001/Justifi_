import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../../utils/constants/api_constants.dart';
import '../../models/advocate_list_model.dart';
import '../../models/client_list_model.dart';

class ApiService {
  Future<ClientListModel?> getClientList(String token) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl.toString() +
          ApiConstants.getClientListEndPoint.toString());
      var response = await http.get(url, headers: <String, String>{
        "Authorization": token.toString(),
      });
      var code = response.statusCode;
      if (response.statusCode == 200) {
        print("$code CODE");
        ClientListModel clientListModel = clientListFromJson(response.body);
        return clientListModel;
      } else {
        print("$code ERROR");
      }
    } catch (e) {
      log(e.toString());
      // print()
    }
    return null;
  }

  Future<Client?> getClientDetails(String userID, String token) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl.toString() +
          ApiConstants.getClientDetailsEndPoint.toString() +
          userID);
      var response = await http.get(url, headers: <String, String>{
        "Authorization": token.toString(),
      });
      //var code = response.statusCode;
      if (response.statusCode == 200) {
        Client client = clientFromJson(response.body);
        return client;
      } else {
        //print("$code ERROR");
      }
    } catch (e) {
      log(e.toString());
      // print()
    }
    return null;
  }

  Future<AdvocateListModel?> getAdvocateList(String token) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl.toString() +
          ApiConstants.getAdvocateListEndPoint.toString());
      var response = await http.get(url, headers: <String, String>{
        "Authorization": token.toString(),
      });
      //var code = response.statusCode;
      if (response.statusCode == 200) {
        AdvocateListModel advocateListModel =
            advocateListFromJson(response.body);
        return advocateListModel;
      } else {
        //print("$code ERROR");
      }
    } catch (e) {
      log(e.toString());
      // print()
    }
    return null;
  }

  Future<Advocate?> getAdvocateDetails(String userID, String token) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl.toString() +
          ApiConstants.getAdvocateDetailsEndPoint.toString() +
          userID);
      var response = await http.get(url, headers: <String, String>{
        "Authorization": token.toString(),
      });
      //var code = response.statusCode;
      if (response.statusCode == 200) {
        Advocate advocate = advocateFromJson(response.body);
        return advocate;
      } else {
        //print("$code ERROR");
      }
    } catch (e) {
      log(e.toString());
      // print()
    }
    return null;
  }

  Future<String?> addClient(String token, Client client) async {
    try {
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.addClientEndPoint);
      var response = await http.post(url,
          headers: <String, String>{
            "Authorization": token.toString(),
          },
          body: json.encode(<String, dynamic>{
            'first_name': client.firstName,
            'last_name': client.lastName,
            'email': client.email,
            'profile_image': client.profileImage,
            'type': client.type,
            'gender': client.gender,
            'dob': client.dob
          }));
      if (response.statusCode == 201) {
        return "Client Added Successfully.";
      } else {
        return "Operaion failed";
      }
    } catch (e) {
      log(e.toString());
      // print()
    }
    return "Failed";
  }

  Future<String?> addAdvocate(String token, Advocate advocate) async {
    try {
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.addAdvocateEndPoint);
      var response = await http.post(url,
          headers: <String, String>{
            "Authorization": token.toString(),
          },
          body: json.encode(<String, dynamic>{
            'first_name': advocate.firstName,
            'last_name': advocate.lastName,
            'email': advocate.email,
            'phone': advocate.phone,
            'undergrad_university': advocate.undergradUniversity,
            'undergrad_year': advocate.undergradYear,
            'postgrad_university': advocate.postgradUniversity,
            'postgrad_year': advocate.postgradYear,
            'dob': advocate.dob,
            'practice_place': advocate.practicePlace,
            'online_time': advocate.onlineTime,
            'bar_registration_date': advocate.barRegistrationDate,
            'bar_council_id': advocate.barCouncilID,
            'bar_council_doc': advocate.barCouncilDoc,
            'gender': advocate.gender,
          }));
      if (response.statusCode == 201) {
        return "Advocate Added Successfully.";
      } else {
        return "Operaion failed";
      }
    } catch (e) {
      log(e.toString());
      // print()
    }
    return "Failed";
  }

  Future<String?> updateClient(
      String token, Client client, String userID) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl +
          ApiConstants.updateClientDetailsEndPoint +
          userID);
      var response = await http.patch(url,
          headers: <String, String>{
            "Authorization": token.toString(),
          },
          body: json.encode(<String, dynamic>{
            'first_name': client.firstName,
            'last_name': client.lastName,
            'email': client.email,
            'profile_image': client.profileImage,
            'gender': client.gender,
            'dob': client.dob,
            'phone': client.phone,
            'location': client.location,
          }));
      if (response.statusCode == 201) {
        return "Client Added Successfully.";
      } else {
        return "Operaion failed";
      }
    } catch (e) {
      log(e.toString());
      // print()
    }
    return "Failed";
  }

  // Future<String?> updateAdvocate(String token, Client client,String userID) async {
  //   try {
  //     var url =
  //         Uri.parse(ApiConstants.baseUrl + ApiConstants.updateAdvocateDetailsEndPoint+userID);
  //     var response = await http.patch(url,
  //         // headers: <String, String>{
  //         //   "Authorization": token.toString(),
  //         // },
  //         body: json.encode(<String, dynamic>{
  //           'first_name': client.firstName,
  //           'last_name': client.lastName,
  //           'email': client.email,
  //           'profile_image': client.profileImage,
  //           'gender': client.gender,
  //           'dob': client.dob,
  //           'phone': client.phone,
  //           'location': client.location,
  //         }));
  //     if (response.statusCode == 201) {
  //       return "Client Added Successfully.";
  //     } else {
  //       return "Operaion failed";
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     // print()
  //   }
  //   return "Failed";
  // }
}
