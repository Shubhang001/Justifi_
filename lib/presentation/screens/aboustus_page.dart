import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/fraud_prevention_page.dart';
import 'package:jusitfi_admin/presentation/screens/privacy_preventionscree.dart';
import 'package:jusitfi_admin/presentation/screens/riskpolicies_page.dart';
import 'package:jusitfi_admin/presentation/screens/terms_condition.dart';
import 'package:jusitfi_admin/presentation/screens/upi_protection.dart';
import 'package:jusitfi_admin/presentation/widgets/profile_appbar.dart';

class AboutUsPAge extends StatelessWidget {
  const AboutUsPAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileNavBar(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/app_logo.png",
                  height: 160,
                ),
                const Text(
                  "JUSTIFI",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 29,
                  ),
                ),
                Container(),
              ],
            ),
            const Center(
                child: Text(
              "Justifi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                "Connecting clients with the right advocate , seamlessly",
              ),
            ),
            const CustomListTile(
              icon: Icons.mail,
              title: "Justifyspark@gmail.com",
              redirect: false,
            ),
            const CustomListTile(
              icon: Icons.interests,
              title: "www.supportjustifyspark.com",
              redirect: false,
            ),
            const CustomListTile(
              redirect: false,
              icon: Icons.location_on,
              title:
                  "K G Road , Rajmouli center , near N C R nagar - 04 Mumbai - 4579697 , India",
            ),
            const Divider(
              thickness: 3,
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FraudPreventionPage(),
                  ),
                );
              },
              child: const CustomListTile(
                icon: Icons.folder_special_outlined,
                title: "Fraud Prevention",
                redirect: true,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyPreventionPAge(),
                  ),
                );
              },
              child: const CustomListTile(
                icon: Icons.privacy_tip,
                title: "Privacy Policy",
                redirect: true,
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermsCondition(),
                  ),
                );
              },
              child: const CustomListTile(
                icon: Icons.file_copy,
                title: "Terms & Condition",
                redirect: true,
              ),
            ),

            //

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RiskPolicies(),
                  ),
                );
              },
              child: const CustomListTile(
                icon: Icons.warning,
                title: "Risk Policies",
                redirect: true,
              ),
            ),

            //

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UpiPrevention(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: const CustomListTile(
                  icon: Icons.credit_card,
                  title: "Roles and Responsibilities for UPI",
                  redirect: true,
                ),
              ),
            ),

            //
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.redirect,
  });

  final IconData icon;
  final String title;
  final bool redirect;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.white),
        BoxShadow(color: Colors.white),
      ]),
      margin: const EdgeInsets.only(top: 15),
      child: ListTile(
        iconColor: Colors.black,
        leading: Icon(icon),
        title: Text(title),
        trailing: redirect
            ? IconButton(
                splashRadius: 20,
                icon: const Icon(Icons.arrow_right),
                onPressed: () {},
              )
            : null,
      ),
    );
  }
}
