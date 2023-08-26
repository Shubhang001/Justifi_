import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:jusitfi_admin/api/lawyers/nearest_advocate.dart';
import 'package:jusitfi_admin/data/models/lawyer_model.dart';
import 'package:jusitfi_admin/presentation/widgets/advocate_card_extended.dart';
import 'package:jusitfi_admin/presentation/widgets/filter_sort.dart';
import 'package:jusitfi_admin/presentation/widgets/searchbar.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class ViewAllPage extends StatefulWidget {
  const ViewAllPage({super.key, required this.title});
  final String title;
  @override
  State<ViewAllPage> createState() => _ViewAllPageState(title: title);
}

class _ViewAllPageState extends State<ViewAllPage> {
  final String title;
  /*final List<Lawyer> items = [
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
  ];*/
  var json;

  var results;
  List<dynamic> results1 = [];
  _ViewAllPageState({required this.title});

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    json = await RemoteService().getNearestAdvocate();
    results = nearestAdvocateFromJson(json);
    results1 = results['results'];
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
                      title,
                      style: kHomePageTitle,
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 500,
                    width: 300,
                    child: ListView.builder(
                      itemCount: results1.length,
                      itemBuilder: (context, index) {
                        var res = results1[index];
                        var fullname = res['full_name'];
                        var profileimage = res['profile_image'];
                        var qualification = res['qualification'];
                        var distance = res['distance'];
                        var rating = res['rating'];
                        var totalclientshandled = res['total_client_handled'];
                        var totalcaseshandled = res['total_case_handled'];
                        var experience = res['total_experience'];
                        return AdvocateCardExtended(
                          name: fullname,
                          image: profileimage,
                          education: qualification,
                          distance: distance,
                          rating: rating,
                          clients: totalclientshandled,
                          cases: totalcaseshandled,
                          experience: experience,
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
}
