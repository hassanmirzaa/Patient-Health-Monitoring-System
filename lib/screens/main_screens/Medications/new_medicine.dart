import 'package:flutter/material.dart';
import 'package:phms/Colors/colors.dart';
import 'package:phms/screens/main_screens/Drawer/drawer.dart';

class MedicationDetail {
  final String name;
  final String description;
  final int dosesPerDay;
  final List<TimeOfDay> times;

  MedicationDetail({
    required this.name,
    required this.description,
    required this.dosesPerDay,
    required this.times,
  });
}

class NewMedicinePage extends StatefulWidget {
  final Function(Map<String, dynamic>) onSubmit;

  const NewMedicinePage({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<NewMedicinePage> createState() => _NewMedicinePageState();
}

class _NewMedicinePageState extends State<NewMedicinePage> {
  final medicationNameController = TextEditingController();
  final medicationDescriptionController = TextEditingController();
  int dosesPerDay = 1;
  List<TimeOfDay> times = [];

  @override
  void initState() {
    super.initState();
    times =
        List.generate(dosesPerDay, (index) => TimeOfDay(hour: 0, minute: 0));
  }

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;

    return Scaffold(
      //drawer: CustomDrawer(currentPage: 'health_monitoring'),
      appBar: AppBar(
        title: Text("Add New Medication"),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Medication Name :", style: TextStyle(fontSize: 22)),
                  TextFormField(controller: medicationNameController),
                  SizedBox(height: Height * 0.02),
                  Text("Description:", style: TextStyle(fontSize: 22)),
                  TextFormField(controller: medicationDescriptionController),
                  SizedBox(height: Height * 0.02),
                  Text("Doses Per Day", style: TextStyle(fontSize: 22)),
                  DropdownButton<int>(
                    value: dosesPerDay,
                    items: List.generate(48, (index) => index + 1)
                        .map<DropdownMenuItem<int>>(
                          (int value) => DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          ),
                        )
                        .toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        dosesPerDay = newValue!;
                        times = List.generate(
                            newValue, (index) => TimeOfDay(hour: 0, minute: 0));
                      });
                    },
                  ),
                  Column(
                    children: List.generate(
                      dosesPerDay,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: InkWell(
                          onTap: () => _selectTime(index),
                          child: Container(
                            width: Width * 0.2,
                            child: InputDecorator(
                              decoration: InputDecoration(
                                labelText: 'Time ${index + 1}',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16)),
                              ),
                              child: Text(
                                '${times[index].hour}:${times[index].minute.toString().padLeft(2, '0')}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Height * 0.13),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Map<String, dynamic> medicationData = {
                      'name': medicationNameController.text.toString(),
                      'description':
                          medicationDescriptionController.text.toString(),
                      'dosesPerDay': dosesPerDay,
                      'times': times
                          .map((time) =>
                              '${time.hour}:${time.minute.toString().padLeft(2, '0')}')
                          .toList(),
                    };
                    widget.onSubmit(medicationData);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: Height * 0.085,
                    width: Width * 0.35,
                    child: Center(
                      child: Text("Submit", style: TextStyle(fontSize: 18,color: AppColor.textWhiteColor)),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(-4, 2),
                          blurRadius: 10,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Height * 0.04)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectTime(int index) async {
    TimeOfDay initialTime = times[index] ?? TimeOfDay(hour: 0, minute: 0);
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (picked != null && picked != times[index]) {
      setState(() {
        times[index] = picked;
      });
    }
  }
}
