import 'package:flutter/material.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class AssignWorkLawyerProfile extends StatefulWidget {
  const AssignWorkLawyerProfile({super.key});

  @override
  State<AssignWorkLawyerProfile> createState() =>
      _AssignWorkLawyerProfileState();
}

class _AssignWorkLawyerProfileState extends State<AssignWorkLawyerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Lawyer Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.keyboard_option_key_sharp),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                  bottomRight: Radius.circular(150),
                )),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
          ),
          Positioned(
            left: 20,
            top: 30,
            child: Container(
                color: Colors.white,
                width: 120,
                height: 120,
                child: Image.asset(
                  'assets/images/advocate_img.png',
                  fit: BoxFit.cover,
                )),
          ),
          Positioned(
            left: 150,
            top: 40,
            child: Text(
              'Priya Sharma',
              style: kpageTitle,
            ),
          ),
          Positioned(
            left: 170,
            top: 70,
            child: Text(
              'mumbai',
              style: kpageTitle,
            ),
          ),
          Row(
            children: const [Text('')],
          )
        ],
      ),
    );
  }
}
