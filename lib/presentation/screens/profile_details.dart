import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/notification_page.dart';
import 'package:jusitfi_admin/presentation/widgets/profile_appbar.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black,
          actions: [
            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 30, top: 10, bottom: 10),
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
                "Profile Details",
                style: klocationLight,
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   color: Colors.black,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       IconButton(
              //         onPressed: () {
              //           Navigator.of(context).pop();
              //         },
              //         icon: Icon(Icons.arrow_back, color: Colors.white),
              //       ),
              //       Text('data',style: klocationLight,)
              //     ],
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                ),
              ),
              const InfoTile(
                tileName: "First name :",
                content: "Syed ",
              ),
              const InfoTile(
                tileName: "Last name :",
                content: "Johan",
              ),
              const InfoTile(
                tileName: "Email :",
                content: "syedjohan@gmail.com",
              ),
              const InfoTile(
                tileName: "Date of Birth :",
                content: "      20/01/1985",
              ),
              const InfoTile(
                tileName: "Gender : ",
                content: "KElee",
              ),
              const InfoTile(
                tileName: "Mobile number :",
                content: "KElee",
              ),
              const InfoTile(
                tileName: "City :",
                content: "Mumbai",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  const InfoTile({
    super.key,
    required this.tileName,
    required this.content,
  });

  final String tileName;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      height: 60,
      width: double.infinity,
      color: Colors.grey,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Text(
              tileName,
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              content,
              style: const TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
