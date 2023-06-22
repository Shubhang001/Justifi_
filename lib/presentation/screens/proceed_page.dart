import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/wallet_page.dart';
import 'package:jusitfi_admin/presentation/widgets/big_button.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

import '../widgets/wave_clipper.dart';

class ProceedPage extends StatelessWidget {
  const ProceedPage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/check_mark.png'),
            Text(
              message.toString(),
              textAlign: TextAlign.center,
              style: kAssignText,
            ),
            const CustomButton(
              removescreens: true,
              nextPage: WalletPage(
                  userName: "Sangeeta Rai",
                  userImage: "assets/images/user_image.png",
                  userLocation: "Mumbai"),
              buttonColor: Colors.black,
              text: 'View Wallet',
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  width: 500,
                  height: 200,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
