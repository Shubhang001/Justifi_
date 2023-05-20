import 'package:flutter/material.dart';

AppBar buildprofileNav(BuildContext context) {
  return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      actions: const [Icon(Icons.notifications)],
      leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context, true) // dialog returns true
          ),
      centerTitle: true,
      title: const ListTile(
        iconColor: Colors.white,
        leading: Icon(Icons.location_on),
        title: Text(
          "Mumbai",
          style: TextStyle(color: Colors.white),
        ),
      ));
}
