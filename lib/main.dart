import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:mubwara/provider/auth_provider.dart';

import 'package:mubwara/views/page/main_page/main_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 플러터프레임워크가 준비가 될때까지 기다림
  await initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );

  // Future<void> loginCheck() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? JwtToken = prefs.getString("jwtToken");
  //   String? role = prefs.getString("role");
  //   Ref? ref;
  //
  //   if (JwtToken != null) {
  //     ref?.read(authProvider).initProvider(JwtToken: JwtToken, Role: role);
  //   }
  //   print(JwtToken);
  // }
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
