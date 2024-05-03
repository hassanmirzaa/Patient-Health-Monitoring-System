import 'package:flutter/material.dart';
import 'package:phms/Colors/colors.dart';
import 'package:phms/screens/starting_screens/signup.dart';

void showSignoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)
        )
      ),
      backgroundColor: AppColor.primaryColor,
      title: Text('Do you want to Signout?',
      style: TextStyle(
        color: AppColor.textWhiteColor
      ),),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.22,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.textWhiteColor, width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "No",
                        style: TextStyle(
                            color: AppColor.textWhiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    
                    // currentUser = null;
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.22,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.textWhiteColor, width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Yes",
                        style: TextStyle(
                            color: AppColor.textWhiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}