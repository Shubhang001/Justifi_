import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/smallButton.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';
import '../screens/finished_page.dart';
import '../screens/homepage.dart';

class RatingDialog extends StatefulWidget {
  const RatingDialog({super.key});

  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  final double _rating = 0;
  final String _review = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(22.0))),
      backgroundColor: Colors.black,
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
              width: 60,
              height: 50,
              child: Image.asset(
                'assets/images/advocate_img.png',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Priya Sharma',
              style: kCallName,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.pin_drop_rounded,
                  size: 15,
                  color: Colors.white,
                ),
                Text(
                  "Mumbai",
                  style: kCallAns,
                )
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'Rate Your Experience',
              style: kCallName,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: _rating >= 1
                      ? const Icon(
                          Icons.star,
                          size: 40,
                        )
                      : const Icon(
                          Icons.star_border_outlined,
                          size: 40,
                        ),
                  color: _rating >= 1 ? Colors.orange : Colors.grey,
                  onPressed: () {
                    setState(() {
                      _rating = 1;
                    });
                  },
                ),
                IconButton(
                  icon: _rating >= 2
                      ? const Icon(
                          Icons.star,
                          size: 40,
                        )
                      : const Icon(
                          Icons.star_border_outlined,
                          size: 40,
                        ),
                  color: _rating >= 2 ? Colors.orange : Colors.grey,
                  onPressed: () {
                    setState(() {
                      _rating = 2;
                    });
                  },
                ),
                IconButton(
                  icon: _rating >= 3
                      ? const Icon(
                          Icons.star,
                          size: 40,
                        )
                      : const Icon(
                          Icons.star_border_outlined,
                          size: 40,
                        ),
                  color: _rating >= 3 ? Colors.orange : Colors.grey,
                  onPressed: () {
                    setState(() {
                      _rating = 3;
                    });
                  },
                ),
                IconButton(
                  icon: _rating >= 4
                      ? const Icon(
                          Icons.star,
                          size: 40,
                        )
                      : const Icon(
                          Icons.star_border_outlined,
                          size: 40,
                        ),
                  color: _rating >= 4 ? Colors.orange : Colors.grey,
                  onPressed: () {
                    setState(() {
                      _rating = 4;
                    });
                  },
                ),
                IconButton(
                  icon: _rating >= 5
                      ? const Icon(
                          Icons.star,
                          size: 40,
                        )
                      : const Icon(
                          Icons.star_border_outlined,
                          size: 40,
                        ),
                  color: _rating >= 5 ? Colors.orange : Colors.grey,
                  onPressed: () {
                    setState(() {
                      _rating = 5;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Write a review',
                style: kCallName,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                fillColor: Colors.white,
                border: const OutlineInputBorder(),
              ),
              maxLines: 5,
              onChanged: (value) {
                setState(() {
                  _review = value;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: smallButton(
                nextPage: FinishedPage(
                    text: 'Your Feedback has been submitted',
                    nextPage: const HomePage(),
                    nextPageName: 'Home'),
                name: 'Submit',
              ),
            )
          ],
        ),
      ),
    );
  }
}
