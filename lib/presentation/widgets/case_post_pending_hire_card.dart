import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/locked_application_dialog_box.dart';
import 'package:jusitfi_admin/presentation/widgets/locked_hire_advocate.dart';
import 'package:jusitfi_admin/presentation/widgets/view_description_dialog_box.dart';
import 'package:jusitfi_admin/presentation/widgets/view_document_dialog_box.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';

class CasePostPendingHireCard extends StatelessWidget {
  const CasePostPendingHireCard({
    super.key,
    required this.name,
    required this.image,
    required this.caseTitle,
    required this.courtType,
    required this.caseCategory,
    required this.caseSubCategory,
    required this.postingDate,
    required this.noOfApplication,
    required this.feeType,
    required this.viewApplication,
  });

  final String image;
  final String name;
  final String caseTitle;
  final String courtType;
  final String caseCategory;
  final String caseSubCategory;
  final String postingDate;
  final int noOfApplication;
  final String feeType;
  final bool viewApplication;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Post Date : $postingDate",
                    style: poppinsW400S9White,
                  )
                ],
              ),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      viewApplication
                          ? Row(
                              children: [
                                Container(
                                    height: 48,
                                    width: 48,
                                    child: Image.asset(
                                      "assets/icons/document_icon.png",
                                      fit: BoxFit.cover,
                                    )),
                              ],
                            )
                          : Column(
                              children: [
                                Image.asset(image),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  name,
                                  style: poppinsW600S7White,
                                )
                              ],
                            ),
                      SizedBox(
                        width: 4,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Case Title : ",
                                style: poppinsW500S12Grey,
                              ),
                              Text(
                                caseTitle,
                                style: poppinsW500S12White,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Case Category : ",
                                style: poppinsW500S10Grey,
                              ),
                              Text(
                                caseCategory,
                                style: poppinsW500S10White,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Case Subcategory : ",
                                style: poppinsW500S10Grey,
                              ),
                              Text(
                                caseSubCategory,
                                style: poppinsW500S10White,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                              height: 28,
                              width: 28,
                              child: Image.asset(
                                "assets/icons/court_icon.png",
                                fit: BoxFit.contain,
                              )),
                          Text(
                            courtType,
                            style: poppinsW500S10White,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    viewApplication
                        ? Column(
                            children: [
                              Text(
                                noOfApplication.toString(),
                                style: poppinsW500S12White,
                              ),
                              Text(
                                "Applications",
                                style: poppinsW400S9White,
                              )
                            ],
                          )
                        : Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Description",
                                    style: poppinsW400S9White,
                                  )
                                ],
                              ),
                              GestureDetector(
                                  onTap: () {
                                    //show alert dialo
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const ViewDescriptionDialogBox();
                                        });
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.all(2),
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              left: 8, right: 8),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            " View",
                                            style: poppinsW400S9Black,
                                          )))),
                            ],
                          ),
                    VerticalDivider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.currency_rupee,
                              color: Colors.white,
                            ),
                            Text(
                              " Fee Type ",
                              style: poppinsW400S9White,
                            )
                          ],
                        ),
                        Text(
                          feeType,
                          style: poppinsW400S9White,
                        )
                      ],
                    ),
                    VerticalDivider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    viewApplication
                        ? Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Container(
                                      padding:
                                          EdgeInsets.only(right: 8, left: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        " Document",
                                        style: poppinsW400S9Black,
                                      ))),
                              Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Container(
                                      padding:
                                          EdgeInsets.only(right: 8, left: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        " Description",
                                        style: poppinsW400S9Black,
                                      ))),
                            ],
                          )
                        : Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: 8,
                                      width: 8,
                                      child: Image.asset(
                                          "assets/icons/document_icon.png")),
                                  Text(
                                    "Document",
                                    style: poppinsW400S9White,
                                  )
                                ],
                              ),
                              GestureDetector(
                                  onTap: () {
                                    //show alert dialo
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const ViewDocumentDialogBox();
                                        });
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.all(2),
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              left: 8, right: 8),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            " View",
                                            style: poppinsW400S9Black,
                                          )))),
                            ],
                          ),
                    VerticalDivider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.pending,
                          size: 20,
                          color: Colors.white,
                        ),
                        viewApplication
                            ? Column(
                                children: [
                                  Text(
                                    " Pending ",
                                    style: tableTextNormal,
                                  ),
                                  Text(
                                    " Hire",
                                    style: tableTextNormal,
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Text(
                                    " Advocate ",
                                    style: tableTextNormal,
                                  ),
                                  Text(
                                    " Applied ",
                                    style: tableTextNormal,
                                  )
                                ],
                              )
                      ],
                    )
                  ],
                ),
              ),
              viewApplication
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(16),
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: 16, right: 16, top: 6, bottom: 6),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  children: [
                                    Text("View Application",
                                        style: poppinsW400S9Black),
                                  ],
                                ))),
                        Padding(
                            padding: EdgeInsets.all(2),
                            child: Container(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 6, bottom: 6),
                                decoration: BoxDecoration(
                                  color: redButtonColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Cancel",
                                      style: poppinsW400S9White,
                                    ),
                                  ],
                                ))),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(16),
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: 16, right: 16, top: 6, bottom: 6),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  children: [
                                    Text("View Details",
                                        style: poppinsW400S9Black),
                                  ],
                                ))),
                        GestureDetector(
                            onTap: () {
                              //show  dialog
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const LockedHireAdvocateDialogBox();
                                  });
                            },
                            child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Container(
                                    padding: EdgeInsets.only(
                                        left: 16, right: 16, top: 6, bottom: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      children: [
                                        Text("Hire Advocate ",
                                            style: poppinsW400S9Black),
                                        Icon(
                                          Icons.lock,
                                          color: Colors.black,
                                          size: 10,
                                        )
                                      ],
                                    )))),
                        Padding(
                            padding: EdgeInsets.all(2),
                            child: Container(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 6, bottom: 6),
                                decoration: BoxDecoration(
                                  color: redButtonColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Cancel",
                                      style: poppinsW400S9White,
                                    ),
                                  ],
                                ))),
                      ],
                    )

              ///
            ],
          ),
        ));
  }
}
