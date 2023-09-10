import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jusitfi_admin/presentation/screens/wallet_proceed_page.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PayNowPage extends StatefulWidget {
  String title;
  String total;
  PayNowPage({super.key, required this.title, required this.total});

  @override
  State<PayNowPage> createState() => _PayNowPage();
}

TextEditingController _addCoinController = TextEditingController(text: "001");
int price = 0;
int gst = 0;
int discount = 0;
int total = 0;
bool _paymentOpt2 = false;
bool _paymentOpt1 = false;
bool _paymentOpt3 = false;

class _PayNowPage extends State<PayNowPage> {
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
                    height: 5,
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 10,
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
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Payment Mode",
                          style: alegreyaW700S24White,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _paymentOpt1 = !_paymentOpt1;
                          _paymentOpt2 = false;
                          _paymentOpt3 = false;
                        });
                      },
                      child: Center(
                          child: Card(
                              elevation: 10,
                              shadowColor: Colors.grey,
                              color: Colors.white,
                              child: SizedBox(
                                  width: 310,
                                  height: 80,
                                  child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.black,
                                              ),
                                              height: 25,
                                              width: 25,
                                              child: Icon(
                                                Icons.circle,
                                                color: _paymentOpt1 == true
                                                    ? Colors.black
                                                    : Colors.white,
                                                size: 25,
                                              )),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const SizedBox(
                                            width: 175,
                                            child: Text(
                                              "Pay with Debit/Credit/ATM Card",
                                              maxLines: 2,
                                            ),
                                          )
                                        ],
                                      )))))),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _paymentOpt2 = !_paymentOpt2;
                          _paymentOpt1 = false;
                          _paymentOpt3 = false;
                        });
                      },
                      child: Center(
                          child: Card(
                              elevation: 10,
                              shadowColor: Colors.grey,
                              color: Colors.white,
                              child: SizedBox(
                                  width: 310,
                                  height: 80,
                                  child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.black,
                                              ),
                                              height: 25,
                                              width: 25,
                                              child: Icon(
                                                Icons.circle,
                                                color: _paymentOpt2 == true
                                                    ? Colors.black
                                                    : Colors.white,
                                                size: 25,
                                              )),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text("Net Banking")
                                        ],
                                      )))))),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _paymentOpt3 = !_paymentOpt3;
                        _paymentOpt2 = false;
                        _paymentOpt1 = false;
                      });
                    },
                    child: Center(
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.grey,
                        color: Colors.white,
                        child: SizedBox(
                          width: 310,
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black,
                                    ),
                                    height: 25,
                                    width: 25,
                                    child: Icon(
                                      Icons.circle,
                                      color: _paymentOpt3 == true
                                          ? Colors.black
                                          : Colors.white,
                                      size: 25,
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text("UPI")
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                      onTap: () {
                        Razorpay razorpay = Razorpay();
                        var options = {
                          'key': 'rzp_live_ILgsfZCZoFIKMb',
                          'amount': 100,
                          'name': 'Acme Corp.',
                          'description': 'Fine T-Shirt',
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
                      child: Center(
                          child: Container(
                        height: 32,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                            child: Text(
                          "Proceed",
                          style: poppinsW500S15Black,
                        )),
                      ))),
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
