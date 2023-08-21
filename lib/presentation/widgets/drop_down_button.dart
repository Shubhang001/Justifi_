import 'package:dropdown_button2/custom_dropdown_button2.dart';
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
