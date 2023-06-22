import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/aboustus_page.dart';
import 'package:jusitfi_admin/presentation/screens/contacus_page.dart';
import 'package:jusitfi_admin/presentation/screens/faq_page.dart';
import 'package:jusitfi_admin/presentation/screens/homepage.dart';
import 'package:jusitfi_admin/presentation/screens/profile_details.dart';
import 'package:jusitfi_admin/presentation/widgets/profile_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileNavBar(),
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
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                ),
                BoxShadow(
                  color: Colors.grey,
                )
              ]),
              margin: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/tw.png"),
                  Image.asset("assets/images/fb.png"),
                  Image.asset("assets/images/in.png"),
                  Image.asset("assets/images/li.png"),
                  Image.asset("assets/images/yt.png"),
                ],
              ),
            ),
            const CustomTile(
              icon: Icons.logout,
              title: "LogOut",
              route: HomePage(),
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
                    context,
                    MaterialPageRoute(builder: (context) => route),
                  );
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
