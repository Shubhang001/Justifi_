import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jusitfi_admin/presentation/screens/offers_page.dart';
import 'package:jusitfi_admin/presentation/screens/proceed_page.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';

class AddMoneyPage extends StatefulWidget {
  AddMoneyPage({
    Key? key,
    required this.currentWalletBalance,
  }) : super(key: key);
  final String currentWalletBalance;

  @override
  State<AddMoneyPage> createState() => _AddMoneyPageState();
}

class _AddMoneyPageState extends State<AddMoneyPage> {
  int _selectedIndex = -1;
  bool _paymentOpt1 = false;
  bool _paymentOpt2 = false;
  bool _paymentOpt3 = false;
  TextEditingController _addMoneyController = TextEditingController();
  void _onAmountTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _addMoneyController.text = index.toString();
      //_selectedSubCategoryIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Add Money",
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
                              Column(
                                children: [
                                  Text(
                                    "Current Wallet",
                                    style: poppinsW500S15Black,
                                  ),
                                  Text(
                                    "Balance",
                                    style: poppinsW500S15Black,
                                  )
                                ],
                              ),
                              Spacer(),
                              Text(
                                "₹" + widget.currentWalletBalance.toString(),
                                style: poppinsW500S18Black,
                              )
                            ]),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                            controller: _addMoneyController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                icon: Icon(
                                  Icons.currency_rupee,
                                  color: Colors.black,
                                  size: 24,
                                ))),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  _onAmountTapped(500);
                                },
                                child: Container(
                                  height: 40,
                                  width: 84,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.black, width: 2)),
                                  child: Center(
                                      child: Text(
                                    "₹ 500 ",
                                    style: poppinsW500S15Black,
                                  )),
                                )),
                            GestureDetector(
                                onTap: () {
                                  _onAmountTapped(1000);
                                },
                                child: Container(
                                  height: 40,
                                  width: 84,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.black, width: 2)),
                                  child: Center(
                                      child: Text(
                                    "₹ 1000 ",
                                    style: poppinsW500S15Black,
                                  )),
                                )),
                            GestureDetector(
                                onTap: () {
                                  _onAmountTapped(1500);
                                },
                                child: Container(
                                  height: 40,
                                  width: 84,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.black, width: 2)),
                                  child: Center(
                                      child: Text(
                                    "₹ 1500 ",
                                    style: poppinsW500S15Black,
                                  )),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => OffersPage()));
                            },
                            child: Center(
                                child: Container(
                              height: 40,
                              width: 310,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: Center(
                                  child: Text(
                                "Coupon Code",
                                style: poppinsW500S18White,
                              )),
                            ))),
                        SizedBox(
                          height: 60,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                _paymentOpt1 = !_paymentOpt1;
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
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Colors.black,
                                                    ),
                                                    height: 25,
                                                    width: 25,
                                                    child: Icon(
                                                      Icons.circle,
                                                      color:
                                                          _paymentOpt1 == true
                                                              ? Colors.black
                                                              : Colors.white,
                                                      size: 25,
                                                    )),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    "Pay with Debit/Credit/ATM Card")
                                              ],
                                            )))))),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                _paymentOpt2 = !_paymentOpt2;
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
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Colors.black,
                                                    ),
                                                    height: 25,
                                                    width: 25,
                                                    child: Icon(
                                                      Icons.circle,
                                                      color:
                                                          _paymentOpt2 == true
                                                              ? Colors.black
                                                              : Colors.white,
                                                      size: 25,
                                                    )),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text("Net Banking")
                                              ],
                                            )))))),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                _paymentOpt3 = !_paymentOpt3;
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
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Colors.black,
                                                    ),
                                                    height: 25,
                                                    width: 25,
                                                    child: Icon(
                                                      Icons.circle,
                                                      color:
                                                          _paymentOpt3 == true
                                                              ? Colors.black
                                                              : Colors.white,
                                                      size: 25,
                                                    )),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text("UPI")
                                              ],
                                            )))))),
                        SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProceedPage(
                                      message:
                                          "Your money has been added successfully.")));
                            },
                            child: Center(
                                child: Container(
                              height: 32,
                              width: 87,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: Center(
                                  child: Text(
                                "Proceed",
                                style: poppinsW500S12White,
                              )),
                            ))),
                      ]))),
        ));
  }
}
