import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/notification_page.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';
// import 'package:justifi_advocate/presentation/screens/signup/signup_details.dart';
// import 'package:justifi_advocate/presentation/widgets/custom_app_bar_profile.dart';
// import 'package:justifi_advocate/utils/constants/textstyles.dart';
import 'package:share_plus/share_plus.dart';
import 'schedule3.dart';
import '../widgets/show_call_details.dart';
import '../widgets/show_call_dialog.dart';
import '../widgets/view_document_dialog_box.dart';

class LawyerProfileScreen extends StatefulWidget {
  static const routeName = "/lawyerprofile";
  const LawyerProfileScreen({super.key});

  @override
  State<LawyerProfileScreen> createState() => _LawyerProfileScreenState();
}

class _LawyerProfileScreenState extends State<LawyerProfileScreen>
    with TickerProviderStateMixin {
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
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 30, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationsPage(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                )
              ],
            ),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Profile",
              style: klocationLight,
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Stack(children: [
                Row(
                  children: [
                    const _ImageContainer(160, 150, "advocate_img.png"),
                    Container(
                      margin: const EdgeInsets.only(left: 10, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Priya sharma",
                            style: lawyerName,
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
                                "Mumbai",
                                style: locationName,
                              ),
                            ],
                          ),
                          const LawyerInfo(),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return const SignUpDetails(isEdit: true);
                      //     },
                      //   ),
                      // );
                    },
                    icon: const Icon(Icons.mode_edit_outline_outlined),
                    iconSize: 20,
                  ),
                )
              ]),
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
                  children: const [
                    DetailSection(),
                    ReviewSection(),
                    WorkingHours()
                  ],
                ),
              ),
            ),
          ],
        ),
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
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: const Icon(Icons.menu),
        ),
      ],
    );
  }
}

class DetailSection extends StatefulWidget {
  const DetailSection({
    super.key,
  });

  @override
  State<DetailSection> createState() => _DetailSectionState();
}

class _DetailSectionState extends State<DetailSection>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(
      initialIndex: 2,
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
            Tab(text: "Court/Bar"),
          ],
          controller: _tabController,
        ),
        Expanded(
          child: SizedBox(
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                const PracticeArea(),
                const Qualification(),
                Court(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Court extends StatefulWidget {
  const Court({super.key});

  @override
  State<Court> createState() => _CourtState();
}

class _CourtState extends State<Court> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    return Column(
      children: [
        TabBar(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(
              text: 'Court',
            ),
            Tab(
              text: 'Bar',
            ),
          ],
          controller: _tabController,
        ),
        Expanded(
          child: SizedBox(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                CourtTab(),
                const BarTab(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//.... COURT TAB
class CourtTab extends StatelessWidget {
  CourtTab({super.key});

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
        subtitle: 'Mumbai District Court'),
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
                  'assets/images/court1.png',
                  width: 80,
                  height: 80,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Supreme court',
                    style: kpageTitleBlack,
                  ),
                  Text(
                    'Supreme court of India',
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

//....BAR TAB
class BarTab extends StatelessWidget {
  const BarTab({super.key});

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
              // bar icon
              Expanded(
                child: Image.asset(
                  'assets/images/court2.png',
                  width: 80,
                  height: 80,
                ),
              ),
              // details and certificate
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Bar Name
                    const Text(
                      'Bar Name',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    // Registration Year
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Registration Year",
                        maxLines: 2,
                      ),
                    ),
                    // Bar ID
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Bar ID",
                        textAlign: TextAlign.center,
                        maxLines: 3,
                      ),
                    ),
                    //button
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () {},
                        child: const Text(
                          "Certificate",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

///////// OLD COURT CODE
// class Court extends StatelessWidget {
//   final List<CourtDetails> courts = [
//     CourtDetails(
//         title: 'Supreme Court',
//         image: 'assets/images/court0.png',
//         subtitle: 'Supreme Court of India'),
//     CourtDetails(
//         title: 'High Court',
//         image: "assets/images/court1.png",
//         subtitle: 'High Court of India'),
//     CourtDetails(
//         title: 'District Court',
//         image: "assets/images/court2.png",
//         subtitle: 'Mumbai District Court')
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container();

//     //////// OLD COURT CODE
//     // GridView.builder(
//     //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//     //     crossAxisCount: 2,
//     //   ),
//     //   itemCount: 3,
//     //   itemBuilder: (context, index) {
//     //     return Padding(
//     //       padding: const EdgeInsets.only(
//     //         top: 18.0,
//     //       ),
//     //       child: Container(
//     //         margin: const EdgeInsets.symmetric(horizontal: 20),
//     //         padding: const EdgeInsets.symmetric(horizontal: 20),
//     //         decoration: const BoxDecoration(
//     //           color: Color.fromRGBO(169, 169, 169, 1),
//     //           boxShadow: [
//     //             BoxShadow(
//     //               color: Colors.black,
//     //               offset: Offset(
//     //                 5.0,
//     //                 5.0,
//     //               ),
//     //               blurRadius: 10.0,
//     //               spreadRadius: 2.0,
//     //             ), //BoxShadow
//     //             BoxShadow(
//     //               color: Colors.white,
//     //               offset: Offset(0.0, 0.0),
//     //               blurRadius: 0.0,
//     //               spreadRadius: 0.0,
//     //             ), //BoxShadow
//     //           ],
//     //           borderRadius: BorderRadius.all(
//     //             Radius.circular(25),
//     //           ),
//     //         ),
//     //         child: Column(
//     //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //           children: [
//     //             Text(
//     //               courts[index].title,
//     //               style: kpageTitleBlack,
//     //             ),
//     //             Padding(
//     //               padding: const EdgeInsets.all(4.0),
//     //               child: Image.asset(
//     //                 courts[index].image,
//     //                 width: 70,
//     //                 height: 70,
//     //               ),
//     //             ),
//     //             Text(
//     //               courts[index].subtitle,
//     //               textAlign: TextAlign.center,
//     //               style: ksubCatText,
//     //             ),
//     //           ],
//     //         ),
//     //       ),
//     //     );
//     //   },
//     // );
//   }
// }

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

class Qualification extends StatelessWidget {
  const Qualification({
    super.key,
  });

  static List<String> college = [
    "Delhi University\nLLB ",
    "Indian Law Institute\nCyber Law",
    "NALSAR University\nDiploma"
  ];

  //static List<String> qualification = ["LLB", "Cyber Law", "Diploma"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(right: 10, left: 10),
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            constraints: BoxConstraints(minHeight: 180, maxHeight: 210),
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
            // child: FittedBox(
            //   fit: BoxFit.contain,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const Padding(
            //         padding: EdgeInsets.fromLTRB(16.0, 14.0, 8.0, 0.0),
            //         child: SizedBox(
            //           width: 210,
            //           child: Text(
            //             'degree',
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold, fontSize: 18),
            //           ),
            //         ),
            //       ),
            //       Row(
            //         children: [
            //           Container(
            //             constraints: const BoxConstraints(
            //                 minWidth: 30, maxWidth: 70, minHeight: 45),
            //             child: Image.asset('assets/icons/graduation.png'),
            //           ),
            //           const Padding(
            //             padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 20.0),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 SizedBox(
            //                   width: 255,
            //                   child: Text(
            //                     'university',
            //                     maxLines: 2,
            //                     style: TextStyle(
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 18,
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           const Padding(
            //             padding: EdgeInsets.only(top: 10.0),
            //             child: SizedBox(
            //               width: 210,
            //               child: Text(
            //                 "studyfield",
            //                 maxLines: 2,
            //               ),
            //             ),
            //           ),
            //           const Padding(
            //             padding: EdgeInsets.only(top: 10.0),
            //             child: SizedBox(
            //               width: 210,
            //               child: Text(
            //                 "20/10/2021 to 20/10/2023",
            //                 maxLines: 2,
            //               ),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(top: 12.0, right: 8.0),
            //             child: Row(
            //               crossAxisAlignment: CrossAxisAlignment.end,
            //               mainAxisAlignment: MainAxisAlignment.end,
            //               children: [
            //                 const SizedBox(
            //                   width: 250,
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.fromLTRB(
            //                       8.0, 12.0, 8.0, 0.0),
            //                   child: Container(
            //                     height: 25,
            //                     width: 100,
            //                     decoration: const BoxDecoration(
            //                       color: Colors.green,
            //                       borderRadius: BorderRadius.all(
            //                         Radius.circular(20),
            //                       ),
            //                     ),
            //                     child: Align(
            //                       alignment: Alignment.topRight,
            //                       child: ElevatedButton(
            //                         onPressed: () {},
            //                         child: const Align(
            //                           alignment: Alignment.center,
            //                           child: Text(
            //                             "Certificate",
            //                             style: TextStyle(
            //                               color: Colors.white,
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //                 const SizedBox(
            //                   width: 20,
            //                 )
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Degree and logo
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Degree',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        width: 75,
                        child: Image.asset('assets/icons/graduation.png'),
                      ),
                    ],
                  ),
                ),
                // university
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Indian scool of Law',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      // studyfield
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Commercial appeal",
                          maxLines: 2,
                        ),
                      ),
                      //date
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "August 2021 to August 2023",
                          textAlign: TextAlign.center,
                          maxLines: 3,
                        ),
                      ),
                      //button
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          onPressed: () {},
                          child: const Text(
                            "Certificate",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    /////////////// OLD QUALIFICATION CODE
    // SizedBox(
    //   height: 500,
    //   child: ListView.builder(
    //     itemCount: 3,
    //     itemBuilder: (context, index) {
    //       return Container(
    //         padding: const EdgeInsets.symmetric(horizontal: 10),
    //         margin: const EdgeInsets.symmetric(
    //           horizontal: 10,
    //           vertical: 15,
    //         ),
    //         height: 135,
    //         width: double.infinity,
    //         decoration: const BoxDecoration(
    //           color: Color.fromRGBO(169, 169, 169, 1),
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.black,
    //               offset: Offset(
    //                 0.0,
    //                 2.0,
    //               ),
    //             ),
    //             BoxShadow(color: Colors.black),
    //           ],
    //           borderRadius: BorderRadius.all(
    //             Radius.circular(20),
    //           ),
    //         ),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Row(
    //               children: [
    //                 Image.asset("assets/images/college3.png"),
    //                 Container(
    //                   margin: const EdgeInsets.all(20),
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text(
    //                         college[index],
    //                         style: const TextStyle(
    //                           fontWeight: FontWeight.bold,
    //                           fontSize: 18,
    //                         ),
    //                       ),
    //                       Container(
    //                         margin: const EdgeInsets.only(top: 15),
    //                         child: const Text(
    //                           "October 2021- October2022",
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                 )
    //               ],
    //             ),
    //             InkWell(
    //               onTap: () {
    //                 // showDialog(
    //                 //   context: context,
    //                 //   builder: (BuildContext context) {
    //                 //     return const ViewDocumentDialogBox();
    //                 //   },
    //                 // );
    //               },
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Image.asset("assets/images/documnet.png"),
    //                   const SizedBox(height: 10),
    //                   const Text(
    //                     "View",
    //                     style: TextStyle(
    //                       color: Colors.white,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}

class PracticeArea extends StatelessWidget {
  const PracticeArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Divider(thickness: 2, color: Colors.black),
          const SizedBox(height: 10),
          Expertise(),
          PastExperience(
            imageAsset: "experience.jpg",
            date: "Oct 2021 - Oct 2022",
            jobType: "Mumbai, Maharastra,India",
            positionName: "Legal Associate",
            subPositionName: "Google Technologies",
            titlecard: "Past Experience",
            holdertext: "Full Time",
          ),
          CertificateSection(
            imageAsset: "certificate.jpg",
            date: "Issued Jan 2022 - No expiration date",
            positionName: "Certification Course in \nCyber Law",
            titlecard: "Certifications",
            holdertext: "Certificate Id - 15646",
          ),
          const ShareProfile()
        ],
      ),
    );
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

class ReviewSection extends StatelessWidget {
  const ReviewSection({
    super.key,
  });

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
                      child: const Center(
                        child: Text(
                          "3.5 / 5",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 5,
                        left: 10,
                      ),
                      child: const Text(
                        "20 Reviews and 4 comments",
                        style: TextStyle(
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
          const Review(),
        ],
      ),
    );
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
  });

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
                itemCount: 8,
                itemBuilder: (context, index) {
                  return const ReviewContainer();
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
  });

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
                    // const CircleAvatar(
                    //   radius: 22,
                    //   backgroundImage: NetworkImage(
                    //     "https://superstarsbio.com/wp-content/uploads/2020/04/John-Doe.jpg",
                    //   ),
                    // ),
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
                  child: const Text(
                    "⭐ 5",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum, veritatis. Commodi voluptates ea minus exercitationem reiciendis natus at corporis hic dignissimos alias. Repudiandae odio neque, dignissimos libero reprehenderit id esse.",
              style: TextStyle(color: Colors.white),
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

class CertificateSection extends StatelessWidget {
  CertificateSection({
    super.key,
    required this.titlecard,
    required this.positionName,
    required this.date,
    required this.imageAsset,
    required this.holdertext,
  });

  final String titlecard;
  final String positionName;
  final String date;
  final String holdertext;
  final String imageAsset;

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
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
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
                                child: const Text(
                                  "View Certifications",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
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
  });

  final String titlecard;
  final String positionName;
  final String subPositionName;
  final String date;
  final String jobType;
  final String holdertext;
  final String imageAsset;

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
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
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
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  color: Colors.green,
                                ),
                                child: const Text(
                                  "View Certifications",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
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
              for (int i = 0; i < (expertise.length / 2).toInt(); i++)
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
              for (int i = (expertise.length / 2).toInt();
                  i < expertise.length;
                  i++)
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
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
              child: const Column(
                children: [
                  Text(
                    "80",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
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
              child: const Column(
                children: [
                  Text(
                    "100",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
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
              child: const Column(
                children: [
                  Text(
                    "8 yrs",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
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
  const _ImageContainer(this.height, this.width, this.img);
  final double height;
  final double width;
  final String img;

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
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/advocate_img.png",
              ),
            ),
            color: Colors.black,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        Positioned(
          top: 15,
          left: 140,
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
