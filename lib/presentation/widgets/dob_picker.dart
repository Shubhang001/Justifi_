import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/constants/textstyles.dart';

class DOBPicker extends StatefulWidget {
  @override
  _DOBPickerState createState() => _DOBPickerState();
}

class _DOBPickerState extends State<DOBPicker> {
  DateTime? _selectedDate;
  TextEditingController? _textEditingController;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _textEditingController = TextEditingController();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate!,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _textEditingController!.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: _textEditingController,
        readOnly: true,
        onTap: () => _selectDate(context),
        style: kTextFieldValueDOB,
        decoration: InputDecoration(
            filled: false,
            fillColor: Colors.white,
            suffixIcon: Icon(Icons.calendar_today),
            prefix: SizedBox(
              width: 5,
            )),
      ),
    );
  }
}
