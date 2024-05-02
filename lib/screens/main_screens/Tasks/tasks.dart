import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phms/Colors/colors.dart';
import 'package:phms/screens/main_screens/Awareness/awareness.dart';
import 'package:phms/screens/main_screens/Health%20Monitoring/health_monitoring.dart';
import 'package:phms/screens/main_screens/Medications/medications.dart';
import 'package:phms/screens/main_screens/Reports/reports.dart';
import 'package:phms/screens/main_screens/Tasks/newTask.dart'; // Changed import
import 'package:phms/screens/main_screens/Tasks/tasks.dart'; // Changed import
import 'package:phms/screens/dashboard.dart';
import 'package:phms/screens/logout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskDetail {
  // Changed class name
  final String taskName; // Changed variable name
  final String taskDescription; // Changed variable name
  final int tasksPerDay; // Changed variable name

  TaskDetail({
    required this.taskName, // Changed variable name
    required this.taskDescription, // Changed variable name
    required this.tasksPerDay, // Changed variable name
  });
}

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key); // Corrected super call

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<TaskDetail> taskDetails = []; // Changed list name

  @override
  void initState() {
    super.initState();
    loadTaskData();
  }

  loadTaskData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    // Load task details from SharedPreferences or any other storage mechanism
  }

  void deleteTask(int index) {
    setState(() {
      taskDetails.removeAt(index); // Changed list name
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
              /*  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TasksScreen(),
                    ));*/
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
        title: Text(
          "Tasks",
        ),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: taskDetails.length, // Changed list name
                  itemBuilder: (context, index) {
                    final task = taskDetails[index]; // Changed list name
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
                                'Task Name : ${task.taskName}', // Changed variable name
                                style: TextStyle(
                                  color: AppColor.textWhiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'Task Description : ${task.taskDescription}', // Changed variable name
                                style: TextStyle(
                                  color: AppColor.textWhiteColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Tasks per Day : ${task.tasksPerDay}', // Changed variable name
                                style: TextStyle(
                                  color: AppColor.textWhiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: GestureDetector(
                                      onTap: () {
                                        deleteTask(index); // Changed list name
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
                  builder: (context) => NewTaskScreen(
                    // Changed import and class name
                    onSubmit: (name, description, tasksPerDay) {
                      // Changed variable name
                      setState(() {
                        taskDetails.add(TaskDetail(
                          // Changed list name and class name
                          taskName: name, // Changed variable name
                          taskDescription: description, // Changed variable name
                          tasksPerDay: tasksPerDay, // Changed variable name
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
                                "Add Task",
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
