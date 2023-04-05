import 'package:flutter/material.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';

class TimeBoxChip extends StatefulWidget {
  final List<String> timeSlots;
  final Function(String) onSelected;

  TimeBoxChip({required this.timeSlots, required this.onSelected});

  @override
  _TimeBoxChipState createState() => _TimeBoxChipState();
}

class _TimeBoxChipState extends State<TimeBoxChip> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.timeSlots.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onSelected(widget.timeSlots[index]);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? kSelectedColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all()),
                child: Center(
                  child: Text(
                    widget.timeSlots[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
