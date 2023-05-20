import 'package:flutter/material.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class ViewDescriptionDialogBox extends StatefulWidget {
  const ViewDescriptionDialogBox({
    Key? key,
  }) : super(key: key);
  //final BuildContext context;

  @override
  State<ViewDescriptionDialogBox> createState() => _ViewDescriptionDialogBox();
}

class _ViewDescriptionDialogBox extends State<ViewDescriptionDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0), color: Colors.white),
              padding: EdgeInsets.all(30),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 18,
                          width: 18,
                          child: Image.asset(
                            "assets/icons/cancel_icon.png",
                          ),
                        ),
                        Stack(
                          children: [
                            Center(
                              child: Container(
                                height: 18,
                                width: 18,
                                child: Image.asset(
                                  "assets/icons/circular_ring.png",
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 18,
                                width: 18,
                                child: Image.asset(
                                  "assets/icons/slant_line.png",
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 18,
                                width: 18,
                                child: Image.asset(
                                  "assets/icons/download.png",
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Text(
                      "Description",
                      style: poppinsW400S12Black,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Criminal Law",
                      style: poppinsW400S18Black,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text(
                        "Name : Criminal activities",
                        style: poppinsW400S9Black,
                      )
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text(
                        "Name : Criminal activities",
                        style: poppinsW400S9Black,
                      )
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text(
                        "Agreement",
                        style: poppinsW700S9Black,
                      )
                    ]),
                    Container(
                        height: 60,
                        width: 266,
                        child: SingleChildScrollView(
                          child: Text(
                            "g industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived",
                            style: poppinsW400S9Black,
                          ),
                        )),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text(
                        "Legal Actions",
                        style: poppinsW700S9Black,
                      )
                    ]),
                    Container(
                        height: 60,
                        width: 266,
                        child: SingleChildScrollView(
                          child: Text(
                            "g industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived",
                            style: poppinsW400S9Black,
                          ),
                        )),
                    Container(
                        height: 60,
                        width: 266,
                        child: SingleChildScrollView(
                          child: Text(
                            "g industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived",
                            style: poppinsW400S9Black,
                          ),
                        )),
                    Container(
                        height: 60,
                        width: 266,
                        child: SingleChildScrollView(
                          child: Text(
                            "g industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived",
                            style: poppinsW400S9Black,
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text(
                        "Case Details",
                        style: poppinsW700S9Black,
                      )
                    ]),
                    Container(
                        height: 60,
                        width: 266,
                        child: SingleChildScrollView(
                          child: Text(
                            "g industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived",
                            style: poppinsW400S9Black,
                          ),
                        )),
                  ]),
            )));
  }
}
