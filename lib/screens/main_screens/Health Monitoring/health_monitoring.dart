import 'package:flutter/material.dart';
import 'package:phms/Colors/colors.dart';
import 'package:phms/screens/main_screens/Awareness/awareness.dart';
import 'package:phms/screens/main_screens/Reports/reports.dart';
import 'package:phms/screens/main_screens/Tasks/tasks.dart';
import 'package:phms/screens/main_screens/Medications/medications.dart';
import 'package:phms/screens/dashboard.dart';
import 'package:phms/screens/logout.dart';

class HealthMonitoringScreen extends StatefulWidget {
  const HealthMonitoringScreen({super.key});

  @override
  State<HealthMonitoringScreen> createState() => _HealthMonitoringScreenState();
}

class _HealthMonitoringScreenState extends State<HealthMonitoringScreen> {
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
               /* Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HealthMonitoringScreen(),
                    ));*/
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReportsScreen(),
                    ));
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
        title: Text("Health Monitoring"),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: Width * 0.6,
            height: Height * 0.1,
            child: Center(
              child: Text(
                "Connect To Hub",
                style: TextStyle(fontSize: 18, color: AppColor.textWhiteColor),
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
