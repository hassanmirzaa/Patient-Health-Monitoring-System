import 'package:flutter/material.dart';
import 'package:phms/Colors/colors.dart';
import 'package:phms/screens/main_screens/Awareness/awareness.dart';
import 'package:phms/screens/main_screens/Drawer/drawer.dart';
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
      drawer: CustomDrawer(currentPage: 'health_monitoring'),
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
