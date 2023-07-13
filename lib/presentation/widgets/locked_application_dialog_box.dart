import 'package:flutter/material.dart';
import 'package:jusitfi_admin/utils/constants/coupon_code_constants.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

import '../screens/add_credits_page.dart';
import '../screens/offers_page.dart';

class LockedApplicationDialogBox extends StatefulWidget {
  const LockedApplicationDialogBox({
    Key? key,
  }) : super(key: key);
  //final BuildContext context;

  @override
  State<LockedApplicationDialogBox> createState() =>
      _LockedApplicationDialogBox();
}

class _LockedApplicationDialogBox extends State<LockedApplicationDialogBox> {
  bool item1 = false;
  bool item2 = false;
  bool item3 = false;
  @override
  void initState() {
    super.initState();
    CouponCodeConstant.couponCodeApplied = false;
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     if (CouponCodeConstant.isCouponCardTapped == true) {
  //       SnackBar snackBar = const SnackBar(
  //         duration: Duration(seconds: 2),
  //         content: Text('Coupon applied successfully. Make payment now.'),
  //       );
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         snackBar,
  //       );
  //       setState(() {
  //         CouponCodeConstant.isCouponCardTapped = false;
  //       });
  //     }
  //   });
  // }

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
                      "Hiring Pricing",
                      style: poppinsW500S20Black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "15",
                      style: poppinsW500S20Black,
                    ),
                    SizedBox(
                        height: 28,
                        width: 72,
                        child: Image.asset(
                          "assets/images/advocate_grp.png",
                          fit: BoxFit.cover,
                        )),
                    const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Pay fees to Unlock fees Quote",
                      style: poppinsW500S15Black,
                    ),
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
                          width: 10,
                        ),
                        Text(
                          "Unlock the Profiles",
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
                          " ₹ 599 / Post credit hiring",
                          style: poppinsW500S15Black,
                        ),
                      ])
                    ]),
                    const SizedBox(
                      height: 15,
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
                    //             borderRadius: BorderRadius.circular(25),
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
                    //     width: 8,
                    //   ),
                    //   Text(
                    //     "₹ 2999/Month/Unlimited hiring",
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
                    //     width: 8,
                    //   ),
                    //   Text(
                    //     "₹ 2999/Year/Unlimited hiring",
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
                                builder: (context) => OffersPage()))
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
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        //implement
                        //profile hiring
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddCreditsPage(
                              title: "Profile Credits",
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
