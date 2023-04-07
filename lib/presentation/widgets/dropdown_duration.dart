import 'package:flutter/material.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class DurationSelector extends StatefulWidget {
  const DurationSelector({super.key, required this.onSelected});

  @override
  _DurationSelectorState createState() => _DurationSelectorState();

  final Function(int) onSelected;
}

class _DurationSelectorState extends State<DurationSelector> {
  int _selectedMinutes = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<int>(
          value: _selectedMinutes,
          items: [
            DropdownMenuItem(
              value: 5,
              child: Text(
                "5 mins",
                style: kFilterValue,
              ),
            ),
            const DropdownMenuItem(
              value: 10,
              child: Text("10 mins"),
            ),
            const DropdownMenuItem(
              value: 15,
              child: Text("15 mins"),
            ),
            const DropdownMenuItem(
              value: 20,
              child: Text("20 mins"),
            ),
          ],
          onChanged: (value) {
            setState(() {
              _selectedMinutes = value!;
              widget.onSelected(_selectedMinutes);
            });
          },
        ),
      ],
    );
  }
}
