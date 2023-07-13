import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../utils/constants/colors.dart';
import '../screens/profile_page.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    //TextEditingController controller=TextEditingController();
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: kprimaryTextColor,
                  borderRadius: BorderRadius.circular(7)),
              height: 47,
              width: 47,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
                child: const Icon(Icons.person),
              ),
            ),
            const SizedBox(
              width: 75,
            ),
            Expanded(
              child: Row(
                children: [
                  const Icon(
                    Icons.pin_drop_rounded,
                    size: 35,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: TypeAheadField(
                      animationStart: 0,
                      animationDuration: Duration.zero,
                      textFieldConfiguration: TextFieldConfiguration(
                          //onChanged: ,

                          controller: searchTextController,
                          textAlign: TextAlign.start,
                          autofocus: false,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          decoration: const InputDecoration(
                            focusColor: Colors.white,
                            hintText: "Mumbai",
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 24),
                            enabledBorder: InputBorder.none,
                            disabledBorder: OutlineInputBorder(),
                          )),
                      suggestionsBoxDecoration:
                          SuggestionsBoxDecoration(color: Colors.lightBlue[50]),
                      suggestionsCallback: (pattern) {
                        List<String> matches = <String>[];
                        matches.addAll(suggestons);

                        matches.retainWhere((s) {
                          return s
                              .toLowerCase()
                              .contains(pattern.toLowerCase());
                        });
                        return matches;
                      },
                      itemBuilder: (context, sone) {
                        return Card(
                            child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(sone.toString()),
                        ));
                      },
                      onSuggestionSelected: (suggestion) {
                        //
                        searchTextController.text = suggestion.toString();
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            const Icon(
              Icons.notifications,
              size: 30,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}

TextEditingController searchTextController = TextEditingController();

List<String> suggestons = [
  "Maharastra",
  "Mangalore",
  "Malappuram",
  "Maharastra",
  "Mangalore",
  "Malappuram",
];
