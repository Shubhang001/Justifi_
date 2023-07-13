import 'package:flutter/material.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class ReasonDialogBox extends StatefulWidget {
  const ReasonDialogBox({
    Key? key,
    required this.reason,
  }) : super(key: key);
  //final BuildContext context;

  @override
  State<ReasonDialogBox> createState() => _ReasonDialogBox();

  final reason;
}

class _ReasonDialogBox extends State<ReasonDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Center(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              padding: const EdgeInsets.all(30),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "reason",
                      style: poppinsW600S20Black,
                    ),
                    Text(
                      widget.reason,
                      style: cancellationReasonParaTextStyle,
                    ),
                  ]),
            ))));
  }
}
