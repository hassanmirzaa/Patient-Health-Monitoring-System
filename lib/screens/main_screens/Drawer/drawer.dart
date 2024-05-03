import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phms/Colors/colors.dart';
import 'package:phms/screens/dashboard.dart';
import 'package:phms/screens/main_screens/Awareness/awareness.dart';
import 'package:phms/screens/main_screens/Health%20Monitoring/health_monitoring.dart';
import 'package:phms/screens/main_screens/Reports/reports.dart';
import 'package:phms/screens/main_screens/Tasks/tasks.dart';
import 'package:phms/screens/logout.dart';
import 'package:phms/screens/main_screens/Medications/medications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatelessWidget {
  final String currentPage;

  const CustomDrawer({Key? key, required this.currentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/images/phms.logo.png'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Divider(
            endIndent: 40,
            indent: 40,
            color: AppColor.textWhiteColor,
          ),
          ListTile(
            title: Text(
              "Patient's Dashboard",
              style: TextStyle(
                color:/* currentPage == 'dashboard'
                    ? AppColor.primaryColor
                    :*/ AppColor.textWhiteColor,
              ),
            ),
            onTap: () {
              if (currentPage != 'dashboard') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DahsboardScreen()),
                );
              }
            },
          ),
          ListTile(
            title: Text(
              'Health Monitoring',
              style: TextStyle(
                color: /*currentPage == 'health_monitoring'
                    ? AppColor.primaryColor
                    :*/ AppColor.textWhiteColor,
              ),
            ),
            onTap: () {
              if (currentPage != 'health_monitoring') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HealthMonitoringScreen()),
                );
              }
            },
          ),
          ListTile(
            title: Text(
              'Medications',
              style: TextStyle(
                color:/* currentPage == 'medications'
                    ? AppColor.primaryColor
                    : */AppColor.textWhiteColor,
              ),
            ),
            onTap: () {
              if (currentPage != 'medications') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MedicationsScreen()),
                );
              }
            },
          ),
          ListTile(
            title: Text(
              'Tasks',
              style: TextStyle(
                color: /*currentPage == 'tasks'
                    ? AppColor.primaryColor
                    :*/ AppColor.textWhiteColor,
              ),
            ),
            onTap: () {
              if (currentPage != 'tasks') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => TasksScreen()),
                );
              }
            },
          ),
          ListTile(
            title: Text(
              'Awarenesses',
              style: TextStyle(
                color: /*currentPage == 'awarenesses'
                    ? AppColor.primaryColor
                    : */AppColor.textWhiteColor,
              ),
            ),
            onTap: () {
              if (currentPage != 'awarenesses') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AwarenessesScreen()),
                );
              }
            },
          ),
          ListTile(
            title: Text(
              'Reports',
              style: TextStyle(
                color: /*currentPage == 'reports'
                    ? AppColor.primaryColor
                    : */AppColor.textWhiteColor,
              ),
            ),
            onTap: () {
              if (currentPage != 'reports') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ReportsScreen()),
                );
              }
            },
          ),
          Spacer(),
          ListTile(
            title: Text(
              'Add or Switch Patient',
              style: TextStyle(color: AppColor.textWhiteColor),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Logout()),
              );
            },
          ),
        ],
      ),
    );
  }
}
