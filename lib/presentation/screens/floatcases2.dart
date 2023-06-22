import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/finished_page.dart';
import 'package:jusitfi_admin/presentation/screens/float_cases4.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class FloatCases2 extends StatefulWidget {
  const FloatCases2({super.key});

  @override
  State<FloatCases2> createState() => _FloatCases2State();
}

class _FloatCases2State extends State<FloatCases2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Stack(children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(150),
                              bottomRight: Radius.circular(150))),
                      width: double.infinity,
                    ),
                    Positioned(
                      top: 0,
                      left: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.pin_drop,
                            color: Colors.white,
                          ),
                          Text(
                            'Mumbai',
                            style: kHomePageTitle,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 30,
                      right: 0,
                      child: Row(
                        children: [
                          Text(
                            'Post',
                            style: kHomePageTitle,
                          ),
                          Image.asset(
                            'assets/images/float_icon.png',
                            width: 50,
                            height: 50,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: MediaQuery.of(context).size.width / 5,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Case Title',
                                    style: kpageTitle,
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Center(
                                    child: TextField(
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Case Category',
                                    style: kpageTitle,
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    items: const [
                                      DropdownMenuItem<String>(
                                        value: 'Option 1',
                                        child: Text('Option 1'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Option 2',
                                        child: Text('Option 2'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Option 3',
                                        child: Text('Option 3'),
                                      ),
                                    ],
                                    onChanged: (value) {},
                                    hint: const Text(
                                        '                                         '),
                                    dropdownColor: Colors.grey[200],
                                    iconEnabledColor: Colors.grey[600],
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Case Sub-Category',
                                    style: kpageTitle,
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    items: const [
                                      DropdownMenuItem<String>(
                                        value: 'Option 1',
                                        child: Text('Option 1'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Option 2',
                                        child: Text('Option 2'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Option 3',
                                        child: Text('Option 3'),
                                      ),
                                    ],
                                    onChanged: (value) {},
                                    hint: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(''),
                                    ),
                                    dropdownColor: Colors.grey[200],
                                    iconEnabledColor: Colors.grey[600],
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Case Description',
                                    style: kpageTitle,
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Center(
                                    child: TextField(
                                      maxLines: 10,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                            child: SizedBox(
                                width: 250,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: Text(
                                              'Court Type',
                                              style: kpageTitle,
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: DropdownButton<String>(
                                              isExpanded: true,
                                              underline: const SizedBox(),
                                              items: const [
                                                DropdownMenuItem<String>(
                                                  value: 'Option 1',
                                                  child: Text('Option 1'),
                                                ),
                                                DropdownMenuItem<String>(
                                                  value: 'Option 2',
                                                  child: Text('Option 2'),
                                                ),
                                                DropdownMenuItem<String>(
                                                  value: 'Option 3',
                                                  child: Text('Option 3'),
                                                ),
                                              ],
                                              onChanged: (value) {},
                                              hint: const Text('          '),
                                              dropdownColor: Colors.grey[200],
                                              iconEnabledColor:
                                                  Colors.grey[600],
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: Text(
                                              'Fees Type',
                                              style: kpageTitle,
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: DropdownButton<String>(
                                              isExpanded: true,
                                              underline: const SizedBox(),
                                              items: const [
                                                DropdownMenuItem<String>(
                                                  value: 'Option 1',
                                                  child: Text('Option 1'),
                                                ),
                                                DropdownMenuItem<String>(
                                                  value: 'Option 2',
                                                  child: Text('Option 2'),
                                                ),
                                                DropdownMenuItem<String>(
                                                  value: 'Option 3',
                                                  child: Text('Option 3'),
                                                ),
                                              ],
                                              onChanged: (value) {},
                                              hint: const Text('      '),
                                              dropdownColor: Colors.grey[200],
                                              iconEnabledColor:
                                                  Colors.grey[600],
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Upload Document',
                                    style: kpageTitle,
                                  ),
                                ),
                                Container(
                                    width: 250,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.upload),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Name of Document',
                                          style: kCallQn,
                                          overflow: TextOverflow.fade,
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.info_outline,
                                  color: Colors.red,
                                  size: 15,
                                ),
                                Text(
                                  'Do not add confidential papers',
                                  style: kSmallHint,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FinishedPage(
                                text: 'Your application has been submitted',
                                nextPage: FloatCases4(),
                                nextPageName: 'View Status'),
                          ));
                    },
                    child: Container(
                      width: 160,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(18)),
                      child: Center(
                          child: Text(
                        'Launch',
                        style: kpageTitle,
                      )),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.black),
                    child: Center(
                        child: Text(
                      'View Application',
                      style: kpageTitle,
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
