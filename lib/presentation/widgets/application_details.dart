import 'package:flutter/material.dart';
import 'package:image_stack/image_stack.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';
import '../../utils/constants/colors.dart';

class ApplicantsDetails extends StatelessWidget {
  const ApplicantsDetails({
    super.key,
    required this.images,
    required this.status,
    required this.applications,
    required this.isLocked,
  });

  final List<String> images;
  final String status;
  final int applications;
  final bool isLocked;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          applications.toString(),
          style: kHomePageTitle,
        ),
        SizedBox(
          height: 50,
          width: 130,
          child: Stack(children: [
            Positioned(
              child: ImageStack(
                imageList: images,
                imageRadius: 40,
                imageCount: 4,
                showTotalCount: false,
                imageBorderWidth: 3,
                totalCount: 5,
                backgroundColor: Colors.white,
                imageBorderColor: kPrimaryBlackColor,
              ),
            ),
            const Positioned(
              right: 0,
              top: 20,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.add,
                  size: 15,
                  color: Colors.black,
                ),
              ),
            ),
            isLocked
                ? const Positioned(
                    left: 0,
                    top: 20,
                    child: Icon(
                      Icons.lock,
                      size: 15,
                      color: Colors.white,
                    ),
                  )
                : const SizedBox(),
          ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Status : ',
              style: kApplicationDetails,
            ),
            Text(status,
                style: status == 'Pending'
                    ? kApplicationPending
                    : status == 'Hired'
                        ? kApplicationHired
                        : kApplicationCanceled)
          ],
        )
      ],
    );
  }
}
