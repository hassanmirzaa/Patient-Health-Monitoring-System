import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phms/Colors/colors.dart';

import 'package:phms/screens/main_screens/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
String dropdownValue = 'Male';
String bloodGroupValue = 'A+';
final firstnameController = TextEditingController();
final lastnameController = TextEditingController();
final ageController = TextEditingController();
final descriptionController = TextEditingController();

   @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    final Height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Patient's Details",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: Height*0.02,),
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: firstnameController,
                        //autofocus: true,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: "First Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(height: Height*0.02,),


                      TextFormField(
                        controller: lastnameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: "Last Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(height: Height*0.02,),


                      TextFormField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Age",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(height: Height*0.02,),


                      InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                          contentPadding: const EdgeInsets.all(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropdownValue,
                            style: TextStyle(color: Colors.black),
                            icon: Icon(Icons.arrow_drop_down_sharp),
                            items: [
                              DropdownMenuItem(
                                child: Text("Male"),
                                value: "Male",
                              ),
                              DropdownMenuItem(
                                child: Text("Female"),
                                value: "Female",
                              ),
                              DropdownMenuItem(
                                child: Text("Other"),
                                value: "Other",
                              ),
                            ],
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                  SizedBox(height: Height*0.02,),
                      InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                          contentPadding: const EdgeInsets.all(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(

                            isExpanded: true,
                            value: bloodGroupValue,
                            style: TextStyle(color: Colors.black),
                            icon: Icon(Icons.arrow_drop_down_sharp),
                            items: [
                              DropdownMenuItem(
                                child: Text("A+"),
                                value: "A+",
                              ),
                              DropdownMenuItem(
                                child: Text("A-"),
                                value: "A-",
                              ),
                              DropdownMenuItem(
                                child: Text("B+"),
                                value: "B+",
                              ),
                               DropdownMenuItem(
                                child: Text("B-"),
                                value: "B-",
                              ),
                              DropdownMenuItem(
                                child: Text("AB+"),
                                value: "AB+",
                              ),
                              DropdownMenuItem(
                                child: Text("AB-"),
                                value: "AB-",
                              ),
                              DropdownMenuItem(
                                child: Text("O+"),
                                value: "O+",
                              ),
                              DropdownMenuItem(
                                child: Text("O-"),
                                value: "O-",
                              ),
                            ],
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  bloodGroupValue = newValue;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: Height*0.02,),


                      TextFormField(
                        controller: descriptionController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: "Discription",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                  
                  
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async{
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('name', firstnameController.text.toString());
                  sp.setString('lastName', lastnameController.text.toString());
                  sp.setString("age", ageController.text.toString());
                  sp.setString("gender", dropdownValue.toString());
                  sp.setString("blood", bloodGroupValue.toString());
                  sp.setString("description", descriptionController.text.toString());
                  sp.setBool("isLogin", true);

                  Navigator.push(context, MaterialPageRoute(builder: (context) => DahsboardScreen(),));

                  

                  
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColor.primaryColor,
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
     ),
);
}
Future <void> infoo() async{

}
}