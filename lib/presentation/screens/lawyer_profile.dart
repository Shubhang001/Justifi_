import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import '../widgets/show_call_details.dart';
import '../widgets/show_call_dialog.dart';
import '../widgets/view_document_dialog_box.dart';
import 'assignwork_lawyer_profile.dart';
import 'schedule3.dart';
import 'package:url_launcher/url_launcher.dart';

class LawyerProfileScreen extends StatefulWidget {
  const LawyerProfileScreen(
      {super.key,
      required this.name,
      required this.userid,
      required this.image,
      required this.education,
      required this.rating,
      required this.cases,
      required this.clients,
      required this.experience,
      required this.place});
  final String name;
  final int userid;
  final String image;
  final String education;
  final double rating;
  final num cases;
  final num clients;
  final num experience;
  final String place;
  @override
  State<LawyerProfileScreen> createState() => _LawyerProfileScreenState();
}

class _LawyerProfileScreenState extends State<LawyerProfileScreen>
    with TickerProviderStateMixin {
  List<dynamic> result1 = [];
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      vsync: this,
      length: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Row(
            children: [
              _ImageContainer(160, 145, widget.image),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        widget.name,
                        style: lawyerName,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                        ),
                        Text(
                          widget.place,
                          style: locationName,
                        ),
                      ],
                    ),
                    LawyerInfo(
                      cases: widget.cases,
                      clients: widget.clients,
                      experience: widget.experience,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const CallToAction(),
          TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: "Details"),
              Tab(text: "Reviews"),
              Tab(text: "Working Hours"),
            ],
            controller: _tabController,
          ),
          Expanded(
            child: SizedBox(
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  DetailSection(
                    education: widget.education,
                    userid: widget.userid,
                  ),
                  ReviewSection(
                    rating: widget.rating,
                    userid: widget.userid,
                  ),
                  const WorkingHours(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      toolbarHeight: 60,
      title: Text(
        "Lawyer Profile",
        style: lawyerProfileTitle,
      ),
      centerTitle: true,
    );
  }
}

class DetailSection extends StatefulWidget {
  const DetailSection({
    super.key,
    required this.education,
    required this.userid,
  });
  final String education;
  final int userid;

  @override
  State<DetailSection> createState() => _DetailSectionState();
}

class _DetailSectionState extends State<DetailSection>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(
      initialIndex: 0,
      vsync: this,
      length: 3,
    );

    return Column(
      children: [
        TabBar(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: "Practice Area"),
            Tab(text: "Qualification"),
            Tab(text: "Court"),
          ],
          controller: _tabController,
        ),
        Expanded(
          child: SizedBox(
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                PracticeArea(
                  userid: widget.userid,
                ),
                Qualification(
                  education: widget.education,
                  userid: widget.userid,
                ),
                Court(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Court extends StatelessWidget {
  Court({
    super.key,
  });
  final List<CourtDetails> courts = [
    CourtDetails(
        title: 'Supreme Court',
        image: 'assets/images/court0.png',
        subtitle: 'Supreme Court of India'),
    CourtDetails(
        title: 'High Court',
        image: "assets/images/court1.png",
        subtitle: 'High Court of India'),
    CourtDetails(
        title: 'District Court',
        image: "assets/images/court2.png",
        subtitle: 'Mumbai District Court')
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(169, 169, 169, 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(
                  courts[index].image,
                  width: 80,
                  height: 80,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    courts[index].title,
                    style: kpageTitleBlack,
                  ),
                  Text(
                    courts[index].subtitle,
                    textAlign: TextAlign.center,
                    style: ksubCatText,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class CourtDetails {
  final String title;
  final String image;
  final String subtitle;

  CourtDetails({
    required this.title,
    required this.image,
    required this.subtitle,
  });
}

class Qualification extends StatefulWidget {
  const Qualification({
    super.key,
    required this.education,
    required this.userid,
  });
  final String education;
  final int userid;
  @override
  State<Qualification> createState() => _QualificationState();
}

class _QualificationState extends State<Qualification> {
  List<dynamic> result4 = [];
  String baseurl = "http://15.206.28.255:8000";

  @override
  void initState() {
    super.initState();
    fetchUsers(widget.userid);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        itemCount: result4.length,
        itemBuilder: (context, index) {
          var res = result4[index];
          var university = res['university'];
          var degree = res['type'];
          var studyfield = res['study_field'];
          var startdate = res['start_date'];
          var enddate = res['end_date'];
          var certificate = baseurl + res['file'];
          return Container(
            padding: const EdgeInsets.only(right: 10, left: 10),
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            constraints: const BoxConstraints(minHeight: 180, maxHeight: 210),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(169, 169, 169, 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                ),
                BoxShadow(color: Colors.black),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Row(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/college3.png"),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 20.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 255,
                              child: Text(
                                university,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                              child: SizedBox(
                                width: 210,
                                child: Text(
                                  "Degree: $degree",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: SizedBox(
                                width: 210,
                                child: Text(
                                  "Study Field: $studyfield",
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: SizedBox(
                                width: 210,
                                child: Text(
                                  "Duration: $startdate to $enddate",
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                              child: Container(
                                height: 25,
                                width: 120,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ViewDocumentDialogBox(
                                              certificate: certificate,
                                            );
                                          });
                                    },
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "View Certificate",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> fetchUsers(int userid) async {
    print('fetchUser called');
    var uri = Uri.parse(
        "http://15.206.28.255:8000/v1/advocate/$userid/qualifications");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);

      setState(() {
        result4 = json['results'];
      });
      print('fetchUser complete');
    }
  }
}

class PracticeArea extends StatefulWidget {
  const PracticeArea({
    super.key,
    required this.userid,
  });
  final int userid;
  @override
  State<PracticeArea> createState() => _PracticeAreaState();
}

class _PracticeAreaState extends State<PracticeArea> {
  List<dynamic> result = [];
  List<dynamic> result1 = [];
  @override
  void initState() {
    super.initState();
    fetchUsers(widget.userid);
    fetchUsers1(widget.userid);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Divider(thickness: 2, color: Colors.black),
          const SizedBox(height: 10),
          Expertise(),
          SizedBox(
            height: 225,
            child: ListView.builder(
                itemCount: result.length,
                itemBuilder: (context, index) {
                  var res1 = result[index];
                  var file = res1['file'];
                  var role = res1['role'];
                  var firm = res1['firm'];
                  var location = res1['location'];
                  var startdate = res1['start_date'];
                  var enddate = res1['end_date'];
                  var date = startdate + " to " + enddate;
                  return PastExperience(
                    imageAsset: "experience.jpg",
                    date: date,
                    jobType: location,
                    positionName: role,
                    subPositionName: firm,
                    titlecard: "Past Experience",
                    holdertext: "Full Time",
                    file: file,
                  );
                }),
          ),
          SizedBox(
            height: 230,
            child: ListView.builder(
                itemCount: result1.length,
                itemBuilder: (context, index) {
                  var res2 = result1[index];
                  var title = res2['title'];
                  var file = res2['file'];
                  var credential = res2['credential'];
                  var issuedon = res2['2023-06-21'];
                  return CertificateSection(
                    imageAsset: "certificate.jpg",
                    file: file,
                    date: "Issued $issuedon -No expiration date",
                    positionName: title,
                    titlecard: "Certifications",
                    holdertext: "Certificate Id - $credential",
                  );
                }),
          ),
          const ShareProfile()
        ],
      ),
    );
  }

  Future<void> fetchUsers(int userid) async {
    print('fetchUser called');

    var uri =
        Uri.parse("http://15.206.28.255:8000/v1/advocate/$userid/experiances");
    print(uri.toString());
    var response = await http.get(uri);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);

      setState(() {
        result = json['results'];
      });
      print('fetchUser complete');
    }
  }

  Future<void> fetchUsers1(int userid) async {
    print('fetchUser called');
    var url = "http://15.206.28.255:8000/v1/advocate/$userid/certificates";
    var uri = Uri.parse(url);
    print(uri.toString());
    var response = await http.get(uri);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);

      setState(() {
        result1 = json['results'];
      });
      print('fetchUser complete');
    }
  }
}

class ShareProfile extends StatelessWidget {
  const ShareProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: GestureDetector(
        onTap: () {
          Share.share('Share Layer Profile with your friends & family',
              subject: 'Share Lawyer Profile');
        },
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Icon(Icons.share),
            ),
            const Text(
              "Share Lawyer Profile",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReviewSection extends StatefulWidget {
  const ReviewSection({
    super.key,
    required this.rating,
    required this.userid,
  });
  final double rating;
  final int userid;

  @override
  State<ReviewSection> createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  List<dynamic> result3 = [];
  var count = 0;

  @override
  void initState() {
    super.initState();
    fetchUsers(widget.userid);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "Total Review",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 5,
                      ),
                      height: 35,
                      width: 120,
                      color: const Color.fromRGBO(223, 178, 0, 1),
                      child: Center(
                        child: Text(
                          "${widget.rating} /5",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 5,
                        left: 10,
                      ),
                      child: Text(
                        "$count Reviews and $count comments",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 5,
                        left: 10,
                      ),
                      child: const Text(
                        "Write a review",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                const Column(
                  children: [
                    ProgressBar(number: 5, val: .4),
                    ProgressBar(number: 4, val: .2),
                    ProgressBar(number: 3, val: .15),
                    ProgressBar(number: 2, val: .15),
                    ProgressBar(number: 1, val: .1),
                  ],
                )
              ],
            ),
          ),
          Review(
            result: result3,
          ),
        ],
      ),
    );
  }

  Future<void> fetchUsers(int userid) async {
    print('fetchUser called');
    var uri =
        Uri.parse("http://15.206.28.255:8000/v1/advocate/$userid/reviews");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);

      setState(() {
        result3 = json['results'];
        count = json['count'];
      });
      print('fetchUser complete');
    }
  }
}

class WorkingHours extends StatelessWidget {
  const WorkingHours({
    super.key,
  });
  static List<String> days = [
    'Monday\n\n9:00 Am - 6:00 Pm',
    'Tuesday\n\n9:00 Am - 6:00 Pm',
    'Wednesday\n\n9:00 Am - 6:00 Pm',
    'Thursday\n\n9:00 Am - 6:00 Pm',
    'Friday\n\n9:00 Am - 6:00 Pm',
    'Saturday\n\n9:00 Am - 4:00 Pm',
    'Sunday\n\n9:00 Am - 12:00 Pm',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: days.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
            border: Border.all(
              width: 2,
              color: Colors.black,
            ),
          ),
          child: Center(
            child: Text(
              days[index],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}

class Review extends StatelessWidget {
  const Review({
    super.key,
    required this.result,
  });
  final List<dynamic> result;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 250,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: const Text(
                    "Reviews",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: result.length,
                itemBuilder: (context, index) {
                  var res = result[index];
                  double rating = res['rating'].toDouble();
                  var review = res['review'];
                  return ReviewContainer(
                    rating: rating,
                    review: review,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReviewContainer extends StatelessWidget {
  const ReviewContainer({
    super.key,
    required this.rating,
    required this.review,
  });
  final double rating;
  final String review;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundImage: NetworkImage(
                        "https://superstarsbio.com/wp-content/uploads/2020/04/John-Doe.jpg",
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const Text(
                        "Donald Micheal",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    "⭐ $rating",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              review,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color.fromRGBO(
                      217,
                      217,
                      217,
                      1,
                    ), // Background Color
                  ),
                  child: const Text(
                    'Helpful',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Text(
                  "2 weeks ago",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.number,
    required this.val,
  });

  final int number;
  final double val;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: Text(number.toString()),
        ),
        Container(
          padding: const EdgeInsets.only(right: 20),
          height: 6,
          width: 100,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey,
            color: const Color.fromRGBO(223, 178, 0, 1),
            value: val,
          ),
        ),
      ],
    );
  }
}

class PastExperience extends StatelessWidget {
  PastExperience({
    super.key,
    required this.titlecard,
    required this.positionName,
    required this.subPositionName,
    required this.date,
    required this.jobType,
    required this.imageAsset,
    required this.holdertext,
    required this.file,
  });

  final String titlecard;
  final String positionName;
  final String subPositionName;
  final String date;
  final String jobType;
  final String holdertext;
  final String imageAsset;
  final String file;
  String baseurl = "http://15.206.28.255:8000";

  final List<String> expertise = [
    "HealthCare",
    "Tax",
    "Intellectual Property",
    "Buisness Law",
    "Civil Rights",
    "Family Issues"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleCard(
          title: titlecard,
          icon: Icons.bubble_chart,
        ),
        Container(
          margin: const EdgeInsets.only(top: 2, bottom: 10),
          height: 175,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Image.asset(
                            height: 45,
                            "assets/images/$imageAsset",
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 2,
                            left: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                positionName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ExperienceTitles(content: subPositionName),
                              ExperienceTitles(content: date),
                              ExperienceTitles(content: jobType),
                              ExperienceTitles(content: holdertext),
                              const SizedBox(height: 10),
                              Container(
                                  height: 28,
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      color: Colors.green),
                                  child: InkWell(
                                    child: const Text(
                                      "View Certificate",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onTap: () async {
                                      String url = baseurl + file;
                                      var urllaunchable = await canLaunch(
                                          url); //canLaunch is from url_launcher package
                                      if (urllaunchable) {
                                        await launch(
                                            url); //launch is from url_launcher package to launch URL
                                      } else {
                                        print("URL can't be launched.");
                                      }
                                    },
                                  )),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CertificateSection extends StatelessWidget {
  CertificateSection({
    super.key,
    required this.file,
    required this.titlecard,
    required this.positionName,
    required this.date,
    required this.imageAsset,
    required this.holdertext,
  });
  final String file;
  final String titlecard;
  final String positionName;
  final String date;
  final String holdertext;
  final String imageAsset;
  String baseurl = "http://15.206.28.255:8000";

  final List<String> expertise = [
    "HealthCare",
    "Tax",
    "Intellectual Property",
    "Buisness Law",
    "Civil Rights",
    "Family Issues"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleCard(
          title: titlecard,
          icon: Icons.bubble_chart,
        ),
        Container(
          margin: const EdgeInsets.only(top: 2, bottom: 10),
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Image.asset(
                            height: 45,
                            "assets/images/$imageAsset",
                          ),
                        ),
                        Container(
                          width: 200,
                          margin: const EdgeInsets.only(
                            top: 2,
                            left: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                positionName,
                                maxLines: 2,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const ExperienceTitles(
                                  content: "Stanford Online"),
                              ExperienceTitles(content: date),
                              ExperienceTitles(content: holdertext),
                              const SizedBox(height: 10),
                              Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    color: Colors.green,
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      String url = baseurl + file;
                                      var urllaunchable = await canLaunch(
                                          url); //canLaunch is from url_launcher package
                                      if (urllaunchable) {
                                        await launch(
                                            url); //launch is from url_launcher package to launch URL
                                      } else {
                                        print("URL can't be launched.");
                                      }
                                    },
                                    child: const Text(
                                      "View Certiffications",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ExperienceTitles extends StatelessWidget {
  const ExperienceTitles({
    super.key,
    required this.content,
  });
  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(color: Colors.white),
    );
  }
}

class TitleCard extends StatelessWidget {
  const TitleCard({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 10),
      child: Row(
        children: [
          Icon(icon),
          Container(
              margin: const EdgeInsets.only(left: 2),
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}

class Expertise extends StatelessWidget {
  Expertise({
    super.key,
  });
  final List<String> expertise = [
    "HealthCare",
    "Tax",
    "Intellectual Property",
    "Buisness Law",
    "Civil Rights",
    "Family Issues",
    'Criminal',
    'Cybercrime',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; i < expertise.length ~/ 2; i++)
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: const Color.fromRGBO(30, 30, 30, 1),
                    child: Text(
                      expertise[i],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = expertise.length ~/ 2; i < expertise.length; i++)
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: const Color.fromRGBO(30, 30, 30, 1),
                    child: Text(
                      expertise[i],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class Details extends StatelessWidget {
  const Details({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RoundedButton(
          text: "Practice Area",
          padding: 6,
          color: Color.fromRGBO(217, 217, 217, 1),
          textColor: Colors.black,
        ),
        RoundedButton(
          text: "Qualification",
          textColor: Colors.black,
          padding: 6,
          color: Color.fromRGBO(217, 217, 217, 1),
        ),
        RoundedButton(
          text: "Court",
          textColor: Colors.black,
          color: Color.fromRGBO(217, 217, 217, 1),
          padding: 6,
        ),
      ],
    );
  }
}

class TopNav extends StatelessWidget {
  const TopNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RoundedButton(
          text: "Details",
          color: Color.fromRGBO(217, 217, 217, 1),
          padding: 14,
          textColor: Colors.black,
        ),
        RoundedButton(
          text: "Review",
          textColor: Colors.black,
          padding: 14,
          color: Color.fromRGBO(217, 217, 217, 1),
        ),
        RoundedButton(
          text: "Working Hours",
          textColor: Colors.black,
          color: Color.fromRGBO(217, 217, 217, 1),
          padding: 14,
        ),
      ],
    );
  }
}

class CallToAction extends StatelessWidget {
  const CallToAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context2) {
                        return CustomDialog(
                          onCallNowPressed: () {
                            showCallDetails(context, 'Audio Call');
                          },
                          onScheduleNowPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Schedule3(
                                          mode: 'Phone Call',
                                        )));
                          },
                        );
                      },
                    );
                  },
                  child: const LawyerCTA(
                      icon: "assets/images/call.png", price: "20")),
              InkWell(
                  onTap: () {
                    DialogService.showNotAvailableDialog(context);
                  },
                  child: const LawyerCTA(
                      icon: "assets/images/chat.png", price: "10")),
              InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context2) {
                        return CustomDialog(
                          onCallNowPressed: () {
                            showCallDetails(context, 'Video Call');
                          },
                          onScheduleNowPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Schedule3(
                                          mode: 'Video Call',
                                        )));
                          },
                        );
                      },
                    );
                  },
                  child: const LawyerCTA(
                      icon: "assets/images/video_call.png", price: "30")),
              InkWell(
                  onTap: () {
                    DialogService.showNotAvailableDialog(context);
                  },
                  child: const LawyerCTA(
                      icon: "assets/images/hand_shake.png", price: "600")),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return AssignWorkLawyerProfile();
              }));
            },
            child: const RoundedButton(
              text: "Assign Work",
              color: Colors.black,
              textColor: Colors.white,
              padding: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class DialogService {
  static void showNotAvailableDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          title: const Text('Service Not Available'),
          content: const Text('Sorry, the service is not available yet.'),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.padding,
  });
  final String text;
  final Color textColor;
  final Color color;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      // height: 55,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          )),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 18),
      ),
    );
  }
}

class LawyerInfo extends StatelessWidget {
  const LawyerInfo({
    super.key,
    required this.clients,
    required this.cases,
    required this.experience,
  });
  final num clients;
  final num cases;
  final num experience;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(
                right: 10,
                left: 2,
              ),
              child: Column(
                children: [
                  Text(
                    clients.toString(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "clients",
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: 2,
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Text(
                    cases.toString(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Cases",
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: 2,
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  Text(
                    experience.toString(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Experience",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LawyerCTA extends StatelessWidget {
  const LawyerCTA({
    super.key,
    required this.icon,
    required this.price,
  });
  final String icon;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                icon,
                width: 30,
                height: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Image.asset(
                'assets/icons/coin_symbol.png',
                color: Colors.black,
                width: 20,
                height: 20,
              ),
              Text(
                price,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _ImageContainer extends StatelessWidget {
  const _ImageContainer(this.height, this.width, this.image);
  final double height;
  final double width;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            left: 5,
          ),
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            ),
            color: Colors.black,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 135,
          child: Container(
            height: 15,
            width: 15,
            decoration: const BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        )
      ],
    );
  }
}
