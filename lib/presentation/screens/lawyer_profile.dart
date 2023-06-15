import 'package:flutter/material.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class LawyerProfileScreen extends StatefulWidget {
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
      appBar: buildAppBar(),
      body: Column(
        children: [
          Row(
            children: [
              const _ImageContainer(160, 150),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Text(
                      "Priya sharma",
                      style: lawyerName,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 100),
                    child: Row(
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
                  ),
                  const LawyerInfo(),
                ],
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
              children: const <Widget>[
                PracticeArea(),
                Qualification(),
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
  const Court({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(20),
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
            child: Column(
              children: [
                Image.asset("assets/images/court$index.png"),
                const Text("Supreme Court"),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Qualification extends StatelessWidget {
  const Qualification({
    super.key,
  });

  static List<String> college = [
    "LLB University Delhi",
    "Cyber Law - Indian Law Institute",
    "Diploma - NALSAR University"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                height: 135,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(169, 169, 169, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/college3.png"),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Expanded(
                                child: Text(
                                  college[index],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 15),
                                child: const Text(
                                  "October 2021- October2022",
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Image.asset("assets/images/documnet.png"),
                  ],
                ),
              );
            },
          ),
        ),
        const ShareProfile()
      ],
    );
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
            date: "Oct 2021 - Oct 2022",
            jobType: "Senior",
            positionName: "Legal Associate",
            subPositionName: "Consulta Juris",
            titlecard: "Past Experience",
          ),
          PastExperience(
            date: "Oct 2021 - Oct 2022",
            jobType: "Full Time",
            positionName: "Advocate",
            subPositionName: "Seniore",
            titlecard: "Certifications",
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

  static String path = "assets/images";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          margin: const EdgeInsets.only(
            top: 10,
          ),
          width: double.infinity - 40,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("$path/whatsapp.png"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("$path/linkedin.png"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("$path/insta.png"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("$path/facebook.png"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("$path/twitter.png"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("$path/mail.png"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("$path/file.png"),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: const Center(
            child: Text(
              "Share Advocate Profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
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
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: days.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // mainAxisExtent: 4,
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

class PastExperience extends StatelessWidget {
  PastExperience({
    super.key,
    required this.titlecard,
    required this.positionName,
    required this.subPositionName,
    required this.date,
    required this.jobType,
  });

  final String titlecard;
  final String positionName;
  final String subPositionName;
  final String date;
  final String jobType;

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
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                // width: 250,
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
                        const _ImageContainer(50, 50),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 2,
                            left: 8,
                          ),
                          child: Column(
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
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/pdf.png",
                                  ),
                                  const Text(
                                    "Document",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        //
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
    "Family Issues"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < 3; i++)
              Container(
                padding: const EdgeInsets.all(10),
                color: const Color.fromRGBO(30, 30, 30, 1),
                child: Text(
                  expertise[i],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 3; i < 6; i++)
                Container(
                  padding: const EdgeInsets.all(10),
                  color: const Color.fromRGBO(30, 30, 30, 1),
                  child: Text(
                    expertise[i],
                    style: const TextStyle(color: Colors.white),
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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LawyerCTA(icon: "assets/images/call.png", price: "20 Rs"),
              LawyerCTA(icon: "assets/images/message.png", price: "10 Rs"),
              LawyerCTA(icon: "assets/images/video_call.png", price: "30 Rs"),
              LawyerCTA(icon: "assets/images/hand_shake.png", price: "600 Rs"),
            ],
          ),
          Row(
            children: [
              RoundedButton(
                text: "Assign Work",
                color: Colors.black,
                textColor: Colors.white,
                padding: 15,
              ),
            ],
          ),
        ],
      ),
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
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15, left: 10),
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
            margin: const EdgeInsets.only(left: 8, right: 10),
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
                  "Expeirence",
                ),
              ],
            ),
          ),
        ],
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
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(left: 8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: IconButton(onPressed: () {}, icon: Image.asset(icon)),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(price)
      ],
    );
  }
}

class _ImageContainer extends StatelessWidget {
  const _ImageContainer(this.height, this.width);
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            left: 10,
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
          left: 130,
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
