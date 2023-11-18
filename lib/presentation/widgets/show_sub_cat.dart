import 'dart:ui';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/homepage.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';

Future<Object?> ShowSubCat(BuildContext context, List<dynamic> subCatItems) {
  List<dynamic> selectedCats = subCatItems;
  return showGeneralDialog(
    barrierDismissible: false,
    barrierLabel: '',
    barrierColor: Colors.black38,
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (ctx, anim1, anim2) => AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(22.0))),
      backgroundColor: Colors.black,
      title: Row(
        children: [
          const Expanded(child: Text('')),
          Text(
            'Sub Categoies',
            style: kpageTitle,
          ),
          const SizedBox(
            width: 30,
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.cancel_outlined,
                color: Colors.red,
              ))
        ],
      ),
      content: StatefulBuilder(builder: (context, StateSetter setState) {
        return SizedBox(
          width: 300,
          height: 500,
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: GridView.builder(
                    itemCount: selectedCats.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (110 / 40),
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            /* if (selectedCats.contains(index)) {
                                    selectedCats.remove(index);
                                  } else {
                                    selectedCats.add(index);
                                  }*/
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: selectedCats.contains(index)
                                  ? Colors.white
                                  : kSearchBarColor,
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Text(
                              selectedCats[index]['name'],
                              textAlign: TextAlign.center,
                              style: ksubCatText,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 60,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const HomePage()));
                },
                child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: Text('View Advocate')),
                    )),
              )
            ],
          ),
        );
      }),
    ),
    transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
      filter:
          ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
      child: FadeTransition(
        opacity: anim1,
        child: child,
      ),
    ),
    context: context,
  );
}
