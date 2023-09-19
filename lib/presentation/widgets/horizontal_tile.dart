import 'dart:convert';

import 'package:flutter/material.dart';
import '../../utils/constants/textstyles.dart';
import 'advocate_card.dart';
import 'package:http/http.dart' as http;

class HorizontalTiles extends StatefulWidget {
  const HorizontalTiles({super.key, required this.title});
  final String title;

  @override
  State<HorizontalTiles> createState() => _HorizontalTilesState();
}

class _HorizontalTilesState extends State<HorizontalTiles> {
  List<dynamic> result = [];
  var baseurl = "http://15.206.28.255:8000";
  @override
  void initState() {
    super.initState();
    fetchUsers(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: kHomePageTitle,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: result.length,
            itemBuilder: (context, index) {
              var res = result[index];
              var fullname = res['full_name'];
              String profileimage;
              if (res['profile_image'] == null) {
                profileimage =
                    "https://imgs.search.brave.com/2EijPI14qdKvk0dFQldOjE3AG2D0Zs9Gltn5aFkk0Fo/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9jZG4u/dmVjdG9yc3RvY2su/Y29tL2kvcHJldmll/dy0xeC80Ny85My9w/ZXJzb24taWNvbi1p/Y29uaWMtZGVzaWdu/LXZlY3Rvci0xODMx/NDc5My5qcGc";
              } else {
                profileimage = baseurl + res['profile_image'];
              }
              var userid = res['user_id'];
              var qualification = res['qualification'];
              var distance = res['distance'];
              double rating = res['rating'].toDouble();
              var place = res['practice_place'];
              var clients = res['total_client_handled'];
              var cases = res['total_case_handled'];
              var experience = 0;
              if (res['total_experience'] != null) {
                experience = res['total_experience'];
              }
              qualification ??= "No qulification";
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: AdvocateCard(
                  name: fullname ?? "",
                  image: profileimage ?? "",
                  education: qualification ?? "",
                  distance: distance ?? 0.0,
                  rating: rating ?? 0.0,
                  place: place ?? "",
                  clients: clients ?? 0,
                  cases: cases ?? 0,
                  experience: experience ?? 0,
                  userid: userid,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> fetchUsers(String title) async {
    print('fetchUser called');
    Uri uri;
    if (title == 'Lawyers Near Me') {
      uri = Uri.parse("http://15.206.28.255:8000/v1/nearest-advocates");
    } else {
      uri = Uri.parse("http://15.206.28.255:8000/v1/popular-advocates/");
    }
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);

      setState(() {
        result = json['results'];
      });
      print('fetchUser complete');
    }
  }
}
