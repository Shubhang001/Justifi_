import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/api_test_page.dart';
import 'package:jusitfi_admin/presentation/screens/finished_page.dart';
import 'package:jusitfi_admin/presentation/screens/assignwork_lawyer_profile.dart';
import 'package:jusitfi_admin/presentation/screens/filterpage.dart';
import 'package:jusitfi_admin/presentation/screens/float_cases.dart';
import 'package:jusitfi_admin/presentation/screens/float_cases4.dart';
import 'package:jusitfi_admin/presentation/screens/floatcases2.dart';
import 'package:jusitfi_admin/presentation/screens/homepage.dart';
import 'package:jusitfi_admin/presentation/screens/login_screen.dart';
import 'package:jusitfi_admin/presentation/screens/more_page.dart';
import 'package:jusitfi_admin/presentation/screens/onboardingscreen.dart';
import 'package:jusitfi_admin/presentation/screens/signup_screen.dart';
import 'package:jusitfi_admin/presentation/screens/testScreen.dart';
import 'package:jusitfi_admin/presentation/screens/view_all.dart';
import 'package:jusitfi_admin/presentation/screens/schedule3.dart';
import 'package:jusitfi_admin/presentation/widgets/material_color_builder.dart';
import 'package:jusitfi_admin/presentation/widgets/show_review.dart';
import 'package:jusitfi_admin/testing.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';

import 'presentation/screens/floatcases5.dart';
import 'presentation/screens/mianpage.dart';

void main() {
  runApp(
      // DevicePreview(
      //   enabled: true,
      //   tools: [
      //     ...DevicePreview.defaultTools,
      //   ],
      //   builder: (context) => const MyApp(),
      // ));
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Justifi Admin',
      theme: ThemeData(
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Colors.transparent),
          primarySwatch: createMaterialColor(kobbuttonColor)),
      home: const MainPage(),
    );
  }
}
