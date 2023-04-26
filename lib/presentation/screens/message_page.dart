import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/chat_page.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Message",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchBar(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
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
        horizontal: 20,
        vertical: 15,
      ),
      height: 40,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          )),
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.search,
          color: Colors.grey,
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
