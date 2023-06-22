import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/cancel_reason_submit_page.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class ViewCancelReasonDialog extends StatefulWidget {
  const ViewCancelReasonDialog({
    Key? key,
    required this.message,
  }) : super(
          key: key,
        );
  //final BuildContext context;
  final String message;

  @override
  State<ViewCancelReasonDialog> createState() => _ViewCancelReasonDialog();
}

class _ViewCancelReasonDialog extends State<ViewCancelReasonDialog> {
  final TextEditingController _cancelReasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            elevation: 0,
            backgroundColor: Colors.black,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.black),
              padding: const EdgeInsets.all(30),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Cancellation Reason",
                        style: poppinsW600S16White,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50, right: 50, top: 4),
                      child: Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: 240,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white),
                        child: TextFormField(
                            maxLines: null,
                            cursorColor: Colors.black,
                            expands: true,
                            keyboardType: TextInputType.multiline,
                            controller: _cancelReasonController,
                            decoration: InputDecoration(
                              focusColor: Colors.white,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14)),
                            ))),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CancelReasonSubmitPage(
                                  message: widget.message.toString(),
                                )));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white),
                        child: Text(
                          "Submit",
                          style: poppinsW600S10Black,
                        ),
                      ),
                    ))
                  ]),
            )));
  }
}
