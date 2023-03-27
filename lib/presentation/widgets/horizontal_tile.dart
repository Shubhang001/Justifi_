import 'package:flutter/material.dart';
import '../../utils/constants/textstyles.dart';
import 'advocate_card.dart';

class HorizontalTiles extends StatelessWidget {
  const HorizontalTiles({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: kHomePageTitle,
        ),
        SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                AdvocateCard(
                  name: 'Priya Sharma',
                  image: 'assets/images/advocate_img.png',
                  education:
                      'LL.B - Delhi University\nCyber Law - Indian Law Institue',
                  distance: 10,
                  rating: 3.5,
                ),
                AdvocateCard(
                  name: 'Priya Sharma',
                  image: 'assets/images/advocate_img.png',
                  education:
                      'LL.B - Delhi University\nCyber Law - Indian Law Institue',
                  distance: 10,
                  rating: 4.5,
                ),
                AdvocateCard(
                  name: 'Priya Sharma',
                  image: 'assets/images/advocate_img.png',
                  education:
                      'LL.B - Delhi University\nCyber Law - Indian Law Institue',
                  distance: 8,
                  rating: 4.5,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
