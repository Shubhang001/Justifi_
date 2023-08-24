import 'package:flutter/material.dart';
import 'package:jusitfi_admin/data/models/lawyer_model.dart';
import 'package:jusitfi_admin/presentation/widgets/advocate_card_extended.dart';
import 'package:jusitfi_admin/presentation/widgets/filter_sort.dart';
import 'package:jusitfi_admin/presentation/widgets/searchbar.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class ViewAllPage extends StatelessWidget {
  ViewAllPage({super.key, required this.title});
  final String title;
  final List<Lawyer> items = [
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
        distance: 10,
        rating: 3.5,
        clients: 80,
        cases: 80,
        experience: 80),
    Lawyer(
        name: 'Priya Sharma',
        image: 'assets/images/advocate_img.png',
        education: 'Delhi University\nLL.B',
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
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    SearchBarUpdated(
                      backgroundColor: Colors.white,
                      color: Colors.black,
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
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 40),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      style: kHomePageTitle,
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 500,
                    width: 300,
                    child: ListView.builder(
                      itemCount: items.length,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
