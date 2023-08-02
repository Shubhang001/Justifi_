import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/drop_down_button.dart';
import 'package:jusitfi_admin/presentation/widgets/locked_application_dialog_box.dart';
import 'package:jusitfi_admin/presentation/widgets/view_cancel_reason_dialog.dart';
import 'package:jusitfi_admin/presentation/widgets/view_document_dialog_box.dart';
import 'package:jusitfi_admin/presentation/widgets/view_description_dialog_box.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';

class CasePostPendingApplyCard extends StatefulWidget {
  const CasePostPendingApplyCard({
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
    required this.courtName,
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
  final String courtName;

  @override
  State<CasePostPendingApplyCard> createState() =>
      _CasePostPendingApplyCardState();
}

class _CasePostPendingApplyCardState extends State<CasePostPendingApplyCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white, width: 2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                      height: 16,
                      width: 16,
                      child: Image.asset(
                        "assets/icons/document_icon.png",
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.caseTitle.toString(),
                    style: poppinsW500S12White,
                  ),
                ],
              ),
              const Divider(
                color: Colors.white,
                thickness: 1,
              ),

              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      widget.viewApplication
                          ? Row(
                              children: [
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset(
                                    "assets/icons/document_icon.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset(widget.image),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  widget.name,
                                  style: poppinsW600S7White,
                                )
                              ],
                            ),
                      const SizedBox(
                        width: 4,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Case Category : ",
                                style: poppinsW500S10Grey,
                              ),
                              Text(
                                widget.caseCategory,
                                style: poppinsW500S10White,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Case Subcategory : ",
                                style: poppinsW500S10Grey,
                              ),
                              const DropDownMenuButton(),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  //const Spacer(),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 28,
                    width: 28,
                    child: Image.asset(
                      "assets/icons/court_icon.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  Text(
                    widget.courtType,
                    style: poppinsW500S10White,
                  ),
                  Text(
                    " : ",
                    style: poppinsW500S10White,
                  ),
                  Text(
                    widget.courtName.toString(),
                    style: poppinsW500S10White,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),

              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    widget.viewApplication
                        ? Column(
                            children: [
                              Text(
                                widget.noOfApplication.toString(),
                                style: poppinsW500S12White,
                              ),
                              Text(
                                "Applications",
                                style: poppinsW400S9White,
                              )
                            ],
                          )
                        : GestureDetector(
                            onTap: () {
                              //show alert dialo
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const ViewDescriptionDialogBox();
                                  });
                            },
                            child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      " Description",
                                      style: poppinsW400S9Black,
                                    )))),
                    const VerticalDivider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              " Fee Type ",
                              style: poppinsW400S9White,
                            )
                          ],
                        ),
                        Text(
                          widget.feeType,
                          style: poppinsW400S9White,
                        )
                      ],
                    ),
                    const VerticalDivider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    widget.viewApplication
                        ? Column(
                            children: [
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
                                      padding: const EdgeInsets.all(2),
                                      child: Container(
                                          padding: const EdgeInsets.only(
                                              right: 8, left: 8),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            " Document",
                                            style: poppinsW400S9Black,
                                          )))),
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
                                      padding: const EdgeInsets.all(2),
                                      child: Container(
                                          padding: const EdgeInsets.only(
                                              right: 8, left: 8),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            " Description",
                                            style: poppinsW400S9Black,
                                          )))),
                            ],
                          )
                        : GestureDetector(
                            onTap: () {
                              //show alert dialo
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const ViewDocumentDialogBox();
                                  });
                            },
                            child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      " Document",
                                      style: poppinsW400S9Black,
                                    )))),
                    const VerticalDivider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    Container(
                        child: Column(
                      children: [
                        Text(
                          " Pending ",
                          style: tableTextNormal,
                        ),
                        const Icon(
                          Icons.pending,
                          size: 20,
                          color: Colors.white,
                        ),
                        Text(
                          " Apply",
                          style: tableTextNormal,
                        )
                      ],
                    )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              widget.viewApplication
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              //show  dialog
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const LockedApplicationDialogBox();
                                  });
                            },
                            child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16, top: 6, bottom: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      children: [
                                        Text("View Application",
                                            style: poppinsW400S9Black),
                                        const Icon(
                                          Icons.lock,
                                          color: Colors.black,
                                          size: 10,
                                        )
                                      ],
                                    )))),
                        GestureDetector(
                            onTap: () {
                              //show alert dialo
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const ViewCancelReasonDialog(
                                      message:
                                          "Your Post hiring has been cancelled Successfully.",
                                    );
                                  });
                            },
                            child: Padding(
                                padding: const EdgeInsets.all(2),
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
                                    )))),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {
                              //show alert dialo
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const ViewCancelReasonDialog(
                                      message:
                                          "Your Post hiring has been cancelled Successfully.",
                                    );
                                  });
                            },
                            child: Padding(
                                padding: const EdgeInsets.all(2),
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
                                    )))),
                      ],
                    )

              ///
            ],
          ),
        ));
  }
}
