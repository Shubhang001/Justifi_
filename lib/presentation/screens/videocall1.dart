/*
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';




/// 1.1.1: define a navigator key
final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// 1.1.2: set navigator key to ZegoUIKitPrebuiltCallInvitationService
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

  runApp(const MyApp());
}

final GoRouter routerConfig = GoRouter(
  /// 1.1.3: register the navigator key to GoRouter
  navigatorKey: navigatorKey,
  initialLocation: currentUser.id.isEmpty ? PageRouteNames.login : PageRouteNames.home,
  routes: <RouteBase>[
    GoRoute(
      path: PageRouteNames.home,
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
    GoRoute(
      path: PageRouteNames.login,
      builder: (BuildContext context, GoRouterState state) => const LoginPage(),
    ),
  ],
);


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    if (/*the user of the app is logged in*/) {
      onUserLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerConfig,
      
    );
  }
}

/// on App's user login
void onUserLogin() {
  /// 1.2.1. initialized ZegoUIKitPrebuiltCallInvitationService
  /// when app's user is logged in or re-logged in
  /// We recommend calling this method as soon as the user logs in to your app.
  ZegoUIKitPrebuiltCallInvitationService().init(
    appID: yourAppID /*input your AppID*/,
    appSign: yourAppSign /*input your AppSign*/,
    userID: currentUser.id,
    userName: currentUser.name,
    plugins: [ZegoUIKitSignalingPlugin()],
  );
}

/// on App's user logout
void onUserLogout() {
  /// 1.2.2. de-initialization ZegoUIKitPrebuiltCallInvitationService
  /// when app's user is logged out
  ZegoUIKitPrebuiltCallInvitationService().uninit();
}*/