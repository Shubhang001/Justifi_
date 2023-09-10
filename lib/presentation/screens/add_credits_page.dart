import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jusitfi_admin/presentation/screens/offers_page.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/coupon_code_constants.dart';
import '../../utils/constants/textstyles.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

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
  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context as BuildContext, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(context as BuildContext, "Payment Successful",
        "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(context as BuildContext, "External Wallet Selected",
        "${response.walletName}");
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
                        Razorpay razorpay = Razorpay();
                        var options = {
                          'key': 'rzp_live_ILgsfZCZoFIKMb',
                          'amount': 10000000,
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
