import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/offers_card.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';

class OffersPage extends StatefulWidget {
  final String title;
  // final Widget page;
  const OffersPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<OffersPage> createState() => _OffersPage();
}

class _OffersPage extends State<OffersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Offers",
              style: alegreyaW700S24White,
            ),
          ),
          backgroundColor: kPrimaryBlackColor,
        ),
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Apply your preferred code with a simple tap",
                        style: poppinsW600S16Black,
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            child: Image.asset(
                              "assets/icons/offers_black.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            "Offers",
                            style: alegreyaW700S24Black,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OffersCard(
                            code: "23HT873",
                            title: widget.title,
                            // page: widget.page,
                          ),
                          OffersCard(
                            code: "23HT873",
                            title: widget.title,
                            // page: widget.page,
                          ),
                        ],
                      )
                    ]))));
  }
}
