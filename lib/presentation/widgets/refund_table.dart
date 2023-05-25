import 'package:flutter/material.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class RefundTable extends StatelessWidget {
  const RefundTable({
    super.key,
    required this.caseTitle,
    required this.courtType,
    required this.caseCategory,
    required this.caseSubCategory,
    required this.refundDate,
    required this.refundTime,
    required this.cancelledBy,
    required this.refundAmount,
    required this.meetStatus,
  });

  final String caseTitle;
  final String courtType;
  final String caseCategory;
  final String caseSubCategory;
  final String refundDate;
  final String refundTime;
  final String cancelledBy;
  final String refundAmount;
  final String meetStatus;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
            child: Column(children: <Widget>[
      Container(
        margin: const EdgeInsets.all(8),
        child: Table(
          defaultColumnWidth: const FlexColumnWidth(),
          border: TableBorder.all(
              color: Colors.white,
              style: BorderStyle.solid,
              borderRadius: BorderRadius.circular(5),
              width: 2),
          children: [
            TableRow(children: [
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(' CaseTitle', style: tableTextBold)),
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(caseTitle.toString(), style: tableTextBold)),
            ]),
            TableRow(children: [
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    ' Court Type',
                    style: tableTextNormal,
                  )),
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    courtType.toString(),
                    style: tableTextNormal,
                  )),
            ]),
            TableRow(children: [
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    ' Case Category',
                    style: tableTextNormal,
                  )),
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    caseCategory.toString(),
                    style: tableTextNormal,
                  )),
            ]),
            TableRow(children: [
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    ' Sub-case Category',
                    style: tableTextNormal,
                  )),
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    caseSubCategory.toString(),
                    style: tableTextNormal,
                  )),
            ]),
            TableRow(children: [
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    ' Refund Date',
                    style: tableTextNormal,
                  )),
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    refundDate.toString() + " " + refundTime.toString(),
                    style: tableTextNormal,
                  )),
            ]),
            TableRow(children: [
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    ' Canceled By',
                    style: tableTextNormal,
                  )),
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    cancelledBy.toString(),
                    style: tableTextNormal,
                  )),
            ]),
            TableRow(children: [
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    ' Refund Amount',
                    style: tableTextNormal,
                  )),
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    refundAmount.toString() + "Rs",
                    style: tableTextNormal,
                  )),
            ]),
            TableRow(children: [
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    ' Refund Status',
                    style: tableTextNormal,
                  )),
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    meetStatus.toString(),
                    style: tableTextNormal,
                  )),
            ]),
          ],
        ),
      ),
    ])));
  }
}
