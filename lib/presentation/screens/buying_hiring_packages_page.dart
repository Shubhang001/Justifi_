import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jusitfi_admin/presentation/screens/proceed_page.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';

class BuyingHiringPackagePage extends StatefulWidget {
  const BuyingHiringPackagePage({
    Key? key,
    required this.packageType,
  }) : super(key: key);
  final String packageType;

  @override
  State<BuyingHiringPackagePage> createState() => _BuyingHiringPackagePage();
}

class _BuyingHiringPackagePage extends State<BuyingHiringPackagePage> {
  TextEditingController _addMoneyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Buying Hiring Package",
            style: alegreyaW700S24White,
          ),
        ),
        backgroundColor: kPrimaryBlackColor,
      ),
      endDrawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Welcome to Justify',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            ListTile(
              title: Text("Item1"),
              leading: Icon(Icons.mail),
            ),
            Divider(
              height: 0.2,
            ),
            ListTile(
              title: Text("Item1"),
              leading: Icon(Icons.mail),
            ),
            Divider(
              height: 0.2,
            ),
            ListTile(
              title: Text("Item1"),
              leading: Icon(Icons.mail),
            ),
            Divider(
              height: 0.2,
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text(
                        widget.packageType.toString(),
                        style: poppinsW500S20Black,
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
                    Center(
                        child: Container(
                      height: 60,
                      width: 310,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black),
                      child: Center(
                          child: Text(
                        "Coupon Code",
                        style: poppinsW500S18White,
                      )),
                    )),
                    SizedBox(
                      height: 60,
                    ),
                    Center(
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
                                        Center(
                                          child: Stack(children: [
                                            // Image.asset(
                                            //     "assets/icons/inner_circle.png"),
                                            Image.asset(
                                                "assets/icons/outer_circle.png")
                                          ]),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Pay with Debit/Credit/ATM Card")
                                      ],
                                    ))))),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
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
                                        Center(
                                          child: Stack(children: [
                                            Image.asset(
                                                "assets/icons/inner_circle.png"),
                                            Image.asset(
                                                "assets/icons/outer_circle.png")
                                          ]),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Net Banking")
                                      ],
                                    ))))),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
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
                                        Stack(children: [
                                          // Image.asset(
                                          //     "assets/icons/inner_circle.png"),
                                          Center(
                                              child: Image.asset(
                                                  "assets/icons/outer_circle.png"))
                                        ]),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("UPI")
                                      ],
                                    ))))),
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ProceedPage(
                                  message:
                                      "You have successfully purchased Monthly Profile Hiring credits.")));
                        },
                        child: Center(
                            child: Container(
                          height: 40,
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
    );
  }
}
