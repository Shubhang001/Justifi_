import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jusitfi_admin/api/category/get_categorylist.dart';
import 'package:jusitfi_admin/api/subcategory/get_subcategory.dart';
import 'package:jusitfi_admin/data/models/category_model.dart';
import 'package:jusitfi_admin/presentation/widgets/filter_sort.dart';
import 'package:jusitfi_admin/presentation/widgets/searchbar.dart';
import 'package:jusitfi_admin/presentation/widgets/show_sub_cat.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';
import 'package:http/http.dart' as http;
//import '../../api/base_url.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  late Future<List<dynamic>> categorydetailslist;
  List<dynamic> result = [];
  String baseURL1 = "http://65.0.130.67:8000";
  getcat() async {
    categorydetailslist = getCategories();
  }

  @override
  initState() {
    super.initState();
    getcat();
    fetchUsers();
  }

  late List<dynamic> subCatItems;
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
              const Row(
                children: [
                  SearchBarUpdated(
                    backgroundColor: Colors.black,
                    color: Colors.white,
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
              SizedBox(
                  height: 100,
                  child: ListView.builder(
                      //future: categorydetailslist,
                      itemCount: result.length,
                      itemBuilder: (context, index) {
                        // print(snapshot.data);

                        return SizedBox(
                          height: 100,
                          child: GridView.builder(
                            itemCount: result.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: (100 / 150),
                              crossAxisCount: 3,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    subCatItems =
                                        result[index]['subcategories'];
                                  });

                                  ShowSubCat(context, subCatItems);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      result[index]['logo'],
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    ),
                                    Expanded(
                                      child: Text(
                                        result[index]['name'],
                                        style: kMainCategory,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> fetchUsers() async {
    print('fetchUser called');
    Uri uri;

    uri = Uri.parse("http://65.0.130.67:8000/case/category-subcategory/");

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
