import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';
import 'package:dropdown_search/dropdown_search.dart';

class SearchBarUpdated extends StatefulWidget {
  const SearchBarUpdated(
      {super.key, required this.backgroundColor, required this.color});
  final Color backgroundColor;
  final Color color;

  @override
  State<SearchBarUpdated> createState() => _SearchBarUpdatedState();
}

class _SearchBarUpdatedState extends State<SearchBarUpdated> {
  List<String> name = ['Priya Sharma', 'Sakshi', 'Ajay kumar'];
  List<String> category = ['Criminal', 'Adoption', 'Cybercrime'];
  List<String> subcategory = ['Priya Sharma', 'Sakshi', 'Ajay kumar'];
  List<String> items = [];

  final _searchController = TextEditingController();
  int value = 0;

  void nametoitems() {
    setState(() {
      items = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(8)),
      width: MediaQuery.of(context).size.width / 1.6,
      height: 50,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.search,
            size: 30,
            color: kmainButtonColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            /* child: TextField(
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search....',
                hintStyle: ksearch,
              ),
            ),*/
            /*child: DropDownField(
              icon: Icon(
                Icons.search,
                size: 30,
                color: kmainButtonColor,
              ),
              textStyle: TextStyle(
                color: kmainButtonColor,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
              controller: _searchController,
              hintText: "Search....",
              hintStyle: TextStyle(
                color: kmainButtonColor,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
              enabled: true,
              items: name,
            ),*/
            child: DropdownSearch<String>(
              popupProps: PopupProps.menu(
                showSelectedItems: true,
                disabledItemFn: (String s) => s.startsWith('I'),
              ),
              items: items,
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: kmainButtonColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                  labelText: "Search....",
                  labelStyle: TextStyle(
                    color: kmainButtonColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                  ),
                ),
              ),
              selectedItem: "Advocate",
            ),
          ),
          PopupMenuButton(
            child: Icon(
              Icons.arrow_drop_down,
              size: 30,
              color: kmainButtonColor,
            ),
            onSelected: (newValue) {
              // add this property
              setState(() {
                if (newValue == 1) {
                  value = newValue;
                  items = name;
                }
                if (newValue == 2) {
                  value = newValue;
                  items = category;
                }
                if (newValue == 3) {
                  items = subcategory;
                  value = newValue;
                }
              });
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 1,
                  padding: EdgeInsets.all(8),
                  child: Text("Name"),
                ),
                const PopupMenuItem(
                  value: 2,
                  padding: EdgeInsets.all(8),
                  child: Text("Category"),
                ),
                const PopupMenuItem(
                  value: 3,
                  padding: EdgeInsets.all(8),
                  child: Text("Sub-Category"),
                )
              ];
            },
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}
