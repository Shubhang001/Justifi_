import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jusitfi_admin/presentation/screens/offers_page.dart';
import 'package:jusitfi_admin/presentation/screens/pay_now_page.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/coupon_code_constants.dart';
import '../../utils/constants/textstyles.dart';

class AddCreditsPage extends StatefulWidget {
  String title;
  AddCreditsPage({super.key, required this.title});

  @override
  State<AddCreditsPage> createState() => _AddCreditsPageState();
}

TextEditingController _addCoinController = TextEditingController(text: "001");
int price = 499;
int gst = 50;
int discount = 150;
int total = 390;

class _AddCreditsPageState extends State<AddCreditsPage> {
  @override
  void initState() {
    super.initState();
    CouponCodeConstant.couponCodeApplied = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title.toString(),
            style: alegreyaW700S24White,
          ),
        ),
        backgroundColor: kPrimaryBlackColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CButton(b_title: widget.title.toString()),
                      Text(
                        "X",
                        style: alegreyaW700S24White,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.075,
                        child: TextFormField(
                          controller: _addCoinController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          int cur =
                              int.parse(_addCoinController.text.toString());
                          cur++;
                          setState(() {
                            _addCoinController.text = cur.toString();
                          });
                        },
                        child: const AddButton(),
                      ),
                    ],
                  ),
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
                    child: CButton(
                      b_title: CouponCodeConstant.couponCodeApplied
                          ? "Coupon Applied"
                          : "Coupon Code",
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price",
                          style: alegreyaW700S24White,
                        ),
                        Text(price.toString(), style: alegreyaW700S24White)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "GST",
                          style: alegreyaW700S24White,
                        ),
                        Text(gst.toString(), style: alegreyaW700S24White)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discount",
                          style: alegreyaW700S24White,
                        ),
                        Text(discount.toString(), style: alegreyaW700S24White)
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: alegreyaW700S24White,
                        ),
                        Text(total.toString(), style: alegreyaW700S24White)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => PayNowPage(
                                  title: widget.title.toString(),
                                  total: total.toString(),
                                )));
                      },
                      child: CButton(
                        b_title: "Pay Now",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CButton extends StatelessWidget {
  String b_title;
  CButton({super.key, required this.b_title});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 52,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Center(
            child: Text(
          b_title.toString(),
          style: poppinsW500S15Black,
        )));
  }
}

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black,
            border: Border.all(color: Colors.white, width: 1)),
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 20,
          ),
        ));
  }
}
