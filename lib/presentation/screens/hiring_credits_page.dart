import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/add_credits_page.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';

class HiringCreditsPage extends StatefulWidget {
  const HiringCreditsPage({Key? key}) : super(key: key);

  @override
  State<HiringCreditsPage> createState() => _HiringCreditsPage();
}

class _HiringCreditsPage extends State<HiringCreditsPage> {
  TextEditingController _profileCreditsController =
      TextEditingController(text: "00123");
  TextEditingController _postCreditsController =
      TextEditingController(text: "00123");
  // int _selectedIndex = 0;
  // final List<Widget> _verticalTiles = <Widget>[
  //   const HiringPackageActiveVerticalTile(),
  //   const HiringPackageExpiredVerticalTile(),
  // ];

  // void _onDayTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: const Icon(
          //   Icons.arrow_back,
          //   color: Colors.white,
          //   size: 30,
          // ),
          title: Center(
            child: Text(
              "Hiring Credits",
              style: alegreyaW700S24White,
            ),
          ),
          backgroundColor: kPrimaryBlackColor,
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "Hiring Credits",
                      style: robotoW500S30Black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CreditButton(
                      title: 'Profile Credit',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _profileCreditsController.text,
                            style: inriaSerifW700S30Black,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AddCreditsPage(
                                          title: 'Profile Credit',
                                        )));
                              },
                              child: const AddButton(),
                            ),
                            Text(
                              "Add",
                              style: interW700S10Black,
                            )
                          ])
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const CreditButton(
                      title: 'Post Credit',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _postCreditsController.text,
                          style: inriaSerifW700S30Black,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AddCreditsPage(
                                        title: 'Post Credit',
                                      )));
                            },
                            child: const AddButton(),
                          ),
                          Text(
                            "Add",
                            style: interW700S10Black,
                          )
                        ])
                      ],
                    ),
                  ],
                ))));
  }
}

class CreditButton extends StatelessWidget {
  final String title;
  const CreditButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.black),
        child: Center(
            child: Text(
          title,
          style: poppinsW500S15White,
        )));
  }
}

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.black),
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 20,
          ),
        ));
  }
}
