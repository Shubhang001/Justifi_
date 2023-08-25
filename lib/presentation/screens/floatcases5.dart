import 'package:flutter/material.dart';

import 'package:jusitfi_admin/presentation/screens/floatcases9.dart';
import 'package:jusitfi_admin/presentation/widgets/notes.dart';
import 'package:jusitfi_admin/presentation/widgets/starrating.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';

import '../../utils/constants/textstyles.dart';
import '../widgets/filter_sort.dart';

class FloatCases5 extends StatefulWidget {
  const FloatCases5({super.key});

  @override
  State<FloatCases5> createState() => _FloatCases5State();
}

class _FloatCases5State extends State<FloatCases5> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  )),
              Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.black,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Applications',
                        style: kTitle,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Divider(),
                      LawyerHireDetails(),
                      Divider(),
                      LawyerHireDetails(),
                      Divider(),
                      LawyerHireDetails(),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LawyerHireDetails extends StatelessWidget {
  const LawyerHireDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 120,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Image.asset('assets/images/advocate_img.png'),
                      const Text('Priya Sharma')
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Experience : 10+ years',
                      style: kCallAns,
                    ),
                    Text(
                      'Fees : One Time ',
                      style: kCallAns,
                    ),
                    Text(
                      'Total Cases Solved : 502',
                      style: kCallAns,
                    ),
                    Row(
                      children: [
                        Text(
                          'Rating: ',
                          style: kCallAns,
                        ),
                        const StarRating(rating: 3)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 80,
                ),
                Text(
                  'Expected Completion Time: 5 Days',
                  style: kCallAns,
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: InkWell(
                onTap: () {
                  showNotes(context);
                },
                child: Container(
                  width: 60,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    'View Note',
                    style: kSmallHintDark,
                  )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: InkWell(
                onTap: () {
                  floatCases9(context);
                },
                child: Container(
                  width: 60,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    'Hire',
                    style: kSmallHintDark,
                  )),
                ),
              ),
            ),
            Text(
              '₹ 10000000',
              style: kCallAns,
            )
          ],
        )
      ],
    );
  }
}
