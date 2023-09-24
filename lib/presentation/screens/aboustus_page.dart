import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/fraud_prevention_page.dart';
import 'package:jusitfi_admin/presentation/screens/privacy_preventionscree.dart';
import 'package:jusitfi_admin/presentation/screens/riskpolicies_page.dart';
import 'package:jusitfi_admin/presentation/screens/terms_condition.dart';
import 'package:jusitfi_admin/presentation/screens/upi_protection.dart';
import 'package:jusitfi_admin/presentation/widgets/profile_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPAge extends StatefulWidget {
  const AboutUsPAge({super.key});

  @override
  State<AboutUsPAge> createState() => _AboutUsPAgeState();
}

class _AboutUsPAgeState extends State<AboutUsPAge> {
  _launchURL() async {
    Uri _url = Uri.parse(
        'https://docs.google.com/document/d/1ZzRBBLXoi4-G4hWQ6krWmOKBG5UfdppY2JI2IYRJUTQ/edit');
    if (await launchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  _UpiURL() async {
    Uri _url = Uri.parse(
        'https://docs.google.com/document/d/1PJuVTxfObOIGBadymBRrr4jLBpTIkGCDoqq8E9xk-x0/edit');
    if (await launchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  _PrivacyURL() async {
    Uri _url = Uri.parse(
        'https://docs.google.com/document/d/12TpZu8tuht--HRrXHfWc3Cr46UKVbNQxBLd1WgYlDJs/edit');
    if (await launchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  _TermsURL() async {
    Uri _url = Uri.parse(
        'https://docs.google.com/document/d/13UZSQxWcY81mau1n5_tqnceEHdMSdpFAbehJ4CGvZsE/edit');
    if (await launchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  _FraudURL() async {
    Uri _url = Uri.parse(
        'https://docs.google.com/document/d/1Rbf1Cqt_Rd3Ck9_Xg31LRpwVinLLZE1mFKbkQRnTpoc/edit');
    if (await launchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [IconButton( onPressed: () {


                    Navigator.of(context).pop();
                  }, icon:Icon(Icons.arrow_back,color:Colors.white),)],),),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/login1.png",
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

              GestureDetector(
                onTap: () {
                  _FraudURL();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const FraudPreventionPage(),
                  //   ),
                  // );
                },
                child: const CustomListTile(
                  icon: Icons.folder_special_outlined,
                  title: "Fraud Prevention",
                  redirect: true,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _PrivacyURL();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const PrivacyPreventionPAge(),
                  //   ),
                  // );
                },
                child: const CustomListTile(
                  icon: Icons.privacy_tip,
                  title: "Privacy Policy",
                  redirect: true,
                ),
              ),

              GestureDetector(
                onTap: () {
                  _TermsURL();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const TermsCondition(),
                  //   ),
                  // );
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
                  _launchURL();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const RiskPolicies(),
                  //   ),
                  // );
                },
                child: const CustomListTile(
                  icon: Icons.warning,
                  title: "Refund and Cancellation Policy",
                  redirect: true,
                ),
              ),

              //

              GestureDetector(
                onTap: () {
                  _UpiURL();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const UpiPrevention(),
                  //   ),
                  // );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: const CustomListTile(
                    icon: Icons.credit_card,
                    title: "Cookies Policy",
                    redirect: true,
                  ),
                ),
              ),

              //
            ],
          ),
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
