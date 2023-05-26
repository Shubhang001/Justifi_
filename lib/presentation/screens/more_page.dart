

import 'package:flutter/material.dart';
import 'package:jusitfi_admin/data/models/category_model.dart';
import 'package:jusitfi_admin/presentation/widgets/filter_sort.dart';
import 'package:jusitfi_admin/presentation/widgets/searchbar.dart';
import 'package:jusitfi_admin/presentation/widgets/show_sub_cat.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class MorePage extends StatelessWidget {
  MorePage({super.key});
  final List<Category> catItems = [
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

  final List<String> subCatItems = [
    'Family and Adoption',
    'Marriage dissolution',
    'Paternity and child custody',
    'Domestic Violence',
    'Name Changes',
    'Guardianship',
    'Termination of Parental Rights and Adoptions',
    'Juvenile matters',
    'Other'
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
                  SearchBarUpdated(
                    backgroundColor: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FilterSort(
                    bgColor: Colors.black,
                    dividerColor: Colors.white,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Category',
                style: kMainCategory,
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: catItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (100 / 150),
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        ShowSubCat(context, subCatItems);
                      
                        
                      
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            catItems[index].image,
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            catItems[index].name,
                            style: kMainCategory,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
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
