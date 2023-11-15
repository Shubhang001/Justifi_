import 'package:flutter/material.dart';
import 'package:jusitfi_admin/data/models/notification.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';
import 'package:intl/intl.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  String formatDateTime(DateTime dateTime) {
    final formatter = DateFormat("d MMMM yyyy | hh:mm a");
    return formatter.format(dateTime);
  }

  List<NotificationModel> dummyNotifications = [
    NotificationModel(
      dateTime: DateTime(2023, 7, 1, 10, 30), // July 1st, 2023, 10:30 AM
      title: "250 Credited to Your Account",
      description:
          "We are pleased to inform you that 250 units have been credited to your account. This amount represents the cashback you earned from your recent purchases.",
    ),
    NotificationModel(
      dateTime: DateTime(2023, 7, 2, 15, 45), // July 2nd, 2023, 3:45 PM
      title: "Upcoming Maintenance",
      description:
          "We want to inform you that we will be conducting routine maintenance on our servers this weekend. The maintenance window is scheduled to start on Saturday, July 8th, at 11:00 PM and will last for approximately 4 hours.",
    ),
    NotificationModel(
      dateTime: DateTime(2023, 8, 15, 9, 0), // August 15, 2023, 9:00 AM
      title: "Happy Independence Day!",
      description:
          "On the occasion of Independence Day, we extend our warmest greetings to you and your loved ones. May this day be a reminder of the sacrifices made by our forefathers to secure our freedom and rights.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,

        // leading: GestureDetector(
        //   onTap: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => const ProfileScreen(),
        //       ),
        //     );
        //   },
        //   child: Image.asset(
        //     'assets/icons/profile_new.png',
        //     color: Colors.white,
        //     width: 38,
        //     height: 38,
        //   ),
        // ),
        title: Text(
          "Notifications",
          style: klocationLight,
        ),
      ),
      body: Column(
        children: [
          const Text("Notification"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: ListView.builder(
                      itemCount: dummyNotifications.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    formatDateTime(
                                        dummyNotifications[index].dateTime),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                      radius: 20,
                                      child:
                                          Icon(Icons.notifications_outlined)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dummyNotifications[index].title,
                                          style: kobTitle,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          dummyNotifications[index].description,
                                          style: kobDescription,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.black,
                            )
                          ],
                        );
                      })),
            ),
          ),
        ],
      ),
    );
  }
}
