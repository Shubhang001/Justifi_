import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/live_calls_completed_previous.dart';
import 'package:jusitfi_admin/presentation/widgets/live_calls_completed_today_verticle_tile.dart';
import 'package:jusitfi_admin/utils/constants/status_page_constants.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';
import 'package:jusitfi_admin/presentation/widgets/statusPage_textBox.dart';

class LiveCallsCompletedVerticleTile extends StatefulWidget {
  const LiveCallsCompletedVerticleTile({Key? key}) : super(key: key);

  @override
  State<LiveCallsCompletedVerticleTile> createState() =>
      _LiveCallsCompletedVerticleTile();
}

class _LiveCallsCompletedVerticleTile
    extends State<LiveCallsCompletedVerticleTile> {
  int _selectedIndex = 0;
  int livecallsIndex=0;

  final List<Widget> _verticalTiles = <Widget>[
    const LiveCallsCompletedTodayVerticalTile(),
    const LiveCallsCompletedPreviousVerticalTile()
  ];

  void _onDayTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onCategoryTapped(int index) {
    setState(() {
      livecallsIndex = index;

    });
  }

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.sizeOf(context).width;
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
                                    Border(bottom: BorderSide(color: _selectedIndex == 0 ? Colors.black : Colors.white, width:_selectedIndex == 0 ? 2 : 0)),

                                // color: _selectedIndex == 0
                                //     ? const Color.fromRGBO(0, 0, 0, 1)
                                //     : Colors.white,
                              ),
                              height: 30,
                              width: (w-40)/2,
                              child: Center(
                                  child: Text(
                                "Today",
                                style:
                                  todayTextStyleBlack,
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
                                Border(bottom: BorderSide(color: _selectedIndex == 1? Colors.black : Colors.white, width:_selectedIndex == 1 ? 2 : 0)),

                                // color: _selectedIndex == 0
                                //     ? const Color.fromRGBO(0, 0, 0, 1)
                                //     : Colors.white,
                              ),
                              height: 30,
                              width: (w-40)/2,
                              child: Center(
                                  child: Text(
                                "Previous",
                                style: todayTextStyleBlack,
                              ))),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 5,),
                Container(
                    height: 40,
                    margin: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 24),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: liveCallsSubcategories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                _onCategoryTapped(index);
                                // if(index==2){
                                //   showDialog<void>(
                                //     context: context,
                                //
                                //     // false = user must tap button, true = tap outside dialog
                                //     builder: (BuildContext dialogContext) {
                                //       return AlertDialog(
                                //         title: Text('Service Not Available'),
                                //         content: Text('Service Not Available yet'),
                                //         actions: <Widget>[
                                //           TextButton(
                                //             child: Text('Ok'),
                                //             onPressed: () {
                                //               Navigator.of(dialogContext)
                                //                   .pop(); // Dismiss alert dialog
                                //             },
                                //           ),
                                //         ],
                                //       );
                                //     },
                                //   );
                                //
                                //
                                //
                                // }
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: livecallsIndex == index
                                            ? Colors.black
                                            : Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(15),
                                    color: livecallsIndex == index
                                        ? kPrimaryBlackColor
                                        : Colors.white,
                                  ),
                                  child: TextBox(
                                      text: liveCallsSubcategories[index]
                                          .toString(),
                                      isSelected: false,
                                      textSize: 16)));
                        })),


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
