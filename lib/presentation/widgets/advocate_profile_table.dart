import 'package:flutter/material.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class AdvocateProfileTable extends StatelessWidget {
  const AdvocateProfileTable(
      {super.key,
      required this.caseTitle,
      required this.courtType,
      required this.caseCategory,
      required this.caseSubCategory});

  final String caseTitle;
  final String courtType;
  final String caseCategory;
  final String caseSubCategory;

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
          ],
        ),
      ),
    ]));
  }
}
