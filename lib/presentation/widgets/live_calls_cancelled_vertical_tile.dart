import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/live_calls_cancelled_previous_vertical_tile.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';
import 'live_calls_cancelled_today.dart';

class LiveCallsCancelledVerticleTile extends StatefulWidget {
  const LiveCallsCancelledVerticleTile({Key? key}) : super(key: key);

  @override
  State<LiveCallsCancelledVerticleTile> createState() =>
      _LiveCallsCancelledVerticleTile();
}

class _LiveCallsCancelledVerticleTile
    extends State<LiveCallsCancelledVerticleTile> {
  int _selectedIndex = 0;
  final List<Widget> _verticalTiles = <Widget>[
    const LiveCallsCancelledTodayVerticalTile(),
    const LiveCallsCancelledPreviousVerticalTile()
  ];

  void _onDayTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _onDayTapped(0);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(15),
                                color: _selectedIndex == 0
                                    ? const Color.fromRGBO(0, 0, 0, 1)
                                    : Colors.white,
                              ),
                              height: 30,
                              width: 130,
                              child: Center(
                                  child: Text(
                                "Today",
                                style: _selectedIndex == 0
                                    ? todayTextStyle
                                    : todayTextStyleBlack,
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(15),
                                color: _selectedIndex == 1
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              height: 30,
                              width: 130,
                              child: Center(
                                  child: Text(
                                "Previous",
                                style: _selectedIndex == 1
                                    ? todayTextStyle
                                    : todayTextStyleBlack,
                              ))),
                        ],
                      ),
                    ),
                  ],
                ),
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
    );
  }
}
