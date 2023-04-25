import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/floatcases5.dart';
import 'package:jusitfi_admin/presentation/widgets/application_details.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class FloatCases4 extends StatelessWidget {
  final List<Map<String, dynamic>> _sampleData = [
    {
      'Case Title': 'Case Title',
      'Date': 'Date',
      'Case Category': 'Case Category',
      'Location': 'Location',
      'status': 'Pending',
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
      'Case Category': 'Case Category',
      'Location': 'Location',
      'status': 'Pending',
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
      'Case Category': 'Case Category',
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
      'Case Category': 'Case Category',
      'Location': 'Location',
      'status': 'Cancelled',
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
      'Case Category': 'Case Category',
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  )),
              Container(
                color: Colors.black,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Applications',
                        style: kTitle,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      DataTable(
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
                              'Case Details',
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
                                  DataCell(Row(
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
                                          Text(
                                            data['Case Title'],
                                            style: kApplicationDetails,
                                          ),
                                          Text(data['Date'],
                                              style: kApplicationDetails),
                                          Text(data['Case Category'],
                                              style: kApplicationDetails),
                                          Text(data['Location'],
                                              style: kApplicationDetails),
                                        ],
                                      )
                                    ],
                                  )),
                                  DataCell(Center(
                                    child: ApplicantsDetails(
                                      applications: 10,
                                      images: data['images'],
                                      status: data['status'],
                                    ),
                                  )),
                                ]))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => FloatCases5()));
                  },
                  child: Text('Next'))
            ],
          ),
        ),
      ),
    );
  }
}
