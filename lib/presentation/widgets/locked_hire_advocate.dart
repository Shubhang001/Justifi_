import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/offers_page.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

import '../../utils/constants/coupon_code_constants.dart';
import '../screens/add_credits_page.dart';

class LockedHireAdvocateDialogBox extends StatefulWidget {
  const LockedHireAdvocateDialogBox({
    Key? key,
  }) : super(key: key);
  //final BuildContext context;

  @override
  State<LockedHireAdvocateDialogBox> createState() =>
      _LockedHireAdvocateDialogBox();
}

class _LockedHireAdvocateDialogBox extends State<LockedHireAdvocateDialogBox> {
  bool item1 = false;
  bool item2 = false;
  bool item3 = false;
  @override
  void initState() {
    super.initState();
    CouponCodeConstant.couponCodeApplied = false;
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   if (CouponCodeConstant.isCouponCardTapped == true) {
    //     SnackBar snackBar = const SnackBar(
    //       duration: Duration(seconds: 2),
    //       content: Text('Coupon applied successfully. Make payment now.'),
    //     );
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       snackBar,
    //     );
    //     setState(() {
    //       CouponCodeConstant.isCouponCardTapped = false;
    //     });
    //   }
    // });
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
                    Stack(children: [
                      SizedBox(
                          height: 60,
                          width: 64,
                          child: Image.asset(
                            "assets/images/advocate_img.png",
                            fit: BoxFit.cover,
                          )),
                      const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Criminal Matters",
                      style: poppinsW400S16Black,
                    ),
                    Text(
                      "Robbery",
                      style: poppinsW400S16Black,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Flexible(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                          Row(children: [
                            Text(
                              "Completion time for case  :  ",
                              style: alegreyaW700S16,
                            ),
                            Text(
                              "6 months",
                              style: alegreyaW400S16,
                            ),
                          ])
                        ])),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Row(children: [
                        Text(
                          "Fee Type  :  ",
                          style: alegreyaW700S16,
                        ),
                        Text(
                          "Per Hearing Fee ",
                          style: alegreyaW400S16,
                        ),
                      ])
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Row(children: [
                        Text(
                          "Fee  :  ",
                          style: alegreyaW700S16,
                        ),
                        Text(
                          "₹ 10,000 ",
                          style: alegreyaW400S16,
                        ),
                      ])
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Row(children: [
                        SizedBox(
                            height: 20,
                            width: 16,
                            child: Image.asset(
                              "assets/images/unlocked_lock.png",
                              fit: BoxFit.cover,
                            )),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Unlock the chat Communication",
                          style: poppinsW500S15Black,
                        ),
                      ])
                    ]),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Row(children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                item1 = !item1;
                                item2 = false;
                                item3 = false;
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.black,
                                ),
                                height: 15,
                                width: 15,
                                child: Icon(
                                  Icons.circle,
                                  color: item1 == true
                                      ? Colors.black
                                      : Colors.white,
                                  size: 15,
                                ))),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          " ₹ 199 / Profile hiring",
                          style: poppinsW500S15Black,
                        ),
                      ])
                    ]),
                    const SizedBox(
                      height: 30,
                    ),
                    // Row(children: [
                    //   GestureDetector(
                    //       onTap: () {
                    //         setState(() {
                    //           item2 = !item2;
                    //           item1 = false;
                    //           item3 = false;
                    //         });
                    //       },
                    //       child: Container(
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(20),
                    //             color: Colors.black,
                    //           ),
                    //           height: 15,
                    //           width: 15,
                    //           child: Icon(
                    //             Icons.circle,
                    //             color:
                    //                 item2 == true ? Colors.black : Colors.white,
                    //             size: 15,
                    //           ))),
                    //   const SizedBox(
                    //     width: 10,
                    //   ),
                    //   Text(
                    //     "₹ 1999/Month/Unlimited hiring",
                    //     style: poppinsW500S15Black,
                    //   ),
                    // ]),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // Row(children: [
                    //   GestureDetector(
                    //       onTap: () {
                    //         setState(() {
                    //           item3 = !item3;
                    //           item1 = false;
                    //           item2 = false;
                    //         });
                    //       },
                    //       child: Container(
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(25),
                    //             color: Colors.black,
                    //           ),
                    //           height: 15,
                    //           width: 15,
                    //           child: Icon(
                    //             Icons.circle,
                    //             color:
                    //                 item3 == true ? Colors.black : Colors.white,
                    //             size: 15,
                    //           ))),
                    //   const SizedBox(
                    //     width: 10,
                    //   ),
                    //   Text(
                    //     "₹ 5999/Year/Unlimited hiring",
                    //     style: poppinsW500S15Black,
                    //   ),
                    // ]),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) =>
                                      OffersPage(title: "Profile Credits")))
                              .then((value) => setState(() {}));
                        },
                        child: Container(
                          height: 32,
                          width: 220,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black),
                          child: Center(
                            child: Text(
                              CouponCodeConstant.couponCodeApplied
                                  ? "Coupon Applied"
                                  : "Coupon Code",
                              style: poppinsW500S15White,
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        //postt hiring
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddCreditsPage(
                              title: "Post Credits",
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 32,
                        width: 144,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black),
                        child: Center(
                          child: Text(
                            "Pay Now",
                            style: poppinsW400S14White,
                          ),
                        ),
                      ),
                    ),
                  ]),
            )));
  }
}
