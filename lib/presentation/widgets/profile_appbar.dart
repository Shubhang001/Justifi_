import 'package:flutter/material.dart';

class ProfileNavBar extends StatelessWidget {
  const ProfileNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            Row(
              children: const [
                Icon(
                  Icons.pin_drop_rounded,
                  size: 35,
                  color: Colors.white,
                ),
                Text(
                  "Mumbai",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            const Icon(
              Icons.notifications,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
