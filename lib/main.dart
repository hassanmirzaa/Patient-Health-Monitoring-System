import 'package:flutter/material.dart';
import 'package:phms/Colors/colors.dart';
import 'package:phms/screens/starting_screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          timePickerTheme: TimePickerThemeData(
              dialHandColor: Colors.red,
              dayPeriodColor: Colors.red,
              hourMinuteTextColor: Colors.black,
              dialTextColor: Colors.black,
              dialBackgroundColor: Colors.white,
              hourMinuteColor: Colors.white),
          appBarTheme: AppBarTheme(
              color: Colors.white,
              foregroundColor: Colors.white,
              centerTitle: true),
          drawerTheme: DrawerThemeData(
            backgroundColor: AppColor.primaryColor,
          )),
    );
  }
}
