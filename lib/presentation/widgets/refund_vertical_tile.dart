import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/approval_pending_advocate_card.dart';
import 'package:jusitfi_admin/presentation/widgets/refund_card.dart';

class RefundVerticalTile extends StatelessWidget {
  const RefundVerticalTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: const [
                RefundCard(
                    name: "Priya Sharma",
                    image: "assets/images/advocate_img.png",
                    location: "Mumbai",
                    rating: 5,
                    date: "06 Oct 2022",
                    time: "5:00 pm",
                    duration: 60,
                    caseTitle: "ABC",
                    courtType: "High Court",
                    caseCategory: "xyz",
                    caseSubCategory: "xyz",
                    paidAmount: 700,
                    postingDate: "27th Nov, 2022",
                    refundDate: "20 Oct 2022",
                    refundAmount: "400",
                    refundTime: "9:30",
                    meetStatus: "Cancelled",
                    cancelledBy: "Client"),
                RefundCard(
                    name: "Priya Sharma",
                    image: "assets/images/advocate_img.png",
                    location: "Mumbai",
                    rating: 5,
                    date: "06 Oct 2022",
                    time: "5:00 pm",
                    duration: 60,
                    caseTitle: "ABC",
                    courtType: "High Court",
                    caseCategory: "xyz",
                    caseSubCategory: "xyz",
                    paidAmount: 700,
                    postingDate: "27th Nov, 2022",
                    refundDate: "20 Oct 2022",
                    refundAmount: "400",
                    refundTime: "9:30",
                    meetStatus: "Cancelled",
                    cancelledBy: "Client"),
                RefundCard(
                    name: "Priya Sharma",
                    image: "assets/images/advocate_img.png",
                    location: "Mumbai",
                    rating: 5,
                    date: "06 Oct 2022",
                    time: "5:00 pm",
                    duration: 60,
                    caseTitle: "ABC",
                    courtType: "High Court",
                    caseCategory: "xyz",
                    caseSubCategory: "xyz",
                    paidAmount: 700,
                    postingDate: "27th Nov, 2022",
                    refundDate: "20 Oct 2022",
                    refundAmount: "400",
                    refundTime: "9:30",
                    meetStatus: "Cancelled",
                    cancelledBy: "Client"),
              ],
            ),
          ),
        )
      ],
    );
  }
}
