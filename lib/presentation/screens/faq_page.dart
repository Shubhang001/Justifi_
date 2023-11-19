import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/profile_appbar.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';
import 'package:http/http.dart' as http;

const queryColor = Color.fromRGBO(241, 236, 236, 1);

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  List<dynamic> result = [];
  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

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
              padding: const EdgeInsets.only(
                  left: 20, right: 30, top: 10, bottom: 10),
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
                    child: const Icon(
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
                "FAQ",
                style: klocationLight,
              )
            ],
          ),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 20, maxHeight: 300),
          child: ListView.builder(
            itemCount: result.length,
            itemBuilder: (context, index) {
              var res1 = result[index];
              var question = res1['question'];
              var answer = res1['answer'];
              return QnaWidget(question: question, answer: answer);
            },
          ),
        ),
      ),
    );
  }

  Future<void> fetchUsers() async {
    print('fetchUser called');
    var uri = Uri.parse("http://65.0.130.67:8000/advocate-static/faq/");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);

      setState(() {
        result = json;
      });
      print('fetchUser complete');
    }
  }
}

class QnaWidget extends StatelessWidget {
  const QnaWidget({
    super.key,
    required this.question,
    required this.answer,
  });

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: Colors.black,
      collapsedBackgroundColor: queryColor,
      leading: const Icon(Icons.add),
      trailing: const SizedBox(),
      title: Text(question),
      backgroundColor: queryColor,
      children: [
        Container(
          height: 100,
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: ListTile(
            leading: const Icon(Icons.minimize_outlined),
            iconColor: Colors.black,
            title: Text(answer),
          ),
        ),
      ],
    );
  }
}
