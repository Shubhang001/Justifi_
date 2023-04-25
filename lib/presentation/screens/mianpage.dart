import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/float_cases.dart';
import 'package:jusitfi_admin/presentation/screens/float_cases4.dart';
import 'package:jusitfi_admin/presentation/screens/homepage.dart';
import 'package:jusitfi_admin/presentation/screens/status_page.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FloatCases(),
    StatusPage(),
    const Text('Page 4'),
    const Text('Page 5'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        fixedColor: Colors.white,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedLabelStyle: kNavLabel,
        unselectedLabelStyle: kNavLabel,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/nav_icons/home.png',
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/nav_icons/floatcase.png'),
            label: 'Float Case',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/nav_icons/status.png'),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/nav_icons/wallet.png'),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/nav_icons/message.png'),
            label: 'Message',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
