import 'package:flutter/material.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class CancelledAdvocateCardTable extends StatelessWidget {
  const CancelledAdvocateCardTable({
    super.key,
    required this.caseTitle,
    required this.courtType,
    required this.caseCategory,
    required this.caseSubCategory,
    required this.cancelledDate,
    required this.cancelledBy,
  });

  final String caseTitle;
  final String courtType;
  final String caseCategory;
  final String caseSubCategory;
  final String cancelledDate;
  final String cancelledBy;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Container(
        margin: const EdgeInsets.all(8),
        child: Table(
          defaultColumnWidth: FixedColumnWidth(140.0),
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
                  'Canceled Date',
                  style: tableTextNormal,
                )
              ]),
              Column(children: [
                Text(
                  cancelledDate.toString(),
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
          ],
        ),
      ),
    ]));
  }
}
