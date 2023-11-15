import 'package:flutter/material.dart';

class DropDownMenuButton extends StatefulWidget {
  const DropDownMenuButton({Key? key}) : super(key: key);

  @override
  State<DropDownMenuButton> createState() => _DropDownMenuButtonState();
}

class _DropDownMenuButtonState extends State<DropDownMenuButton> {
  @override
  void initState() {
    dropdownvalue = 'Item 1'; //or any other thing you want to set asdefault
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 100,

      decoration: BoxDecoration(
        color: Colors.white, //<-- SEE HERE
        borderRadius: BorderRadius.circular(16),
      ),
      child: CustomDropdownButton2(
        hint: "",
        value: dropdownvalue,
        dropdownItems: items,
        onChanged: (value) {
          setState(() {
            dropdownvalue = value!;
          });
        },
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        buttonWidth: MediaQuery.of(context).size.width * 0.3,
        dropdownWidth: MediaQuery.of(context).size.width * 0.3,
        buttonHeight: MediaQuery.of(context).size.width * 0.045,
      ),
    );
  }

  CustomDropdownButton2(
      {required String hint,
      required String value,
      required List<String> dropdownItems,
      required Null Function(dynamic value) onChanged,
      required Icon icon,
      required double buttonWidth,
      required double dropdownWidth,
      required double buttonHeight}) {}
}

String dropdownvalue = 'Item 1';

// List of items in our dropdown menu
var items = [
  'Item 1',
  'Item 2',
  'Item 3',
  'Item 4',
  'Item 5',
];
