import 'package:flutter/material.dart';
import 'package:jusitfi_admin/data/models/lawyer_model.dart';
import 'package:jusitfi_admin/presentation/widgets/advocate_card_extended.dart';
import 'package:jusitfi_admin/presentation/widgets/filter_sort.dart';
import 'package:jusitfi_admin/presentation/widgets/searchbar.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

import '../widgets/category_tile.dart';

class ViewAllPage extends StatelessWidget {
  ViewAllPage({super.key});
  final List<Lawyer> items = [
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'LL.B - Delhi University\nCyber Law - Indian Law Institue',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'LL.B - Delhi University\nCyber Law - Indian Law Institue',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'LL.B - Delhi University\nCyber Law - Indian Law Institue',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'LL.B - Delhi University\nCyber Law - Indian Law Institue',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'LL.B - Delhi University\nCyber Law - Indian Law Institue',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'LL.B - Delhi University\nCyber Law - Indian Law Institue',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'LL.B - Delhi University\nCyber Law - Indian Law Institue',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'LL.B - Delhi University\nCyber Law - Indian Law Institue',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'LL.B - Delhi University\nCyber Law - Indian Law Institue',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'LL.B - Delhi University\nCyber Law - Indian Law Institue',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'LL.B - Delhi University\nCyber Law - Indian Law Institue',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'LL.B - Delhi University\nCyber Law - Indian Law Institue',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(19.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SearchBarUpdated(
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FilterSort(
                      bgColor: Colors.white,
                      dividerColor: Colors.black,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Category',
                            style: kHomePageTitle,
                          ),
                        ),
                        CategoryTile(
                          image: 'assets/category_icons/criminal.png',
                          name: 'Criminal',
                          isDark: true,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Sub - Category',
                            style: kHomePageTitle,
                          ),
                        ),
                        CategoryTile(
                          image: 'assets/category_icons/cybercrime.png',
                          name: 'Cyber Crime',
                          isDark: true,
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 40),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Lawyers Near Me',
                      style: kHomePageTitle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: GridView.builder(
                    itemCount: items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (136 / 165),
                      crossAxisCount: 2,
                      mainAxisSpacing: 40,
                      crossAxisSpacing: 40,
                    ),
                    itemBuilder: (context, index) {
                      return AdvocateCardExtended(
                        name: items[index].name,
                        image: items[index].image,
                        education: items[index].education,
                        distance: items[index].distance,
                        rating: items[index].rating,
                        clients: items[index].clients,
                        cases: items[index].cases,
                        experience: items[index].experience,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
