import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jusitfi_admin/presentation/screens/onboardingscreen.dart';
import 'package:jusitfi_admin/presentation/screens/splash_screen.dart';
import 'package:jusitfi_admin/presentation/widgets/material_color_builder.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';


void main() async {
  runApp(
      // DevicePreview(
      //   enabled: true,
      //   tools: [
      //     ...DevicePreview.defaultTools,
      //   ],
      //   builder: (context) => const MyApp(),
      // ));
      const MyApp());
  await dotenv.load(fileName: "lib/.env");
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
        home: const SplashScreen());
  }
}
