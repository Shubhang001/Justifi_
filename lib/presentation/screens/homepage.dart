import 'package:flutter/material.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';
import '../widgets/category_tile.dart';
import '../widgets/horizontal_tile.dart';

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
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    width: MediaQuery.of(context).size.width / 1.6,
                    height: 50,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.search,
                          size: 30,
                          color: kmainButtonColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            style: kotp,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search....',
                              hintStyle: ksearch,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.arrow_upward_rounded,
                            color: kmainButtonColor,
                          ),
                          const VerticalDivider(
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.menu,
                            color: kmainButtonColor,
                          )
                        ],
                      ),
                    ),
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
              children: const [
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
                CategoryTile(
                  image: 'assets/category_icons/more.png',
                  name: 'More',
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
                      onPressed: () {},
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
                      onPressed: () {},
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
