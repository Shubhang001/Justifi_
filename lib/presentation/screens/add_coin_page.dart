import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jusitfi_admin/presentation/screens/offers_page.dart';
import 'package:jusitfi_admin/utils/constants/coupon_code_constants.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

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

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Map<String, dynamic> data = {};
  Map<String, dynamic> order = {};

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    CouponCodeConstant.couponCodeApplied = false;
    fetchUsers(total);
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
                                    builder: (context) => OffersPage(
                                      title: "Profile Credits",
                                    ),
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
                              order = data['order'];
                              Razorpay razorpay = Razorpay();
                              var key = data['razorpay_key'];
                              var amount = order['amount'];
                              var options = {
                                'key': key,
                                'amount': amount,
                                'name': 'Justifi Corp.',
                                'description': 'Advocate Hire',
                                'retry': {'enabled': true, 'max_count': 1},
                                'send_sms_hash': true,
                                'prefill': {
                                  'contact': '8888888888',
                                  'email': 'test@razorpay.com'
                                },
                                'external': {
                                  'wallets': ['paytm']
                                }
                              };
                              razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                                  handlePaymentErrorResponse);
                              razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                                  handlePaymentSuccessResponse);
                              razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                                  handleExternalWalletSelected);
                              razorpay.open(options);
                            },
                            child: const PayNowButton(),
                          ),
                        ),
                      ]))),
        ));
  }

  Future<void> fetchUsers(int total) async {
    print('fetchUser called');
    //String authentication = "0f464ab809733c1e19c02d50a1e7be04c86d74a0";
    Uri uri;
    uri = Uri.parse("http://15.206.28.255:8000/v1/payment/");
    var response = await http.post(uri,
        headers: <String, String>{
          "Authorization": "token 0f464ab809733c1e19c02d50a1e7be04c86d74a0",
          "Content-Type": "application/json",
        },
        body: jsonEncode(<String, dynamic>{"amount": total}));
    print(response.statusCode.toString());
    if (response.statusCode == 201) {
      final body = response.body;
      print(response.body);
      final json = jsonDecode(body);
      if (json == null) {
        print("exception");
      }
      setState(() {
        data = json['data'];
      });
      print('fetchUser complete');
    }
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
