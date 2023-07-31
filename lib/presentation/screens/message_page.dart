import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/chatpage.dart';
import 'package:jusitfi_admin/presentation/screens/profile_page.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryBlackColor,
        actions: [
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 30, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                  size: 35,
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
          child: Image.asset(
            'assets/icons/profile_new.png',
            color: Colors.white,
            width: 38,
            height: 38,
          ),
        ),
        title: Text(
          "Message",
          style: kHomePageTitle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SearchBar(),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    margin: const EdgeInsets.only(right: 20),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_upward_rounded,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 5),
                        Container(
                          color: Colors.black,
                          height: 40,
                          width: 2,
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            for (int i = 0; i < 4; i++) const CaseTile(),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      height: 40,
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        margin: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        child: const TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.search,
            ),
            suffixIconColor: Colors.white,
          ),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CaseTile extends StatelessWidget {
  const CaseTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 10,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatPage(),
                  ));
            },
            child: Row(
              children: [
                Column(
                  children: const [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(
                        "assets/images/advocate_image.png",
                      ),
                    ),
                    Text(
                      "Priya Sharma",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 60),
                  child: const Text(
                    "Case Title : ABC",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 2,
          color: Colors.black,
        ),
      ],
    );
  }
}
