import 'package:flutter/material.dart';

class SortOptionsBottomSheet extends StatelessWidget {
  final List<String> sortOptions;
  final Function(String) onSortOptionSelected;

  const SortOptionsBottomSheet({
    super.key,
    required this.sortOptions,
    required this.onSortOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45))),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Sort By',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sortOptions.length,
              itemBuilder: (BuildContext context, int index) {
                String sortOption = sortOptions[index];
                return TextButton(
                  child: Text(
                    sortOption,
                  ),
                  onPressed: () {
                    onSortOptionSelected(sortOption);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
