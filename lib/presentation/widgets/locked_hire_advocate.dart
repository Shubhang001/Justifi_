import 'package:flutter/material.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

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
                    Stack(children: [
                      Container(
                          height: 60,
                          width: 64,
                          child: Image.asset(
                            "assets/images/advocate_image.png",
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
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Row(children: [
                        Text(
                          "Completion time for case  :  ",
                          style: alegreyaW700S16,
                        ),
                        Text(
                          "6 months  ",
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
                          "Fee Type  :  ",
                          style: alegreyaW700S16,
                        ),
                        Text(
                          "Per Hearing Fee ",
                          style: alegreyaW400S16,
                        ),
                      ])
                    ]),
                    SizedBox(
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
                          width: 8,
                        ),
                        Text(
                          "Unlock the chat Communication",
                          style: poppinsW500S15Black,
                        ),
                      ])
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Row(children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.black,
                            ),
                            height: 10,
                            width: 10,
                            child: Icon(
                              Icons.circle,
                              color: Colors.white,
                              size: 8,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          " ₹ 199 / One Time hiring",
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
                        "₹ 1999/Month/Unlimited hiring",
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
                        "₹ 5999/Year/Unlimited hiring",
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
