import 'package:flutter/material.dart';

class DialogService {
  static showNotAvailableDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          title: const Text('Service Not Available'),
          content: const Text('Sorry, the service is not available yet.'),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class DialogService1 extends StatelessWidget {
  const DialogService1({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogService.showNotAvailableDialog(context);
  }
}
