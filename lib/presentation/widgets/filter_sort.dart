

import 'package:flutter/material.dart';

import 'package:jusitfi_admin/presentation/screens/filterpage.dart';
import 'package:jusitfi_admin/presentation/widgets/sort_options.dart';

import '../../utils/constants/colors.dart';

class FilterSort extends StatelessWidget {
  const FilterSort(
      {super.key, required this.bgColor, required this.dividerColor});

  final Color bgColor;
  final Color dividerColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SortOptionsBottomSheet(
                      sortOptions: [
                        'Price - high to low',
                        'Price - low to high',
                        'Rating - High to low',
                        'Rating - low to high',
                        'Experience - high to low',
                        'Experience - low to high'
                      ],
                      onSortOptionSelected: (String selectedOption) {
                        // Call your sorting function here with the selected sort option
                      },
                    );
                  },
                );
              },
              child: Icon(
                Icons.arrow_upward_rounded,
                color: dividerColor,
              ),
            ),
            VerticalDivider(
              color: dividerColor,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return FilterPage();
                }));
              },
              child: Icon(
                Icons.menu,
                color: dividerColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
