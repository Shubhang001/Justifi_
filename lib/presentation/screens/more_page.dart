import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jusitfi_admin/api/category/get_categorylist.dart';
import 'package:jusitfi_admin/api/subcategory/get_subcategory.dart';
import 'package:jusitfi_admin/data/models/category_model.dart';
import 'package:jusitfi_admin/presentation/widgets/filter_sort.dart';
import 'package:jusitfi_admin/presentation/widgets/searchbar.dart';
import 'package:jusitfi_admin/presentation/widgets/show_sub_cat.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

import '../../api/base_url.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  late Future<List<dynamic>> categorydetailslist;
  getcat() async {
    categorydetailslist = getCategories();
  }

  @override
  initState() {
    super.initState();
    getcat();
  }

  late Future<List<dynamic>> subCatItems;
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
              Expanded(
                  child: FutureBuilder<List<dynamic>>(
                      future: categorydetailslist,
                      builder: (context, snapshot) {
                        print(snapshot.data);
                        if (snapshot.hasData) {
                          return GridView.builder(
                            itemCount: snapshot.data?.length,
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
                                    subCatItems = getsubcategories(
                                        snapshot.data![index]['id']);
                                  });

                                  ShowSubCat(context, subCatItems);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      "$baseURL${snapshot.data![index]['logo']}",
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    ),
                                    Expanded(
                                      child: Text(
                                        snapshot.data![index]['name'],
                                        style: kMainCategory,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          if (kDebugMode) {
                            print(snapshot.error);
                          }
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
