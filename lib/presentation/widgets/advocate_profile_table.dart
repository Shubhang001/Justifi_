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
              Padding(
                padding: const EdgeInsets.all(2),
                child: Text(' CaseTitle', style: tableTextBold),
              ),
              Padding(
                padding: const EdgeInsets.all(2),
                child: Text(caseTitle.toString(), style: tableTextBold),
              )
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(2),
                child: Text(
                  ' Court Type',
                  style: tableTextNormal,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    courtType.toString(),
                    style: tableTextNormal,
                  ))
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
                  ))
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
          ],
        ),
      ),
    ]));
  }
}
