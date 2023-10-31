import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/aboustus_page.dart';
import 'package:jusitfi_admin/presentation/screens/contacus_page.dart';
import 'package:jusitfi_admin/presentation/screens/faq_page.dart';
import 'package:jusitfi_admin/presentation/screens/login_screen.dart';
import 'package:jusitfi_admin/presentation/screens/profile_details.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants/textstyles.dart';
import 'notification_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
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
            padding:
                const EdgeInsets.only(left: 20, right: 30, top: 10, bottom: 10),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Center(
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: const CustomTile(
                icon: Icons.person,
                title: "Profile Details",
                route: ProfileDetails(),
              ),
            ),
            const CustomTile(
              icon: Icons.message,
              title: "Contact Us",
              route: ContactUsPage(),
            ),
            const CustomTile(
              icon: Icons.format_quote,
              title: "FAQ",
              route: FaqPage(),
            ),
            const CustomTile(
              icon: Icons.person_sharp,
              title: "About Us",
              route: AboutUsPAge(),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey),
                        BoxShadow(color: Colors.grey),
                      ],
                    ),
                    child: Material(
                      color: Colors.white,
                      child: GestureDetector(
                        onTap: () {},
                        child: ListTile(
                            iconColor: Colors.black,
                            // leading: Icon(Icons.share),
                            leading:
                                Image.asset("assets/images/send-share.png"),
                            title: Text('Invite and Share the App'),
                            trailing: IconButton(
                              icon: const Icon(Icons.share),
                              onPressed: () {
                                Share.share(
                                    'Share Justifi with your friends & family',
                                    subject: 'Share Justifi App');
                              },
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey),
                        BoxShadow(color: Colors.grey),
                      ],
                    ),
                    child: Material(
                      color: Colors.white,
                      child: GestureDetector(
                        onTap: () {
                          _removeToken(); // Remove token on logout
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (Route<dynamic> route) => false);
                        },
                        child: ListTile(
                            iconColor: Colors.black,
                            leading: Icon(Icons.logout),
                            title: Text("LogOut"),
                            trailing: IconButton(
                              icon: const Icon(Icons.keyboard_arrow_right),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                    (Route<dynamic> route) => false);
                              },
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const ListTile(
              title: Center(child: Text("App Version 4.087")),
            )
          ],
        ),
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.icon,
    required this.title,
    required this.route,
  });

  final IconData icon;
  final String title;
  final route;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey),
                BoxShadow(color: Colors.grey),
              ],
            ),
            child: Material(
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => route));
                },
                child: ListTile(
                    iconColor: Colors.black,
                    leading: Icon(icon),
                    title: Text(title),
                    trailing: IconButton(
                      icon: const Icon(Icons.keyboard_arrow_right),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => route),
                        );
                      },
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
