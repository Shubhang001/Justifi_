import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/advocate_card_extended.dart';
import 'package:jusitfi_admin/presentation/widgets/filter_sort.dart';
import 'package:jusitfi_admin/presentation/widgets/searchbar.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';
import 'package:http/http.dart' as http;

class ViewAllPage extends StatefulWidget {
  const ViewAllPage({super.key, required this.title});
  final String title;

  @override
  State<ViewAllPage> createState() => _ViewAllPageState();
}

class _ViewAllPageState extends State<ViewAllPage> {
  List<dynamic> result = [];
  var baseurl = "http://15.206.28.255:8000";
  @override
  void initState() {
    super.initState();
    fetchUsers(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(19.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    SearchBarUpdated(
                      backgroundColor: Colors.white,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FilterSort(
                      bgColor: Colors.white,
                      dividerColor: Colors.black,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 40),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.title,
                      style: kHomePageTitle,
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 500,
                    width: 300,
                    child: ListView.builder(
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
                        var qualification = res['qualification'];
                        var userid = res['user_id'];
                        var distance = res['distance'];
                        var place = res['practice_place'];
                        double rating = res['rating'].toDouble();
                        var totalclientshandled = res['total_client_handled'];
                        var totalcaseshandled = res['total_case_handled'];
                        var experience = 0;
                        if (res['total_experience'] != null) {
                          experience = res['total_experience'];
                        }
                        qualification ??= "No qulification";
                        return AdvocateCardExtended(
                          name: fullname,
                          image: profileimage,
                          userid: userid,
                          education: qualification,
                          distance: distance,
                          rating: rating,
                          clients: totalclientshandled,
                          cases: totalcaseshandled,
                          experience: experience,
                          place: place,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
