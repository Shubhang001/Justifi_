//import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:jusitfi_admin/presentation/widgets/home_nav_bar.dart';
import '../../utils/constants/colors.dart';
//import '../../utils/constants/textstyles.dart';
import 'package:dropdown_search/dropdown_search.dart';
//import 'package:searchfield/searchfield.dart';

class SearchBarUpdated extends StatefulWidget {
  const SearchBarUpdated(
      {super.key, required this.backgroundColor, required this.color});
  final Color backgroundColor;
  final Color color;

  @override
  State<SearchBarUpdated> createState() => _SearchBarUpdatedState();
}

class _SearchBarUpdatedState extends State<SearchBarUpdated> {
  List<String> suggestions = [];
  List<String> name = [
    'Priya Sharma',
    'Sakshi',
    'Ajay kumar',
    'xyz',
    'abc',
    'pqr'
  ];
  List<String> category = [
    'Criminal',
    'Adoption',
    'Cybercrime',
    'Coporate',
    'Private',
    'Murder'
  ];
  List<String> subcategory = ['Priya Sharma', 'Sakshi', 'Ajay kumar'];

  int value1 = 0;

  int suggestionsCount = 12;

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
          /*Expanded(
            
            child: DropdownSearch<String>(
              onChanged: (value) => setState(() {
                selectedItem = items[value1];
                labelText = selectedItem;
              }),
              onSaved: (value) => setState(() {
                selectedItem = items[value1];
                labelText = selectedItem;
              }),
              popupProps: PopupProps.menu(
                showSearchBox: true,
                isFilterOnline: true,
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
                  labelText: labelText,
                  labelStyle: TextStyle(
                    color: kmainButtonColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                  ),
                ),
              ),
              selectedItem: selectedItem,
            ),
            
          ),*/
          SizedBox(
            width: 140,
            child: TypeAheadField(
              animationStart: 0,
              animationDuration: Duration.zero,
              textFieldConfiguration: TextFieldConfiguration(
                  //onChanged: ,

                  controller: searchTextController,
                  textAlign: TextAlign.start,
                  autofocus: false,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  decoration: const InputDecoration(
                    focusColor: Colors.white,
                    hintText: "Search...",
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                    enabledBorder: InputBorder.none,
                    disabledBorder: OutlineInputBorder(),
                  )),
              suggestionsBoxDecoration:
                  SuggestionsBoxDecoration(color: Colors.lightBlue[50]),
              suggestionsCallback: (pattern) {
                List<String> matches = <String>[];
                matches.addAll(suggestions);

                matches.retainWhere((s) {
                  return s.toLowerCase().contains(pattern.toLowerCase());
                });
                return matches;
              },
              itemBuilder: (context, sone) {
                return Card(
                    child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(sone.toString()),
                ));
              },
              onSuggestionSelected: (suggestion) {
                //
                searchTextController.text = suggestion.toString();
              },
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
                  suggestions = name;
                  setState(() {
                    value1 = newValue;
                  });
                }
                if (newValue == 2) {
                  setState(() {
                    value1 = newValue;
                  });
                  suggestions = category;
                }
                if (newValue == 3) {
                  suggestions = subcategory;
                  setState(() {
                    value1 = newValue;
                  });
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
