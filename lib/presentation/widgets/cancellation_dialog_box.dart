import 'package:flutter/material.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class CancellationDialogBox extends StatefulWidget {
  const CancellationDialogBox({
    Key? key,
  }) : super(key: key);
  //final BuildContext context;

  @override
  State<CancellationDialogBox> createState() => _CancellationDialogBoxState();
}

class _CancellationDialogBoxState extends State<CancellationDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              padding: const EdgeInsets.all(30),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Cancellation Reason",
                      style: poppinsW600S16Black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: kprimaryTextColor,
                      thickness: 1,
                    ),
                    Text(
                      "At vero eos et accusamus et iusto odio dres et quas int occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id",
                      style: poppinsW400S9Black,
                    ),
                  ]),
            )));
  }
}
