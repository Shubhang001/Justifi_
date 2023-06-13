import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/homepage.dart';
import 'package:jusitfi_admin/presentation/widgets/big_button.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  double startval1 = 1, endval1 = 2;

  int _selectedRadioValue = 1;

  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;

  // radio button functions

  void _handleRadioValueChanged(int? value) {
    setState(() {
      _selectedRadioValue = value!;
    });
  }

// check box functions

  void _handleCheckbox1ValueChanged(bool? value) {
    setState(() {
      _isChecked1 = value!;
    });
  }

  void _handleCheckbox2ValueChanged(bool? value) {
    setState(() {
      _isChecked2 = value!;
    });
  }

  void _handleCheckbox3ValueChanged(bool? value) {
    setState(() {
      _isChecked3 = value!;
    });
  }

  void _handleCheckbox4ValueChanged(bool? value) {
    setState(() {
      _isChecked4 = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Filters'),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Clear All',
                style: ksearch,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Rating',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              RangeSlider(
                min: 1,
                max: 5,
                divisions: 8, //slide interval
                labels: RangeLabels("Rating - $startval1", "Rating - $endval1"),
                values: RangeValues(startval1, endval1),
                onChanged: (RangeValues value) {
                  setState(() {
                    startval1 = value.start;
                    endval1 = value.end;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              Text('Experience', style: kFilterTitle),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: _selectedRadioValue,
                          onChanged: _handleRadioValueChanged,
                        ),
                        Text(
                          '1-3 years',
                          style: kFilterValue,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: _selectedRadioValue,
                          onChanged: _handleRadioValueChanged,
                        ),
                        Text(
                          '3-6 Years',
                          style: kFilterValue,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 3,
                          groupValue: _selectedRadioValue,
                          onChanged: _handleRadioValueChanged,
                        ),
                        Text(
                          '6 - 10 Years',
                          style: kFilterValue,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 4,
                          groupValue: _selectedRadioValue,
                          onChanged: _handleRadioValueChanged,
                        ),
                        Text(
                          '10 Years and above',
                          style: kFilterValue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Court Type',
                style: kFilterTitle,
              ),
              const SizedBox(height: 8.0),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  'Punjab High Court',
                  style: kFilterValue,
                ),
                value: _isChecked1,
                onChanged: _handleCheckbox1ValueChanged,
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  'Ludhiana  fast track court ',
                  style: kFilterValue,
                ),
                value: _isChecked2,
                onChanged: _handleCheckbox2ValueChanged,
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  'Ludhiana district court',
                  style: kFilterValue,
                ),
                value: _isChecked3,
                onChanged: _handleCheckbox3ValueChanged,
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  'Supreme court - Delhi',
                  style: kFilterValue,
                ),
                value: _isChecked4,
                onChanged: _handleCheckbox4ValueChanged,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: CustomButton(
                    removescreens: false,
                    nextPage: const HomePage(),
                    buttonColor: kobbuttonColor,
                    text: 'Apply'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
