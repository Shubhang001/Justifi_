import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/scheduled_complete_previous_vertical_tile.dart';
import 'package:jusitfi_admin/presentation/widgets/scheduled_completed_previous_vertical_tile.dart';

import '../../utils/constants/textstyles.dart';

class ScheduledMeetCompletedVerticleTile extends StatefulWidget {
  const ScheduledMeetCompletedVerticleTile({Key? key}) : super(key: key);

  @override
  State<ScheduledMeetCompletedVerticleTile> createState() =>
      _ScheduledMeetCompletedVerticleTileState();
}

class _ScheduledMeetCompletedVerticleTileState
    extends State<ScheduledMeetCompletedVerticleTile> {
  int _selectedIndex = 0;
  final List<Widget> _verticalTiles = <Widget>[
    const ScheduleCompletedTodayVerticalTile(),
    const ScheduleCompletedPreviousVerticalTile()
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
                              height: 40,
                              width: 170,
                              color: _selectedIndex == 0
                                  ? Colors.yellowAccent
                                  : Colors.white,
                              child: Row(children: [
                                Image.asset("assets/images/todayCircle.png"),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/todayArrow.png",
                                      fit: BoxFit.contain,
                                    ),
                                    Text(
                                      "Today",
                                      style: todayTextStyle,
                                    )
                                  ],
                                )
                              ])),
                        ],
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        _onDayTapped(1);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              height: 40,
                              width: 170,
                              color: _selectedIndex == 1
                                  ? Colors.yellowAccent
                                  : Colors.white,
                              child: Row(
                                  // children: [Text("upcoming")],
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(
                                            "assets/images/upcomingArrow.png"),
                                        Text(
                                          "Previous",
                                          style: todayTextStyle,
                                        )
                                      ],
                                    ),
                                    Image.asset(
                                        "assets/images/todayCircle.png"),
                                  ])),
                        ],
                      ),
                    ),
                  ],
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
    ;
  }
}
