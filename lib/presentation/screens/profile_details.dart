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
