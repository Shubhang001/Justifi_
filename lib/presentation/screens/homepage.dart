import 'dart:convert';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:jusitfi_admin/presentation/screens/lawyer_profile_temperory.dart';
import 'package:jusitfi_admin/presentation/screens/more_page.dart';
import 'package:jusitfi_admin/presentation/screens/notification_page.dart';
import 'package:jusitfi_admin/presentation/screens/profile_page.dart';
import 'package:jusitfi_admin/presentation/screens/view_all.dart';
import 'package:jusitfi_admin/presentation/widgets/home_nav_bar.dart';
import 'package:jusitfi_admin/presentation/widgets/starrating.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';
import '../widgets/category_tile.dart';
import '../widgets/filter_sort.dart';
//import '../widgets/horizontal_tile.dart';
import '../widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> result = [];
  List<dynamic> result1 = [];
  List<String> suggestions = ['1', '2'];

  @override
  void initState() {
    super.initState();
    fetchUsers();
    fetchUsers1();
  }

  void cityFind() {
    setState(() {
      for (int i = 0; i < result1.length; i++) {
        suggestions[i] = result1[i]['practice_city'];
        print(suggestions[i]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 30, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationsPage(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.black,
                      size: 35,
                    ),
                  )
                ],
              ),
            ),
          ],
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                'assets/icons/profile_new.png',
              ),
            ),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.pin_drop_rounded,
                size: 35,
                color: Colors.black,
              ),
              SizedBox(
                width: 150,
                child: TypeAheadField(
                  animationStart: 0,
                  animationDuration: Duration.zero,
                  textFieldConfiguration: TextFieldConfiguration(
                      //onChanged: ,

                      controller: searchTextController,
                      textAlign: TextAlign.start,
                      autofocus: false,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      decoration: const InputDecoration(
                        focusColor: Colors.white,
                        hintText: "Mumbai",
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 24),
                        enabledBorder: InputBorder.none,
                        disabledBorder: OutlineInputBorder(),
                      )),
                  suggestionsBoxDecoration:
                      SuggestionsBoxDecoration(color: Colors.lightBlue[50]),
                  suggestionsCallback: (pattern) {
                    List<String> matches = <String>[];
                    matches.addAll(suggestions);

                    matches.retainWhere((s) {
                      return s.toLowerCase().contains(pattern.toLowerCase());
                    });
                    return matches;
                  },
                  itemBuilder: (context, sone) {
                    return Card(
                        child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(sone.toString()),
                    ));
                  },
                  onSuggestionSelected: (suggestion) {
                    //
                    searchTextController.text = suggestion.toString();
                  },
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Category',
                      style: kMainCategory,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 75,
                        width: 300,
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              image: result[index]['logo'],
                              name: result[index]['name'],
                              subCatItems: result[index]['subcategories'],
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                        ),
                      ),
                      /*CategoryTile(
                        image: 'assets/category_icons/family and adoption.png',
                        name: 'Family and Adoption',
                        isTransparentBackground: false,
                      ),
                      CategoryTile(
                        image: 'assets/category_icons/cybercrime.png',
                        name: 'Cybercrime',
                      ),*/
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return const MorePage();
                          }));
                        },
                        child: CategoryTile(
                          image: 'assets/category_icons/more.png',
                          name: 'More',
                          is_more: true,
                          subCatItems: [''],
                        ),
                      )
                    ],
                  ),
                  Stack(alignment: Alignment.center, children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/home_rect.png',
                        height: 850,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      bottom: 270,
                      child: Image.asset(
                        'assets/images/advocate.png',
                        width: 300,
                        height: 300,
                      ),
                    ),
                    // const Positioned(
                    //   top: 170,
                    //   child: HorizontalTiles(
                    //     title: 'Lawyers Near Me',
                    //   ),
                    // ),
                    // Positioned(
                    //   top: 450,
                    //   right: 10,
                    //   child: TextButton(
                    //     onPressed: () {
                    //       Navigator.of(context)
                    //           .push(MaterialPageRoute(builder: (_) {
                    //         return const ViewAllPage(
                    //           title: 'Lawyers Near Me',
                    //         );
                    //       }));
                    //     },
                    //     child: Text(
                    //       'View All',
                    //       style: kViewAll,
                    //     ),
                    //   ),
                    // ),

                    // Temporary code , remove after backend work
                    Positioned(
                      top: 120,
                      child: Column(
                        children: [
                          Text(
                            'Popular Lawyers',
                            style: kHomePageTitle,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 301,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 150,
                                    width: 275,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 2.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LawyerProfileScreen(),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 75.0,
                                                backgroundColor:
                                                    Colors.transparent,
                                                child: ClipOval(
                                                  child: Image.asset(
                                                    'assets/images/advocate_img.png',
                                                    width: 120,
                                                    height: 120,
                                                  ),
                                                ),
                                              ),
                                              CircleAvatar(
                                                radius: 60.0,
                                                backgroundColor:
                                                    Colors.transparent,
                                                child: ClipOval(
                                                  child: Image.asset(
                                                    "assets/images/login2.png",
                                                    width: 130,
                                                    height: 130,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            //height: 77,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          8, 4.0, 4, 4),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      const SizedBox(
                                                        width: 3,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            'Sakshi',
                                                            style:
                                                                kAdvocateCardName,
                                                          ),
                                                          const SizedBox(
                                                              height: 5.0),
                                                          // Row(
                                                          //   children: [
                                                          //     const Icon(
                                                          //       Icons.pin_drop,
                                                          //       color: Colors.red,
                                                          //       size: 20,
                                                          //     ),
                                                          //     Text(
                                                          //       '5 kms from your location',
                                                          //       style:
                                                          //           kAdvocateCardLocation,
                                                          //     )
                                                          //   ],
                                                          // ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 100,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            '4.0',
                                                            style:
                                                                kAdvocateCardRating,
                                                          ),
                                                          const StarRating(
                                                              rating: 4)
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  color: Colors.white,
                                                  child: IntrinsicHeight(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Text(
                                                              '13',
                                                              style:
                                                                  kAdvocateCardCount,
                                                            ),
                                                            Text(
                                                              'Clients',
                                                              style:
                                                                  kAdvocateCardCountTitle,
                                                            )
                                                          ],
                                                        ),
                                                        const VerticalDivider(
                                                          color: Colors.black,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text(
                                                              '10',
                                                              style:
                                                                  kAdvocateCardCount,
                                                            ),
                                                            Text(
                                                              'Cases',
                                                              style:
                                                                  kAdvocateCardCountTitle,
                                                            )
                                                          ],
                                                        ),
                                                        const VerticalDivider(
                                                          color: Colors.black,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text(
                                                              '4',
                                                              style:
                                                                  kAdvocateCardCount,
                                                            ),
                                                            Text(
                                                              'Experiences',
                                                              style:
                                                                  kAdvocateCardCountTitle,
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const LawyerProfileScreen(),
                                                          ),
                                                        );
                                                      },
                                                      child: Container(
                                                        height: 20,
                                                        width: 80,
                                                        decoration: BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2)),
                                                        child: Center(
                                                          child: Text(
                                                            'View Profile',
                                                            style:
                                                                kProfileButtonText,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),

                    ////// OLD BACKEND CODE
                    // const Positioned(
                    //   top: 170,
                    //   // top: 500,
                    //   child: HorizontalTiles(
                    //     title: 'Popular Lawyers',
                    //   ),
                    // ),
                    Positioned(
                      top: 430,
                      // top: 780,
                      right: 10,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return const ViewAllPage(
                              title: 'Popular Lawyers',
                            );
                          }));
                        },
                        child: Text(
                          'View All',
                          style: kViewAll,
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ));
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

  Future<void> fetchUsers1() async {
    print('fetchUser called');
    Uri uri;

    uri = Uri.parse("http://65.0.130.67:8000/case/practice-data/");

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);

      setState(() {
        result1 = json['practice_cities'];
        cityFind();
      });
      print('fetchUser complete');
    }
  }
}
