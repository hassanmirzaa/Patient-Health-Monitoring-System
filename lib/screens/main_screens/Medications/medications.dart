import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phms/Colors/colors.dart';
import 'package:phms/screens/main_screens/Awareness/awareness.dart';
import 'package:phms/screens/main_screens/Drawer/drawer.dart';
import 'package:phms/screens/main_screens/Health%20Monitoring/health_monitoring.dart';
import 'package:phms/screens/main_screens/Medications/new_medicine.dart';
import 'package:phms/screens/main_screens/Reports/reports.dart';
import 'package:phms/screens/main_screens/Tasks/tasks.dart';
import 'package:phms/screens/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicationDetail {
  final String name;
  final String description;
  final int dosesPerDay;

  MedicationDetail({
    required this.name,
    required this.description,
    required this.dosesPerDay,
  });
}

class MedicationsScreen extends StatefulWidget {
  const MedicationsScreen({Key? key}) : super(key: key);

  @override
  State<MedicationsScreen> createState() => _MedicationsScreenState();
}

class _MedicationsScreenState extends State<MedicationsScreen> {
  List<MedicationDetail> medicationDetails = [];

  @override
  void initState() {
    super.initState();
    loadMedicineData();
  }

  loadMedicineData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    // Load medication details from SharedPreferences or any other storage mechanism
  }

  void deleteMedication(int index) {
    setState(() {
      medicationDetails.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: CustomDrawer(currentPage: 'medications'),
      appBar: AppBar(
        title: Text(
          "Medications",
        ),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: medicationDetails.length,
                  itemBuilder: (context, index) {
                    final medication = medicationDetails[index];
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
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.start,
                                children: [
                                  Text(
                                    'Name : ',
                                    style: TextStyle(
                                      color: AppColor.textWhiteColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    medication.name,
                                    style: TextStyle(
                                      color: AppColor.textWhiteColor,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                              Wrap(
                                children: [
                                  Text(
                                    'Description : ',
                                    style: TextStyle(
                                      color: AppColor.textWhiteColor,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    medication.description,
                                    style: TextStyle(
                                      color: AppColor.textWhiteColor,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                              Wrap(
                                children: [
                                  Text(
                                    'Doses per Day : ',
                                    style: TextStyle(
                                      color: AppColor.textWhiteColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    medication.dosesPerDay.toString(),
                                    style: TextStyle(
                                      color: AppColor.textWhiteColor,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: GestureDetector(
                                      onTap: () {
                                        deleteMedication(index);
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewMedicinePage(
                          onSubmit: (name, description, dosesPerDay) {
                            setState(() {
                              medicationDetails.add(MedicationDetail(
                                name: name,
                                description: description,
                                dosesPerDay: dosesPerDay,
                              ));
                            });
                          },
                        ),
                      ),
                    );
                  },
                  child: Padding(
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
                                "Add Medication",
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
