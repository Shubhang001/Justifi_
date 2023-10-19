import 'package:flutter/material.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class ReviewDialogBox extends StatefulWidget {
  const ReviewDialogBox({
    Key? key,
  }) : super(key: key);
  //final BuildContext context;

  @override
  State<ReviewDialogBox> createState() => _ReviewDialogBox();
}

class _ReviewDialogBox extends State<ReviewDialogBox> {
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
                      "Review",
                      style: poppinsW600S20Black,
                    ),
                    Image.asset(
                      'assets/images/advocate_img.png',
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "Priya Sharma",
                      style: poppinsW600S16Black,
                    ),
                    /// LOCATION
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     const Icon(
                    //       Icons.location_on,
                    //       color: Colors.black,
                    //     ),
                    //     Text(
                    //       "Mumbai",
                    //       style: kAdvocateCardLocationBlack,
                    //     )
                    //   ],
                    // ),
                    Divider(
                      color: kprimaryTextColor,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Client_image.png',
                        ),
                        Column(
                          children: [
                            Text(
                              "Sameer Ghosh",
                              style: poppinsW600S20Black,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 8, right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    "5",
                                    style: kAdvocateCardRatingWhite,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Text(
                      "At vero eos et accusamus et iusto odio dres et quas int occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id",
                      style: cancellationReasonParaTextStyle,
                    ),
                  ]),
            ))));
  }
}
