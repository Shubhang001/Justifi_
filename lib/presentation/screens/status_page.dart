import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/pending_approval_vertical_tile.dart';
import 'package:jusitfi_admin/presentation/widgets/statusPage_textBox.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import 'package:jusitfi_admin/utils/constants/status_page_constants.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

import '../widgets/filter_sort.dart';
import '../widgets/searchbar.dart';
import '../widgets/statusPageFilterSort.dart';
import '../widgets/statusPageSearchBar.dart';

class StatusPage extends StatefulWidget {
  StatusPage({Key? key}) : super(key: key);

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
      PendingApprovalVerticalTile(),
      Text("Scheduled"),
      Text("Cancelled"),
      Text("Completed"),
      Text("Refund")
    ],
    [
      Text("Pending Apply"),
      Text("Pending Hire"),
      Text("Hired"),
      Text("Cancelled")
    ],
    [
      Text("Completed"),
      Text("Cancelled"),
      Text("Not Picked"),
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
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Welcome to Justify',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            ListTile(
              title: Text("Item1"),
              leading: Icon(Icons.mail),
            ),
            Divider(
              height: 0.2,
            ),
            ListTile(
              title: Text("Item1"),
              leading: Icon(Icons.mail),
            ),
            Divider(
              height: 0.2,
            ),
            ListTile(
              title: Text("Item1"),
              leading: Icon(Icons.mail),
            ),
            Divider(
              height: 0.2,
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 40,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: statusPageCategories.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  _onCategoryTapped(index);
                                },
                                child: TextBox(
                                    text:
                                        statusPageCategories[index].toString(),
                                    isSelected: false,
                                    textSize: 16));
                          })),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 35,
                      child: ListView.builder(
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
                                child: TextBox(
                                    text:
                                        _subcategoryList[_selectedCategoryIndex]
                                                [index]
                                            .toString(),
                                    isSelected: false,
                                    textSize: 14));
                          })),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        StatusPageSearchBar(),
                        const SizedBox(
                          width: 10,
                        ),
                        StatusPageFilterSort()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Divider(
                    color: kprimaryTextColor,
                    thickness: 1,
                  ),
                  SizedBox(
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
