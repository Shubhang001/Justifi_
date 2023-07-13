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
          width: MediaQuery.of(context).size.width,
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: const AdvocateCard(
                  name: 'Priya Sharma',
                  image: 'assets/images/advocate_img.png',
                  education: 'Delhi University \n LL.B',
                  distance: 10,
                  rating: 3.5,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
