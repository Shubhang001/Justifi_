import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/floatcases5.dart';
import 'package:jusitfi_admin/presentation/screens/notification_page.dart';
import 'package:jusitfi_admin/presentation/screens/profile_page.dart';
import 'package:jusitfi_admin/presentation/widgets/application_details.dart';
import 'package:jusitfi_admin/presentation/widgets/locked_application_dialog_box.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

import '../../utils/constants/colors.dart';

class FloatCases4 extends StatelessWidget {
  final List<Map<String, dynamic>> _sampleData = [
    {
      'Case Title': 'Case Title',
      'isLocked': true,
      'Date': '12/05/2023',
      'Case Category': 'Cyber Crime',
      'Location': 'Location',
      'status': 'Pending',
      'images': [
        "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80",
        "https://images.unsplash.com/photo-1458071103673-6a6e4c4a3413?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
        "https://images.unsplash.com/photo-1470406852800-b97e5d92e2aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
        "https://images.unsplash.com/photo-1473700216830-7e08d47f858e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"
      ]
    },
    {
      'Case Title': 'Case Title',
      'isLocked': true,
      'Date': 'Date',
      'Case Category': 'Cyber Crime of Fake Document',
      'Location': 'Location',
      'status': 'Pending',
      'images': [
        "https://images.unsplash.com/photo-1470406852800-b97e5d92e2aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
        "https://images.unsplash.com/photo-1458071103673-6a6e4c4a3413?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
        "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80",
        "https://images.unsplash.com/photo-1473700216830-7e08d47f858e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"
      ]
    },
    {
      'Case Title': 'Case Title',
      'isLocked': false,
      'Date': 'Date',
      'Case Category': '',
      'Location': 'Location',
      'status': 'Hired',
      'images': [
        "https://images.unsplash.com/photo-1458071103673-6a6e4c4a3413?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
        "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80",
        "https://images.unsplash.com/photo-1470406852800-b97e5d92e2aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
        "https://images.unsplash.com/photo-1473700216830-7e08d47f858e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"
      ]
    },
    {
      'Case Title': 'Case Title',
      'Date': 'Date',
      'isLocked': true,
      'Case Category': '',
      'Location': 'Location',
      'status': 'Cancelled',
      'images': [
        "https://images.unsplash.com/photo-1473700216830-7e08d47f858e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"
            "https://images.unsplash.com/photo-1458071103673-6a6e4c4a3413?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
        "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80",
        "https://images.unsplash.com/photo-1470406852800-b97e5d92e2aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
      ]
    },
    {
      'Case Title': 'Case Title',
      'Date': 'Date',
      'isLocked': false,
      'Case Category': '',
      'Location': 'Location',
      'status': 'Pending',
      'images': [
        "https://images.unsplash.com/photo-1458071103673-6a6e4c4a3413?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
        "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80",
        "https://images.unsplash.com/photo-1470406852800-b97e5d92e2aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
        "https://images.unsplash.com/photo-1473700216830-7e08d47f858e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                      color: Colors.white,
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
                color: Colors.white,
              ),
            ),
          ),
          title: Center(
            child: Text(
              "Applications",
              style: kTitle,
            ),
          ),
          backgroundColor: kPrimaryBlackColor,
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.black,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      DataTable(
                        horizontalMargin: 0,
                        dataRowHeight: 150,
                        columnSpacing: 30,
                        border: TableBorder.all(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                        columns: [
                          DataColumn(
                              label: Center(
                            child: Text(
                              ' Case Details',
                              style: kNavLabel,
                            ),
                          )),
                          DataColumn(
                              label: Center(
                            child: Text(
                              'No.Of Applications',
                              style: kNavLabel,
                            ),
                          )),
                        ],
                        rows: _sampleData
                            .map((data) => DataRow(cells: [
                                  DataCell(InkWell(
                                    onTap: data['isLocked']
                                        ? () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return const LockedApplicationDialogBox();
                                                });
                                          }
                                        : () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const FloatCases5()));
                                          },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 8.0),
                                          child: Text(
                                            data['Case Title'],
                                            style: kApplicationDetails,
                                          ),
                                        ),
                                        const Divider(
                                          height: 1,
                                          color: Colors.white,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Text(data['Date'],
                                                style: kApplicationDetails),
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/document.png',
                                              width: 55,
                                              height: 55,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 150,
                                                  child: Text(
                                                      '  Case Category : ${data['Case Category']}',
                                                      style:
                                                          kApplicationDetails),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(data['Location'],
                                              style: kApplicationDetails),
                                        ),
                                      ],
                                    ),
                                  )),
                                  DataCell(InkWell(
                                    onTap: data['isLocked']
                                        ? () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return const LockedApplicationDialogBox();
                                                });
                                          }
                                        : () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const FloatCases5()));
                                          },
                                    child: Center(
                                      child: ApplicantsDetails(
                                        applications: 10,
                                        images: data['images'],
                                        status: data['status'],
                                        isLocked: data['isLocked'],
                                      ),
                                    ),
                                  )),
                                ]))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
