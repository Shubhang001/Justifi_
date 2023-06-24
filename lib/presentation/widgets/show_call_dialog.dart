import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final Function onCallNowPressed;
  final Function onScheduleNowPressed;

  CustomDialog({
    required this.onCallNowPressed,
    required this.onScheduleNowPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              
              onPressed: onCallNowPressed as void Function()?,
              child: Text('Call Now'),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: onScheduleNowPressed as void Function()?,
              child: Text('Schedule Now'),
            ),
          ],
        ),
      ),
    );
  }
}
