import 'package:flutter/material.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

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
              padding: EdgeInsets.all(30),
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
                    Container(
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
                    SizedBox(
                      height: 20,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Row(children: [
                        Container(
                            height: 20,
                            width: 16,
                            child: Image.asset(
                              "assets/images/unlocked_lock.png",
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Unlock the Profiles",
                          style: poppinsW500S15Black,
                        ),
                      ])
                    ]),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Row(children: [
                        Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.black),
                            child: Icon(
                              Icons.circle,
                              color: Colors.white,
                              size: 8,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          " ₹ 599 / One Time hiring",
                          style: poppinsW500S15Black,
                        ),
                      ])
                    ]),
                    SizedBox(
                      height: 15,
                    ),
                    Row(children: [
                      Container(
                          height: 9,
                          width: 9,
                          child: Image.asset(
                            "assets/images/selected_circle.png",
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "₹ 2999/Month/Unlimited hiring",
                        style: poppinsW500S15Black,
                      ),
                    ]),
                    SizedBox(
                      height: 15,
                    ),
                    Row(children: [
                      Container(
                          height: 9,
                          width: 9,
                          child: Image.asset(
                            "assets/images/selected_circle.png",
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "₹ 2999/Year/Unlimited hiring",
                        style: poppinsW500S15Black,
                      ),
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 32,
                      width: 220,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black),
                      child: Center(
                        child: Text(
                          "Coupon Code",
                          style: poppinsW500S15White,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
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
                    )
                  ]),
            )));
  }
}
