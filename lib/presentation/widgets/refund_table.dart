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
    return Center(
        child: Column(children: <Widget>[
      Container(
        margin: const EdgeInsets.all(8),
        child: Table(
          defaultColumnWidth: FixedColumnWidth(100.0),
          border: TableBorder.all(
              color: Colors.white,
              style: BorderStyle.solid,
              borderRadius: BorderRadius.circular(5),
              width: 2),
          children: [
            TableRow(children: [
              Column(children: [Text('CaseTitle', style: tableTextBold)]),
              Column(
                  children: [Text(caseTitle.toString(), style: tableTextBold)]),
            ]),
            TableRow(children: [
              Column(children: [
                Text(
                  'Court Type',
                  style: tableTextNormal,
                )
              ]),
              Column(children: [
                Text(
                  courtType.toString(),
                  style: tableTextNormal,
                )
              ]),
            ]),
            TableRow(children: [
              Column(children: [
                Text(
                  'Case Category',
                  style: tableTextNormal,
                )
              ]),
              Column(children: [
                Text(
                  caseCategory.toString(),
                  style: tableTextNormal,
                )
              ]),
            ]),
            TableRow(children: [
              Column(children: [
                Text(
                  'Sub-case Category',
                  style: tableTextNormal,
                )
              ]),
              Column(children: [
                Text(
                  caseSubCategory.toString(),
                  style: tableTextNormal,
                )
              ]),
            ]),
            TableRow(children: [
              Column(children: [
                Text(
                  'Refund Date',
                  style: tableTextNormal,
                )
              ]),
              Column(children: [
                Text(
                  refundDate.toString() + " " + refundTime.toString(),
                  style: tableTextNormal,
                )
              ]),
            ]),
            TableRow(children: [
              Column(children: [
                Text(
                  'Canceled By',
                  style: tableTextNormal,
                )
              ]),
              Column(children: [
                Text(
                  cancelledBy.toString(),
                  style: tableTextNormal,
                )
              ]),
            ]),
            TableRow(children: [
              Column(children: [
                Text(
                  'Refund Amount',
                  style: tableTextNormal,
                )
              ]),
              Column(children: [
                Text(
                  refundAmount.toString() + "Rs",
                  style: tableTextNormal,
                )
              ]),
            ]),
            TableRow(children: [
              Column(children: [
                Text(
                  'Refund Status',
                  style: tableTextNormal,
                )
              ]),
              Column(children: [
                Text(
                  meetStatus.toString(),
                  style: tableTextNormal,
                )
              ]),
            ]),
          ],
        ),
      ),
    ]));
  }
}
