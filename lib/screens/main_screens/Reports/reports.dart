import 'package:flutter/material.dart';
import 'package:phms/Colors/colors.dart';
import 'package:phms/screens/dashboard.dart';
import 'package:phms/screens/logout.dart';
import 'package:phms/screens/main_screens/Awareness/awareness.dart';
import 'package:phms/screens/main_screens/Health%20Monitoring/health_monitoring.dart';
import 'package:phms/screens/main_screens/Medications/medications.dart';
import 'package:phms/screens/main_screens/Tasks/tasks.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Height * 0.07,
            ),
            CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/phms.logo.png')),
            SizedBox(
              height: Height * 0.02,
            ),
            Divider(
              endIndent: 40,
              indent: 40,
              color: AppColor.textWhiteColor,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DahsboardScreen(),
                    ));
              },
              child: ListTile(
                title: Text(
                  "Patient's Dashboard",
                  style: TextStyle(color: AppColor.textWhiteColor),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HealthMonitoringScreen(),
                    ));
              },
              child: ListTile(
                title: Text(
                  'Health Monitoring',
                  style: TextStyle(color: AppColor.textWhiteColor),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicationsScreen(),
                    ));
              },
              child: ListTile(
                title: Text(
                  'Medications',
                  style: TextStyle(color: AppColor.textWhiteColor),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TasksScreen(),
                    ));
              },
              child: ListTile(
                title: Text(
                  'Tasks',
                  style: TextStyle(color: AppColor.textWhiteColor),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AwarenessesScreen(),
                    ));
              },
              child: ListTile(
                title: Text(
                  'Awarenesses',
                  style: TextStyle(color: AppColor.textWhiteColor),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
             /*   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReportsScreen(),
                    ));*/
              },
              child: ListTile(
                title: Text(
                  'Reports',
                  style: TextStyle(color: AppColor.textWhiteColor),
                ),
              ),
            ),
            SizedBox(
              height: Height * 0.17,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Logout(),
                    ));
              },
              child: ListTile(
                title: Text(
                  'Add or Switch Patient',
                  style: TextStyle(color: AppColor.textWhiteColor),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text("Reports"),
      ),
      //  body: ,
    );
  }
}
