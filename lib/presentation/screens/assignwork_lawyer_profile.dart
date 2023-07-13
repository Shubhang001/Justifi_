import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:jusitfi_admin/presentation/screens/assign_work_completed.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class AssignWorkLawyerProfile extends StatefulWidget {
  AssignWorkLawyerProfile({super.key});
  String _filePath = '';

  @override
  State<AssignWorkLawyerProfile> createState() =>
      _AssignWorkLawyerProfileState();
}

class _AssignWorkLawyerProfileState extends State<AssignWorkLawyerProfile> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Lawyer Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(150),
                        bottomRight: Radius.circular(150),
                      )),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3,
                ),
                Positioned(
                  left: 20,
                  top: 30,
                  child: Row(
                    children: [
                      const _ImageContainer(110, 110),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: Text(
                              "Priya sharma",
                              style: lawyerNameWhite,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 100),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                ),
                                Text(
                                  "Mumbai",
                                  style: locationNameWhite,
                                ),
                              ],
                            ),
                          ),
                          const LawyerInfo(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
                height: 700,
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  SizedBox(
                    height: 700,
                    child: Stack(children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(150),
                                topRight: Radius.circular(150))),
                        width: double.infinity,
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
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8),
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
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return AssignWorkCompleted();
                                }));
                              },
                              child: Container(
                                width: 250,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    'Submit',
                                    style: kobButton,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
                  )
                ]))

            /////////////////////////////////
          ],
        ),
      ),
    );
  }
}

class _ImageContainer extends StatelessWidget {
  const _ImageContainer(this.height, this.width);
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            left: 10,
          ),
          height: height,
          width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/advocate_img.png",
              ),
            ),
            color: Colors.black,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        Positioned(
          top: 15,
          right: 10,
          child: Container(
            height: 15,
            width: 15,
            decoration: const BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class LawyerInfo extends StatelessWidget {
  const LawyerInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15, left: 10),
            child: Column(
              children: [
                Text(
                  "80",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "clients",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: 2,
            color: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.only(left: 8, right: 10),
            child: Column(
              children: [
                Text(
                  "100",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Cases",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: 2,
            color: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.only(left: 8),
            child: Column(
              children: [
                Text(
                  "8 yrs",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Expeirence",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
