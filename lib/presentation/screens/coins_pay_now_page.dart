import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:jusitfi_admin/presentation/screens/wallet_proceed_page.dart';

import '../../utils/constants/colors.dart';

import '../../utils/constants/textstyles.dart';

class CoinsPayNowPage extends StatefulWidget {
  String title;
  String total;
  CoinsPayNowPage({super.key, required this.title, required this.total});

  @override
  State<CoinsPayNowPage> createState() => _CoinsPayNowPage();
}

TextEditingController _addCoinController = TextEditingController(text: "001");
int price = 0;
int gst = 0;
int discount = 0;
int total = 390;
bool _paymentOpt2 = false;
bool _paymentOpt1 = false;
bool _paymentOpt3 = false;

class _CoinsPayNowPage extends State<CoinsPayNowPage> {
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
                  Text(
                    "Coin Quantity",
                    style: poppinsW500S18White,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.080,
                    child: Center(
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
                                          const Text(
                                              "Pay with Debit/Credit/ATM Card")
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
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => WalletProceedPage(
                                msg: "1000 coins has been successfully added ",
                                title: widget.title.toString())));
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
