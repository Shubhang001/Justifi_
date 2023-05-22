import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/assign_work.dart';
import 'package:jusitfi_admin/presentation/screens/homepage.dart';
import 'package:jusitfi_admin/presentation/screens/schedule3.dart';

import 'presentation/widgets/show_call_details.dart';
import 'presentation/widgets/show_review.dart';

class TestingPage extends StatelessWidget {
  const TestingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {
                  showCallDetails(context);
                },
                child: const Text('Call 2')),
            TextButton(
                onPressed: () {
                  showDialog(context: context, builder: (_) => RatingDialog());
                },
                child: const Text('Call 3')),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Schedule3()));
                },
                child: const Text('Schedule 3')),
          ],
        ),
      ),
    );
  }
}
