import 'package:flutter/material.dart';
import 'package:jusitfi_admin/data/models/category_model.dart';
import 'package:jusitfi_admin/presentation/widgets/filter_sort.dart';
import 'package:jusitfi_admin/presentation/widgets/searchbar.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class MorePage extends StatelessWidget {
  MorePage({super.key});
  final List<Category> items = [
    Category(name: 'Criminal', image: 'assets/category_icons/criminal.png'),
    Category(
        name: 'Cyber crime', image: 'assets/category_icons/cybercrime.png'),
    Category(
        name: 'family and adoption',
        image: 'assets/category_icons/family and adoption.png'),
    Category(
        name: 'Civil matters', image: 'assets/category_icons/criminal.png'),
    Category(
        name: 'Consumer protection',
        image: 'assets/category_icons/cybercrime.png'),
    Category(
        name: 'Company and startup',
        image: 'assets/category_icons/family and adoption.png'),
    Category(
        name: 'Employment matter', image: 'assets/category_icons/criminal.png'),
    Category(name: 'Cybercrime', image: 'assets/category_icons/cybercrime.png'),
    Category(
        name: 'Proprerty and real estate',
        image: 'assets/category_icons/family and adoption.png'),
    Category(
        name: 'Family and adoption',
        image: 'assets/category_icons/criminal.png'),
    Category(
        name: 'Micillaneous', image: 'assets/category_icons/cybercrime.png'),
    Category(name: 'Cyber crime', image: 'assets/category_icons/criminal.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SearchBar(backgroundColor: kSearchBarColor),
                  SizedBox(
                    width: 10,
                  ),
                  FilterSort()
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Category',
                style: kMainCategory,
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (100 / 150),
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          items[index].image,
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          items[index].name,
                          style: kMainCategory,
                          textAlign: TextAlign.center,
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
