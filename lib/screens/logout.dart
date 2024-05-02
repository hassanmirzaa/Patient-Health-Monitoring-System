import 'package:flutter/material.dart';
import 'package:phms/Colors/colors.dart';
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
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            
              color: AppColor.textWhiteColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              )),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () async {
            SharedPreferences sp = await SharedPreferences.getInstance();

            sp.clear();

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUp(),
                ));
          },
          child: Container(
            width: Width * 0.5,
            height: Height * 0.09,
            child: Center(
              child: Text(
                "Logout / Switch user",
                style: TextStyle(
                  color: AppColor.textWhiteColor,
                  fontSize: 18,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-4, 2),
                    blurRadius: 10,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
