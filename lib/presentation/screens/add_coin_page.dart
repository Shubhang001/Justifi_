import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jusitfi_admin/presentation/screens/offers_page.dart';
import 'package:jusitfi_admin/utils/constants/coupon_code_constants.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';
import 'coins_pay_now_page.dart';

class AddCoinPage extends StatefulWidget {
  const AddCoinPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddCoinPage> createState() => _AddCoinPage();
}

class _AddCoinPage extends State<AddCoinPage> {
  final TextEditingController _addMoneyController = TextEditingController();
  // ignore: unused_field
  final TextEditingController _couponTextController =
      TextEditingController(text: "Coupon Code");
  int price = 499;
  int gst = 50;
  int discount = 150;
  int total = 390;
  // String couponText = "Coupon Code";

  void _onAmountTapped(int index) {
    setState(() {
      //_selectedIndex = index;
      _addMoneyController.text = index.toString();
      //_selectedSubCategoryIndex = 0;
    });
  }

  // void isCouponClicked() {
  //   setState(() {
  //     couponText =
  //     _couponTextController.text = couponText;
  //   });
  //   // return couponText;
  // }

  var _razorpay = Razorpay();

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    CouponCodeConstant.couponCodeApplied = false;
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print("Payment Done");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Payment Fail");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: const Icon(
          //   Icons.arrow_back,
          //   color: Colors.white,
          //   size: 30,
          // ),
          title: Center(
            child: Text(
              "Add Coins",
              style: alegreyaW700S24White,
            ),
          ),
          backgroundColor: kPrimaryBlackColor,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
              child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Add Coins",
                              textAlign: TextAlign.center,
                              style: robotoW500S30Black,
                            ),
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Image.asset("assets/icons/add_coins.png"),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Coin Quantity",
                          style: poppinsW500S12Black,
                        ),
                        TextFormField(
                          controller: _addMoneyController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(
                                  MaterialPageRoute(
                                    builder: (context) => OffersPage(),
                                  ),
                                )
                                .then((value) => setState(() {}));
                          },
                          child: Center(
                            child: Container(
                              height: 40,
                              width: 310,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              child: Center(
                                  child: Text(
                                CouponCodeConstant.couponCodeApplied
                                    ? "Coupon Applied"
                                    : "Coupon Code",
                                style: poppinsW400S18Black,
                              )),
                            ),
                          ),
                        ),

                        //till here

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
                                style: inriaSerifW700S30Black,
                              ),
                              Text(price.toString(),
                                  style: inriaSerifW700S30Black)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "GST",
                                style: inriaSerifW700S30Black,
                              ),
                              Text(gst.toString(),
                                  style: inriaSerifW700S30Black)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Discount",
                                style: inriaSerifW700S30Black,
                              ),
                              Text(discount.toString(),
                                  style: inriaSerifW700S30Black)
                            ],
                          ),
                        ),

                        const Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: inriaSerifW700S30Black,
                              ),
                              Text(total.toString(),
                                  style: inriaSerifW700S30Black)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              // var options = {
                              //   'key': "rzp_test_OGQis6YiNZBFeT",
                              //   'amount':
                              //       (int.parse(_addMoneyController.text) * 100)
                              //           .toString(),
                              //   'name': 'Justifi Client',
                              //   'description': 'Demo',
                              //   'timeout': 300, // in seconds
                              //   'prefill': {
                              //     'contact': '9898989898',
                              //     'email': 'mohitanand@gmail.com'
                              //   }
                              // };
                              // _razorpay.open(options);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CoinsPayNowPage(
                                    title: 'Wallet',
                                    total: total.toString(),
                                  ),
                                ),
                              );
                            },
                            child: const PayNowButton(),
                          ),
                        ),
                      ]))),
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _razorpay.clear();
    super.dispose();
  }
}

class PayNowButton extends StatelessWidget {
  const PayNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.black),
        child: Center(
            child: Text(
          "Pay Now",
          style: poppinsW500S15White,
        )));
  }
}
