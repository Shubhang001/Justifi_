import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/big_button.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

import '../../utils/constants/colors.dart';

class RatingDialog extends StatefulWidget {
  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  double _rating = 0;
  String _review = '';

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
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
              child: Image.asset(
                'assets/images/advocate_img.png',
                fit: BoxFit.fill,
              ),
              width: 60,
              height: 50,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Priya Sharma',
              style: kCallName,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
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
            SizedBox(height: 30),
            Text(
              'Rate Your Experience',
              style: kCallName,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: _rating >= 1
                      ? Icon(
                          Icons.star,
                          size: 40,
                        )
                      : Icon(
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
                      ? Icon(
                          Icons.star,
                          size: 40,
                        )
                      : Icon(
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
                      ? Icon(
                          Icons.star,
                          size: 40,
                        )
                      : Icon(
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
                      ? Icon(
                          Icons.star,
                          size: 40,
                        )
                      : Icon(
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
                      ? Icon(
                          Icons.star,
                          size: 40,
                        )
                      : Icon(
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
            SizedBox(height: 30),
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
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
              onChanged: (value) {
                setState(() {
                  _review = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  child: Center(
                    child: Text(
                      'Submit',
                      style: kMainCategory,
                    ),
                  ),
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
