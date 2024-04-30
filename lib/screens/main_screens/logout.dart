import 'package:flutter/material.dart';
import 'package:phms/screens/starting_screens/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  
                  sp.clear();

                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));

                  

                  
                }, child: Text("Logout / Switch user")),
      ),
    );
  }
}