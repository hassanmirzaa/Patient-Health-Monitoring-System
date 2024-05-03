import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phms/Colors/colors.dart';
import 'package:phms/screens/main_screens/Awareness/awareness.dart';
import 'package:phms/screens/main_screens/Drawer/drawer.dart';
import 'package:phms/screens/main_screens/Health%20Monitoring/health_monitoring.dart';
import 'package:phms/screens/main_screens/Reports/reports.dart';
import 'package:phms/screens/main_screens/Tasks/tasks.dart';
import 'package:phms/screens/logout.dart';
import 'package:phms/screens/main_screens/Medications/medications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DahsboardScreen extends StatefulWidget {
  const DahsboardScreen({super.key});

  @override
  State<DahsboardScreen> createState() => _DahsboardScreenState();
}

class _DahsboardScreenState extends State<DahsboardScreen> {
  String name = '',
      lastName = '',
      age = '',
      gender = '',
      blood = '',
      description = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    name = sp.getString('name') ?? "";
    lastName = sp.getString('lastName') ?? "";
    age = sp.getString('age') ?? "";
    gender = sp.getString('gender') ?? "";
    blood = sp.getString('blood') ?? "";
    description = sp.getString('description') ?? "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: CustomDrawer(currentPage: 'dashboard'),
      appBar: AppBar(
        title: Text("Patient's Dashboard"),
        backgroundColor: AppColor.primaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(children: [
                  Text(
                    "Name : ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    name.toString() + " " + lastName.toString(),
                    style: TextStyle(fontSize: 25),
                  )
                ]),
                SizedBox(
                  height: Height * 0.03,
                ),
                Wrap(children: [
                  Text(
                    "Age : ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    age.toString(),
                    style: TextStyle(fontSize: 25),
                  ),
                ]),
                SizedBox(
                  height: Height * 0.03,
                ),
                Wrap(children: [
                  Text(
                    "Gender : ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    gender.toString(),
                    style: TextStyle(fontSize: 25),
                  ),
                ]),
                SizedBox(
                  height: Height * 0.03,
                ),
                Wrap(children: [
                  Text(
                    "Blood Group : ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    blood.toString(),
                    style: TextStyle(fontSize: 25),
                  ),
                ]),
                SizedBox(
                  height: Height * 0.03,
                ),
                Wrap(children: [
                  Text(
                    "Description : ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description.toString(),
                    style: TextStyle(fontSize: 25),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
