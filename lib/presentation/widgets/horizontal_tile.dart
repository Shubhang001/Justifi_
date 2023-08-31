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
    fetchUsers();
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
              var profileimage = baseurl + res['profile_image'];
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

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: AdvocateCard(
                  name: fullname,
                  image: profileimage,
                  education: qualification,
                  distance: distance,
                  rating: rating,
                  place: place,
                  clients: clients,
                  cases: cases,
                  experience: experience,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> fetchUsers() async {
    print('fetchUser called');
    var uri = Uri.parse("http://15.206.28.255:8000/v1/popular-advocates/");
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
