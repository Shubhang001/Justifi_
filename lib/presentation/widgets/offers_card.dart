import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/add_credits_page.dart';
import 'package:jusitfi_admin/utils/constants/coupon_code_constants.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class OffersCard extends StatefulWidget {
  final String code;
  final String title;
  const OffersCard({
    Key? key,
    required this.code,
    required this.title,
  }) : super(key: key);

  @override
  State<OffersCard> createState() => _OffersCardState();
}

class _OffersCardState extends State<OffersCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        // height: 200,
        //rwidth: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.black),
        child: GestureDetector(
          onTap: () {
            setState(() {
              CouponCodeConstant.isCouponCardTapped = true;
              CouponCodeConstant.couponCodeApplied = true;
            });
            SnackBar snackBar = const SnackBar(
              duration: Duration(seconds: 2),
              content: Text('Coupon applied successfully. Make payment now.'),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              snackBar,
            );
            AddCreditsPage(title: widget.title).code = widget.code;
            Navigator.of(context).pop(CouponCodeConstant.couponCodeApplied);
            //MaterialPageRoute(builder: (context) => widget.page));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const SizedBox(
              //   height: 20,
              // ),
              Image.asset("assets/images/advocate_tie.png"),
              Text(
                "One Time Hiring",
                style: poppinsW700S14White,
              ),
              Text(
                "15% Discount",
                style: poppinsW600S14White,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Code",
                style: poppinsW600S14White,
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              Text(
                widget.code.toString(),
                style: poppinsW500S15White,
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ));
  }
}
