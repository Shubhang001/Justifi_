import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';
import '../widgets/hiring_package_active_vertical_tile.dart';
import '../widgets/hiring_package_expired_vertical_tile.dart';

class HiringPackagePage extends StatefulWidget {
  const HiringPackagePage({Key? key}) : super(key: key);

  @override
  State<HiringPackagePage> createState() => _HiringPackagePage();
}

class _HiringPackagePage extends State<HiringPackagePage> {
  int _selectedIndex = 0;
  final List<Widget> _verticalTiles = <Widget>[
    const HiringPackageActiveVerticalTile(),
    const HiringPackageExpiredVerticalTile(),
  ];

  void _onDayTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Hiring Package",
              style: alegreyaW700S24White,
            ),
          ),
          backgroundColor: kPrimaryBlackColor,
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _onDayTapped(0);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: _selectedIndex == 0
                                                ? const Color.fromRGBO(
                                                    0, 0, 0, 1)
                                                : Colors.white,
                                          ),
                                          height: 30,
                                          width: 84,
                                          child: Center(
                                              child: Text(
                                            "Active",
                                            style: _selectedIndex == 0
                                                ? alegreyaW700S18White
                                                : alegreyaW700S18Black,
                                          ))),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    _onDayTapped(1);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: _selectedIndex == 1
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                          height: 30,
                                          width: 84,
                                          child: Center(
                                              child: Text(
                                            "Expired",
                                            style: _selectedIndex == 1
                                                ? alegreyaW700S18White
                                                : alegreyaW700S18Black,
                                          ))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Divider(
                              color: kprimaryTextColor,
                              thickness: 1,
                            ),
                            Container(
                              child: _verticalTiles[_selectedIndex],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
