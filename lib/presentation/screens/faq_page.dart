import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/profile_appbar.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  "FAQ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(),
                Container(),
              ],
            ),
          ),
          Container(
            height: 60,
            color: const Color.fromRGBO(241, 236, 236, 1),
            child: const ListTile(
              leading: Icon(Icons.add),
              iconColor: Colors.black,
              title: Text("How does the payment work ? "),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: const ListTile(
              leading: Icon(Icons.minimize_outlined),
              iconColor: Colors.black,
              title: Text(
                  "Lorem ipsum, in graphical and textual context, refers to filler text that is placed in a document or visual presentation. Lorem ipsum is derived from the Latin dolorem ipsum roughly translated as"),
            ),
          ),
          Container(
            height: 60,
            color: const Color.fromRGBO(241, 236, 236, 1),
            child: const ListTile(
              leading: Icon(Icons.add),
              iconColor: Colors.black,
              title: Text("How does the Booking an advocate work ? "),
            ),
          ),
          Container(
            height: 60,
            color: const Color.fromRGBO(241, 236, 236, 1),
            child: const ListTile(
              leading: Icon(Icons.add),
              iconColor: Colors.black,
              title: Text("How can I contact support ?"),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: const ListTile(
              leading: Icon(Icons.minimize_outlined),
              iconColor: Colors.black,
              title: Text(
                  "Lorem ipsum, in graphical and textual context, refers to filler text that is placed in a document or visual presentation. Lorem ipsum is derived from the Latin dolorem ipsum roughly translated as"),
            ),
          ),
        ],
      ),
    );
  }
}
