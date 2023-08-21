import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/wallet_page.dart';

import '../../utils/constants/colors.dart';

import '../../utils/constants/textstyles.dart';

class WalletProceedPage extends StatefulWidget {
  String title;
  String msg;
  WalletProceedPage({super.key, required this.title, required this.msg});

  @override
  State<WalletProceedPage> createState() => _WalletProceedPage();
}

TextEditingController _addCoinController = TextEditingController(text: "001");
int price = 0;
int gst = 0;
int discount = 0;
int total = 0;

class _WalletProceedPage extends State<WalletProceedPage> {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          "assets/icons/proceed_page_icon.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            "Transaction",
                            style: alegreyaW700S24White,
                          ),
                          Text(
                            "Successful",
                            style: alegreyaW700S24White,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "01 ${widget.title.toString()} has been successfully credited ",
                      textAlign: TextAlign.center,
                      style: alegreyaW700S24White,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.asset(
                        "assets/icons/icon_check_circle.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const WalletPage(
                                userName: "Sangeeta Rai",
                                userImage: "assets/images/user_image.png",
                                userLocation: "Mumbai")));
                      },
                      child: CButton(
                        b_title: "Home",
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
          style: poppinsW500S20Black,
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
