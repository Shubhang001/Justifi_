import 'dart:ui';
import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';


Future<Object?> ShowSubCat(BuildContext context,List subCatItems) {
    return showGeneralDialog(
                        barrierDismissible: false,
                        barrierLabel: '',
                        barrierColor: Colors.black38,
                        transitionDuration: const Duration(milliseconds: 500),
                        pageBuilder: (ctx, anim1, anim2) => AlertDialog(
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Save',
                                  style: kNavLabel,
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Reset',
                                  style: kNavLabel,
                                ))
                          ],
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(22.0))),
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
                          content: SizedBox(
                            width: 300,
                            height: 300,
                            child: GridView.builder(
                                itemCount: subCatItems.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: (110 / 40),
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: kSearchBarColor,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Center(
                                        child: Text(
                                          subCatItems[index],
                                          textAlign: TextAlign.center,
                                          style: ksubCatText,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        transitionBuilder: (ctx, anim1, anim2, child) =>
                            BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 4 * anim1.value,
                              sigmaY: 4 * anim1.value),
                          child: FadeTransition(
                            child: child,
                            opacity: anim1,
                          ),
                        ),
                        context: context,
                      );
  }