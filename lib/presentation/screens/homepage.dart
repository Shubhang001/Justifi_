import 'package:jusitfi_admin/presentation/screens/more_page.dart';
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
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 30, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: kprimaryTextColor,
                        borderRadius: BorderRadius.circular(7)),
                    height: 47,
                    width: 47,
                  ),
                  Row(
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
                  const Icon(
                    Icons.notifications_outlined,
                    color: Colors.black,
                    size: 35,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 30, top: 10, bottom: 10),
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
            Text(
              'Category',
              style: kMainCategory,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CategoryTile(
                  image: 'assets/category_icons/criminal.png',
                  name: 'Criminal',
                ),
                const CategoryTile(
                  image: 'assets/category_icons/family and adoption.png',
                  name: 'Family and Adoption',
                  isTransparentBackground: false,
                ),
                const CategoryTile(
                  image: 'assets/category_icons/cybercrime.png',
                  name: 'Cybercrime',
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return MorePage();
                    }));
                  },
                  child: const CategoryTile(
                    image: 'assets/category_icons/more.png',
                    name: 'More',
                  ),
                )
              ],
            ),
            Stack(alignment: Alignment.center, children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/home_rect.png',
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 70,
                child: Image.asset('assets/images/advocate.png'),
              ),
              const Positioned(
                top: 130,
                child: HorizontalTiles(
                  title: 'Lawyers Near Me',
                ),
              ),
              Positioned(
                  top: 290,
                  right: 10,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return ViewAllPage();
                        }));
                      },
                      child: Text(
                        'View All',
                        style: kViewAll,
                      ))),
              const Positioned(
                top: 350,
                child: HorizontalTiles(
                  title: 'Popular Lawyers',
                ),
              ),
              Positioned(
                  top: 510,
                  right: 10,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return ViewAllPage();
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
    ));
  }
}
