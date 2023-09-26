import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jusitfi_admin/presentation/screens/offers_page.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants/colors.dart';
import '../../utils/constants/coupon_code_constants.dart';
import '../../utils/constants/textstyles.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class AddCreditsPage extends StatefulWidget {
  String title;
  String code = "";
  AddCreditsPage({super.key, required this.title});

  @override
  State<AddCreditsPage> createState() => _AddCreditsPageState();
}

TextEditingController _addCoinController = TextEditingController(text: "001");
double price = 499;
double gst = 0;
double discount = 0;
double discount1 = 0;

int total = price.toInt();
int cur = 0;

class _AddCreditsPageState extends State<AddCreditsPage> {
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
    CouponCodeConstant.couponCodeApplied = false;
    if (widget.title == "Profile Credits") {
      price = 199;
    } else {
      price = 499;
    }
    gst = 18 / 100 * price;

    cur = 001;
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
                          cur = int.parse(_addCoinController.text.toString());
                          cur++;
                          setState(() {
                            _addCoinController.text = cur.toString();
                          });
                          int cur1 =
                              int.parse(_addCoinController.text.toString());
                          if (widget.title == "Profile Credits") {
                            price = 199;
                          }
                          print(_addCoinController.toString());
                          print("done");
                          price = cur1 * price;
                          gst = 18 * price / 100;
                          if (discount1 != 0) {
                            discount = discount1 * price / 100;
                            double discountedPrice = discount;
                            gst = 18 * discountedPrice / 100;
                            gst = double.parse((gst).toStringAsFixed(2));
                            discount =
                                double.parse((discount).toStringAsFixed(2));
                          }
                          total = (price.toDouble() + gst - discount).round();
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
                              builder: (context) =>
                                  OffersPage(title: widget.title)))
                          .then((value) => setState(() {
                                print(widget.code);
                                if (widget.code == "23HT873") {
                                  discount = 15;
                                }
                                discount = 15;
                                discount1 = discount;
                                discount = discount * price / 100;
                                double discountedPrice = discount;
                                gst = 18 * discountedPrice / 100;
                                gst = double.parse((gst).toStringAsFixed(2));
                                discount =
                                    double.parse((discount).toStringAsFixed(2));
                                total = (price - discount + gst).round();
                              }));
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
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                fetchUsers(total);
                                const CircularProgressIndicator(
                                  color: Colors.green,
                                );
                                if (data['order'] != null) {
                                  razorpayCalled();
                                }
                              },
                              child: CButton(
                                b_title: "Pay Now",
                              ),
                            );
                          }),
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

  razorpayCalled() async {
    await Future.delayed(const Duration(seconds: 3));
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
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
    razorpay.open(options);
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
