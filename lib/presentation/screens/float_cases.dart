import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jusitfi_admin/presentation/screens/floatcases2.dart';
import 'package:jusitfi_admin/presentation/screens/notification_page.dart';
import 'package:jusitfi_admin/presentation/screens/profile_page.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class FloatCases extends StatefulWidget {
  const FloatCases({super.key});

  @override
  State<FloatCases> createState() => _FloatCasesState();
}

class _FloatCasesState extends State<FloatCases> {
  // @override
  // void initState() {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     //Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => FinishedPage(text: 'Your application has been submitted', nextPage: FloatCases4(), nextPageName: 'View Status'), ));
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (_) => FloatCases2(),
  //         ));
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Stack(
      //   children: [
      //     SizedBox(
      //       width: double.infinity,
      //       height: MediaQuery.of(context).size.height,
      //     ),
      //     Positioned(
      //         left: MediaQuery.of(context).size.width / 3,
      //         bottom: MediaQuery.of(context).size.height / 2 - 30,
      //         child:
      //             Center(child: Image.asset('assets/images/float_icon.png'))),
      //     Positioned(
      //       bottom: 0,
      //       child: Container(
      //         color: Colors.black,
      //         width: MediaQuery.of(context).size.width,
      //         height: MediaQuery.of(context).size.height / 2,
      //       ),
      //     ),
      //   ],
      // ),
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
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              'assets/icons/profile_new.png',
              color: Colors.white,
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Post Case",
              style: klocationLight,
            )
          ],
        ),
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Service not available yet',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
