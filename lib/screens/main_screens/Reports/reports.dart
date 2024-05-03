import 'package:flutter/material.dart';
import 'package:phms/Colors/colors.dart';
import 'package:phms/screens/dashboard.dart';
import 'package:phms/screens/main_screens/Awareness/awareness.dart';
import 'package:phms/screens/main_screens/Drawer/drawer.dart';
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
      drawer: CustomDrawer(currentPage: 'reports'),
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text("Reports"),
      ),
      //  body: ,
    );
  }
}
