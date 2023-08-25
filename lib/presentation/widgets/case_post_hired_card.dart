import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/drop_down_button.dart';
import 'package:jusitfi_admin/presentation/widgets/notes.dart';
import 'package:jusitfi_admin/presentation/widgets/view_description_dialog_box.dart';
import 'package:jusitfi_admin/presentation/widgets/view_document_dialog_box.dart';
import '../../utils/constants/textstyles.dart';
import '../screens/chat_page.dart';

class CasePostHiredCard extends StatefulWidget {
  const CasePostHiredCard(
      {super.key,
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
      required this.fees});

  final String image;
  final String fees;
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
  State<CasePostHiredCard> createState() => _CasePostHiredCardState();
}

class _CasePostHiredCardState extends State<CasePostHiredCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(15)),
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
                                      "assets/icons/court_icon.png",
                                      fit: BoxFit.cover,
                                    )),
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
                        width: 12,
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
                          const SizedBox(
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
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  widget.viewApplication
                      ? const SizedBox()
                      : SizedBox(
                          height: 28,
                          width: 28,
                          child: Image.asset(
                            "assets/icons/court_icon.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                  widget.viewApplication
                      ? const SizedBox()
                      : const VerticalDivider(
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
                  Flexible(
                    child: Container(
                      child: Text(
                        widget.courtName.toString(),
                        style: poppinsW500S10White,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
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
                        : Column(
                            children: [
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
                              Text(
                                '4',
                                style: poppinsW500S12White,
                              ),
                              Text(
                                "Weeks",
                                style: poppinsW400S9White,
                              )
                            ],
                          ),
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
                        ),
                        widget.viewApplication
                            ? const SizedBox()
                            : Text(
                                '₹ ${widget.fees}',
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
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                              left: 8, right: 8),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            " Document",
                                            style: poppinsW400S9Black,
                                          )))),
                              const SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    //show alert dialo

                                    showNotes(context);
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
                                            " Notes",
                                            style: poppinsW400S9Black,
                                          )))),
                            ],
                          ),
                    const VerticalDivider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    Column(
                      children: [
                        Text(
                          " Hired ",
                          style: tableTextNormal,
                        ),
                        const Icon(
                          Icons.pending,
                          size: 20,
                          color: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ChatPage()));
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Container(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 6, bottom: 6),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                children: [
                                  Text(" Message Advocate ",
                                      style: poppinsW400S9Black),
                                  // Icon(
                                  //   Icons.lock,
                                  //   color: Colors.black,
                                  //   size: 10,
                                  // )
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
