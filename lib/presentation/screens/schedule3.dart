import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:jusitfi_admin/presentation/widgets/dropdown_duration.dart';
import 'package:jusitfi_admin/presentation/widgets/timeboxchip.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

import '../widgets/designed_line.dart';

class Schedule3 extends StatefulWidget {
  const Schedule3({Key? key}) : super(key: key);

  @override
  _Schedule3State createState() => _Schedule3State();
}

class _Schedule3State extends State<Schedule3> {
  DateTime _selectedDate = DateTime.now();
  String startTime = '10:00 AM';
  int duration = 5;
  String endtime = '';

  @override
  void initState() {
    endtime = endTime(startTime, duration);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.black,
                    ),
                    Text(
                      'Book Appoinment',
                      style: kFilterTitle,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black,
                  ),
                  height: 470,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: Text(
                          'Select Your Appoinment Date',
                          style: kpageTitle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Center(
                          child: Text(
                            DateFormat.yMMM().format(_selectedDate),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              'Mon',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Tue',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Wed',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Thu',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Fri',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Sat',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Sun',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 300.0,
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: DateTime.daysPerWeek * 6,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: DateTime.daysPerWeek,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              final day = DateTime(_selectedDate.year,
                                      _selectedDate.month, 1)
                                  .subtract(Duration(
                                      days: DateTime.daysPerWeek - index))
                                  .add(const Duration(days: 1));
                              final isSelectedDay =
                                  _selectedDate.year == day.year &&
                                      _selectedDate.month == day.month &&
                                      _selectedDate.day == day.day;
                              final textColor =
                                  isSelectedDay ? Colors.black : Colors.white;
                              return GestureDetector(
                                onTap: () =>
                                    setState(() => _selectedDate = day),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: isSelectedDay
                                        ? kSelectedColor
                                        : Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${day.day}',
                                      style: TextStyle(
                                        color: textColor,
                                        fontWeight: isSelectedDay
                                            ? FontWeight.bold
                                            : null,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Available Time',
                  style: kMainCategory,
                ),
                TimeBoxChip(
                  timeSlots: const [
                    '10:00 AM',
                    '11:00 AM',
                    '12:00 PM',
                    '1:00 PM'
                  ],
                  onSelected: (selectedTime) {
                    setState(() {
                      startTime = selectedTime;
                      endtime = endTime(startTime, duration);
                    });
                  },
                ),
                const DesignedLine(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        color: kSchedulebuttonColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Start time : $startTime',
                              style: kFilterValue,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        color: kSchedulebuttonColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Duration : ',
                              style: kFilterValue,
                            ),
                            DurationSelector(
                              onSelected: (_duration) {
                                print(duration);
                                setState(() {
                                  duration = _duration;
                                  endtime = endTime(startTime, _duration);
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        color: kSchedulebuttonColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'End time : ',
                              style: kFilterValue,
                            ),
                            Text(endtime)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        color: kSchedulebuttonColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Price : ',
                              style: kFilterValue,
                            ),
                            Text(
                              '₹200',
                              style: kFilterValue,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: kobdescriptionColor,
                  ),
                  child: Center(
                    child: Text(
                      'Schedule Session',
                      style: kpageTitle,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String endTime(String startTime, int duration) {
  DateTime dateTime = DateFormat("h:mm a").parse(startTime);
  DateTime newDateTime = dateTime.add(Duration(minutes: duration));
  String newTime =
      "${newDateTime.hour % 12}:${newDateTime.minute.toString().padLeft(2, '0')} ${newDateTime.hour < 12 ? 'AM' : 'PM'}";
  return newTime;
}
