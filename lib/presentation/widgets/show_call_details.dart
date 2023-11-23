import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:jusitfi_admin/presentation/screens/meeting_screen.dart';
import 'package:jusitfi_admin/presentation/screens/meeting_screen_audio.dart';
//import 'package:jusitfi_admin/presentation/screens/video_call.dart';
import 'package:jusitfi_admin/utils/services/api_call.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';

final TextEditingController singleInviteeUserIDTextCtrl =
    TextEditingController();

void onCreateButtonPressed(
    BuildContext context, String mode, int userid) async {
  final user = userid.toString();
  singleInviteeUserIDTextCtrl.text = user;
  // call api to create meeting and then navigate to MeetingScreen with meetingId,token
  await createMeeting().then((meetingId) {
    if (!context.mounted) return;
    mode == "Audio Call"
        ? sendCallButton(
            isVideoCall: false,
            inviteeUsersIDTextCtrl: singleInviteeUserIDTextCtrl,
            onCallFinished: onSendCallInvitationFinished,
          )
        : sendCallButton(
            isVideoCall: true,
            inviteeUsersIDTextCtrl: singleInviteeUserIDTextCtrl,
            onCallFinished: onSendCallInvitationFinished,
          );
  });
}

Future<Object?> showCallDetails(BuildContext context, String mode, int userid) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black38,
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (ctx, anim1, anim2) => AlertDialog(
      actions: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(35),
                            bottomLeft: Radius.circular(35))),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: kdesignButtonText,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    onCreateButtonPressed(context, mode, userid);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: kprimaryTextColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(35),
                            bottomRight: Radius.circular(35))),
                    height: 50,
                    child: Center(
                      child: Text(
                        'Call',
                        style: kdesignButtonText,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(22.0))),
      backgroundColor: Colors.black,
      title: Center(
        child: Text(
          'Call Details',
          style: kCallTitle,
        ),
      ),
      content: SizedBox(
          width: 300,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(7)),
                width: 100,
                height: 90,
                child: Image.asset(
                  'assets/images/advocate_img.png',
                  fit: BoxFit.fill,
                ),
              ),
              Text('Priya Sharma', style: kCallName),
              Table(
                border: TableBorder.all(width: 1.0, color: Colors.white),
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              'Mode',
                              style: kCallQn,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              mode,
                              style: kCallAns,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              'Price /15mins',
                              style: kCallQn,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              '200Rs',
                              style: kCallAns,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              'Location',
                              style: kCallQn,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              'Mumbai',
                              style: kCallAns,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              'Current Balance',
                              style: kCallQn,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              '350Rs',
                              style: kCallAns,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              'Call Possible for',
                              style: kCallQn,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              '15 mins',
                              style: kCallAns,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    ),
    transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
      filter:
          ImageFilter.blur(sigmaX: 1 * anim1.value, sigmaY: 1 * anim1.value),
      child: FadeTransition(
        opacity: anim1,
        child: child,
      ),
    ),
    context: context,
  );
}

Widget sendCallButton({
  required bool isVideoCall,
  required TextEditingController inviteeUsersIDTextCtrl,
  void Function(String code, String message, List<String>)? onCallFinished,
}) {
  return ValueListenableBuilder<TextEditingValue>(
    valueListenable: inviteeUsersIDTextCtrl,
    builder: (context, inviteeUserID, _) {
      var invitees = getInvitesFromTextCtrl(inviteeUsersIDTextCtrl.text.trim());

      return ZegoSendCallInvitationButton(
        isVideoCall: isVideoCall,
        invitees: invitees,
        resourceID: "zego_data",
        iconSize: const Size(40, 40),
        buttonSize: const Size(50, 50),
        onPressed: onCallFinished,
      );
    },
  );
}

List<ZegoUIKitUser> getInvitesFromTextCtrl(String textCtrlText) {
  List<ZegoUIKitUser> invitees = [];

  var inviteeIDs = textCtrlText.trim().replaceAll('，', '');
  inviteeIDs.split(",").forEach((inviteeUserID) {
    if (inviteeUserID.isEmpty) {
      return;
    }

    invitees.add(ZegoUIKitUser(
      id: inviteeUserID,
      name: 'user_$inviteeUserID',
    ));
  });

  return invitees;
}

void onSendCallInvitationFinished(
  String code,
  String message,
  List<String> errorInvitees,
) {
  if (errorInvitees.isNotEmpty) {
    String userIDs = "";
    for (int index = 0; index < errorInvitees.length; index++) {
      if (index >= 5) {
        userIDs += '... ';
        break;
      }

      var userID = errorInvitees.elementAt(index);
      userIDs += userID + ' ';
    }
    if (userIDs.isNotEmpty) {
      userIDs = userIDs.substring(0, userIDs.length - 1);
    }

    var message = 'User doesn\'t exist or is offline: $userIDs';
    if (code.isNotEmpty) {
      message += ', code: $code, message:$message';
    }
    showToast(
      message,
      position: StyledToastPosition.top,
    );
  } else if (code.isNotEmpty) {
    showToast(
      'code: $code, message:$message',
      position: StyledToastPosition.top,
    );
  }
}
