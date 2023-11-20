import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jusitfi_admin/presentation/screens/mianpage.dart';
import 'package:jusitfi_admin/presentation/screens/splash_screen.dart';
import 'package:jusitfi_admin/presentation/widgets/constants.dart';
import 'package:jusitfi_admin/presentation/widgets/login_service.dart';
import 'package:jusitfi_admin/presentation/widgets/material_color_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final navigatorKey = GlobalKey<NavigatorState>();

  /// 2/5: set navigator key to ZegoUIKitPrebuiltCallInvitationService
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );
  });

  final prefs = await SharedPreferences.getInstance();
  final cacheUserID = prefs.get(cacheUserIDKey) as String? ?? '';
  if (cacheUserID.isNotEmpty) {
    currentUser.id = cacheUserID;
    currentUser.name = 'user_$cacheUserID';
  }

  runApp(
      // DevicePreview(
      //   enabled: true,
      //   tools: [
      //     ...DevicePreview.defaultTools,
      //   ],
      //   builder: (context) => const MyApp(),
      // ));
      MyApp(navigatorKey: navigatorKey));
  await dotenv.load(fileName: "lib/.env");
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.navigatorKey,
  });
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoggedIn();
  }

  Future<void> _checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedToken = prefs.getString('token');
    setState(() {
      isLoggedIn = storedToken != null;
    });
    if (currentUser.id.isNotEmpty) {
      onUserLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Justifi Admin',
        theme: ThemeData(
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.transparent,
          ),
          primarySwatch: createMaterialColor(kobbuttonColor),
        ),
        // Check if the user is logged in, and navigate accordingly
        initialRoute: isLoggedIn ? '/main' : '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/main': (context) => const MainPage(),
        },
        builder: (BuildContext context, Widget? child) {
          return Stack(
            children: [
              child!,

              /// support minimizing
              ZegoUIKitPrebuiltCallMiniOverlayPage(
                contextQuery: () {
                  return widget.navigatorKey.currentState!.context;
                },
              ),
            ],
          );
        });
  }
}
