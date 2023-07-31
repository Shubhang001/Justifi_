import 'package:jusitfi_admin/presentation/screens/more_page.dart';
import 'package:jusitfi_admin/presentation/screens/profile_page.dart';
import 'package:jusitfi_admin/presentation/screens/view_all.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';
import '../widgets/category_tile.dart';
import '../widgets/filter_sort.dart';
import '../widgets/horizontal_tile.dart';
import '../widgets/searchbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            const Padding(
              padding: EdgeInsets.only(
                  left: 20, right: 30, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.notifications_outlined,
                    color: Colors.black,
                    size: 35,
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
            child: Image.asset(
              'assets/icons/profile_new.png',
              width: 38,
              height: 38,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.pin_drop_rounded,
                size: 35,
                color: kobbuttonColor,
              ),
              Text(
                "Mumbai",
                style: klocation,
              )
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
                      CategoryTile(
                        image: 'assets/category_icons/criminal.png',
                        name: 'Criminal',
                      ),
                      CategoryTile(
                        image: 'assets/category_icons/family and adoption.png',
                        name: 'Family and Adoption',
                        isTransparentBackground: false,
                      ),
                      CategoryTile(
                        image: 'assets/category_icons/cybercrime.png',
                        name: 'Cybercrime',
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return MorePage();
                          }));
                        },
                        child: CategoryTile(
                          image: 'assets/category_icons/more.png',
                          name: 'More',
                          is_more: true,
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
                      top: 30,
                      child: Image.asset(
                        'assets/images/advocate.png',
                        width: 300,
                        height: 300,
                      ),
                    ),
                    const Positioned(
                      top: 170,
                      child: HorizontalTiles(
                        title: 'Lawyers Near Me',
                      ),
                    ),
                    Positioned(
                        top: 450,
                        right: 10,
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return ViewAllPage(
                                  title: 'Lawyers Near Me',
                                );
                              }));
                            },
                            child: Text(
                              'View All',
                              style: kViewAll,
                            ))),
                    const Positioned(
                      top: 500,
                      child: HorizontalTiles(
                        title: 'Popular Lawyers',
                      ),
                    ),
                    Positioned(
                        top: 780,
                        right: 10,
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return ViewAllPage(
                                  title: 'Popular Lawyers',
                                );
                              }));
                            },
                            child: Text(
                              'View All',
                              style: kViewAll,
                            )))
                  ]),
                ],
              ),
            ),
          ),
        ));
  }
}
