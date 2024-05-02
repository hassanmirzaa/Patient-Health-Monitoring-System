import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phms/Colors/colors.dart';
import 'package:phms/screens/main_screens/Awareness/awareness.dart';
import 'package:phms/screens/main_screens/Awareness/new_awareness.dart';
import 'package:phms/screens/main_screens/Health%20Monitoring/health_monitoring.dart';
import 'package:phms/screens/main_screens/Medications/medications.dart';
import 'package:phms/screens/main_screens/Reports/reports.dart';
import 'package:phms/screens/main_screens/Tasks/newTask.dart'; // Changed import
import 'package:phms/screens/main_screens/Tasks/tasks.dart'; // Changed import
import 'package:phms/screens/dashboard.dart';
import 'package:phms/screens/logout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AwarenessDetail {
  // Changed class name
  final String awarenessName; // Changed variable name
  final String awarenessDescription; // Changed variable name
  final int awarenessesPerDay; // Changed variable name

  AwarenessDetail({
    required this.awarenessName, // Changed variable name
    required this.awarenessDescription, // Changed variable name
    required this.awarenessesPerDay, // Changed variable name
  });
}

class AwarenessesScreen extends StatefulWidget {
  // Changed class name
  const AwarenessesScreen({Key? key}) : super(key: key); // Corrected super call

  @override
  State<AwarenessesScreen> createState() =>
      _AwarenessesScreenState(); // Changed class name
}

class _AwarenessesScreenState extends State<AwarenessesScreen> {
  // Changed class name
  List<AwarenessDetail> awarenessDetails = []; // Changed list name

  @override
  void initState() {
    super.initState();
    loadAwarenessData();
  }

  loadAwarenessData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    // Load awareness details from SharedPreferences or any other storage mechanism
  }

  void deleteAwareness(int index) {
    setState(() {
      awarenessDetails.removeAt(index); // Changed list name
    });
  }

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
               /* Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AwarenessesScreen(),
                    ));*/
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
        title: Text(
          "Awarenesses", // Changed title
        ),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: awarenessDetails.length, // Changed list name
                  itemBuilder: (context, index) {
                    final awareness =
                        awarenessDetails[index]; // Changed list name
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(-4, 2),
                              blurRadius: 10,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Awareness Name : ${awareness.awarenessName}', // Changed variable name
                                style: TextStyle(
                                  color: AppColor.textWhiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'Awareness Description : ${awareness.awarenessDescription}', // Changed variable name
                                style: TextStyle(
                                  color: AppColor.textWhiteColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                ),
                              ),
                              /* Text(
                                'Awareness per Day : ${awareness.awarenessesPerDay}', // Changed variable name
                                style: TextStyle(
                                  color: AppColor.textWhiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),*/
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: GestureDetector(
                                      onTap: () {
                                        deleteAwareness(
                                            index); // Changed list name
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.red,
                                        child: Icon(Icons.delete,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                color: Color(0x00000000),
                height: Height * 0.135,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewAwarenessScreen(
                    // Changed import and class name
                    onSubmit: (name, description, awarenessesPerDay) {
                      // Changed variable name
                      setState(() {
                        awarenessDetails.add(AwarenessDetail(
                          // Changed list name and class name
                          awarenessName: name, // Changed variable name
                          awarenessDescription:
                              description, // Changed variable name
                          awarenessesPerDay:
                              awarenessesPerDay, // Changed variable name
                        ));
                      });
                    },
                  ),
                ),
              );
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: Height * 0.085,
                      width: Width * 0.6,
                      child: Center(
                        child: Container(
                          width: Width * 0.45,
                          child: Wrap(
                            alignment: WrapAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.add,
                                color: AppColor.textWhiteColor,
                              ),
                              Text(
                                "Add Awareness",
                                style: TextStyle(
                                  color: AppColor.textWhiteColor,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(16),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(-4, 2),
                            blurRadius: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
