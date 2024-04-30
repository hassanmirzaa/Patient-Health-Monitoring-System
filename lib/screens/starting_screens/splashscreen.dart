import 'dart:async';
import 'package:flutter/material.dart';
import 'package:phms/screens/main_screens/dashboard.dart';
import 'package:phms/screens/starting_screens/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // After 5 seconds, navigate to the next screen
    isLogin();
  }

  void isLogin()async{
    SharedPreferences sp =await SharedPreferences.getInstance();
    bool isLogin =sp.getBool("isLogin") ?? false;

if(isLogin){
Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DahsboardScreen()),
      );
    });
}
else{
  Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignUp()),
      );
    });
}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Image.asset(
            'assets/images/sample.jpg',
            width: double.infinity,
          height: double.infinity,
            fit: BoxFit.cover,
            ),
          Center(
          child: Text(
            "PHMS",
            style: TextStyle(fontSize: 120.0,color: Colors.red.shade500),
          ),
        ),] 
      ),
    );
  }
}