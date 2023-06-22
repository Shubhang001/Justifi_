import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/profile_appbar.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileNavBar(),
            Container(
              width: double.infinity,
              height: 40,
              color: const Color.fromRGBO(222, 226, 230, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    "Profile Details",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
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
              tileName: "Address  :",
              content:
                  "      MR road , Retul nagar - 9886 MN road\n     Chennai , 78987",
            ),
            const InfoTile(
              tileName: "Gender : ",
              content: "KElee",
            ),
            const InfoTile(
              tileName: "Mobile number :",
              content: "KElee",
            ),
          ],
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
