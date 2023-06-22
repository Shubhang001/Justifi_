import 'package:flutter/material.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class VideoCallWidget extends StatelessWidget {
  const VideoCallWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 85,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.videocam,
            color: Colors.black,
          ),
          Text(
            "Video Call",
            style: videoCallTextStyle,
          )
        ],
      ),
    );
  }
}
