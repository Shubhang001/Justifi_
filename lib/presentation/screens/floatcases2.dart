import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/finished_page.dart';
import 'package:jusitfi_admin/presentation/screens/float_cases4.dart';
import 'package:jusitfi_admin/presentation/screens/notification_page.dart';
import 'package:jusitfi_admin/presentation/screens/profile_page.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

// ignore: must_be_immutable
class FloatCases2 extends StatefulWidget {
  FloatCases2({super.key});
  String _filePath = '';

  @override
  State<FloatCases2> createState() => _FloatCases2State();
}

class _FloatCases2State extends State<FloatCases2> {
  Future<void> _pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        widget._filePath = file.path;
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black,
          actions: [
            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 30, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationsPage(),
                        ),
                      );
                    },
                    child: Icon(
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.pin_drop_rounded,
                size: 35,
                color: Colors.white,
              ),
              Text(
                "Mumbai",
                style: klocationLight,
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: 800,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 650,
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
                      top: 60,
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
                                InkWell(
                                  onTap: () {
                                    _pickDocument();
                                  },
                                  child: Container(
                                      width: 250,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.upload),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            widget._filePath == ''
                                                ? 'Name of the document uploaded'
                                                : widget._filePath
                                                    .split('/')
                                                    .last,
                                            style: kCallQn,
                                            overflow: TextOverflow.fade,
                                          )
                                        ],
                                      )),
                                ),
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
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => FloatCases4()));
                    },
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
