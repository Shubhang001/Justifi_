import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/case_post_hired.dart';
import 'package:jusitfi_admin/presentation/widgets/case_post_pending_apply.dart';
import 'package:jusitfi_admin/presentation/widgets/case_post_pending_hire.dart';
import 'package:jusitfi_admin/presentation/widgets/live_calls_completed_vertical_tile.dart';
import 'package:jusitfi_admin/presentation/widgets/pending_approval_vertical_tile.dart';
import 'package:jusitfi_admin/presentation/widgets/scheduled_vertical_tile.dart';
import 'package:jusitfi_admin/presentation/widgets/statusPage_textBox.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import 'package:jusitfi_admin/utils/constants/status_page_constants.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';
import '../widgets/case_post_cancelled.dart';
import '../widgets/live_calls_cancelled_vertical_tile.dart';
import '../widgets/refund_vertical_tile.dart';
import '../widgets/scheduled_meet_canceled_verticle_tile.dart';
import '../widgets/scheduled_meet_completed_vertical_tile.dart';
import '../widgets/statusPageFilterSort.dart';
import '../widgets/statusPageSearchBar.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  int _selectedCategoryIndex = 0;
  int _selectedSubCategoryIndex = 0;

  final List<List<String>> _subcategoryList = [
    scheduledMeetSubCategories,
    casePostSubCategories,
    liveCallsSubcategories
  ];
  final List<List<Widget>> _verticalTileWidgetList = [
    [
      const PendingApprovalVerticalTile(),
      const ScheduledVerticalTile(),
      ScheduledMeetCancelledVerticleTile(),
      const ScheduledMeetCompletedVerticleTile(),
      const RefundVerticalTile()
    ],
    [
      const CasePostPendingApplyVerticalTile(),
      const CasePostPendingHireVerticalTile(),
      const CasePostHiredVerticalTile(),
      const CasePostCancelledVerticalTile(),
    ],
    [
      const LiveCallsCompletedVerticleTile(),
      const LiveCallsCancelledVerticleTile(),
      const LiveCallsCancelledVerticleTile(),
    ]
  ];

  void _onCategoryTapped(int index) {
    setState(() {
      _selectedCategoryIndex = index;
      _selectedSubCategoryIndex = 0;
    });
  }

  void _onSubCategoryTapped(int index) {
    setState(() {
      _selectedSubCategoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Status",
            style: kHomePageTitle,
          ),
        ),
        backgroundColor: kPrimaryBlackColor,
      ),
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 40,
                      margin: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 24),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: statusPageCategories.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  _onCategoryTapped(index);
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: _selectedCategoryIndex == index
                                          ? kPrimaryBlackColor
                                          : Colors.white,
                                    ),
                                    child: TextBox(
                                        text: statusPageCategories[index]
                                            .toString(),
                                        isSelected: false,
                                        textSize: 16)));
                          })),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 35,
                      child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 30,
                              ),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: _subcategoryList[_selectedCategoryIndex]
                              .toList()
                              .length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  _onSubCategoryTapped(index);
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: _selectedSubCategoryIndex == index
                                          ? kPrimaryBlackColor
                                          : Colors.white,
                                    ),
                                    child: TextBox(
                                        text: _subcategoryList[
                                                _selectedCategoryIndex][index]
                                            .toString(),
                                        isSelected: false,
                                        textSize: 14)));
                          })),
                  const SizedBox(
                    height: 8,
                  ),
                  Divider(
                    color: kprimaryTextColor,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                      child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      _verticalTileWidgetList[_selectedCategoryIndex]
                          [_selectedSubCategoryIndex]
                    ],
                  ))
                ],
              ))),
    );
  }
}
