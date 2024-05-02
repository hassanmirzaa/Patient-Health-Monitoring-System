import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phms/Colors/colors.dart';

class NewAwarenessScreen extends StatefulWidget {
  // Changed class name
  const NewAwarenessScreen({
    Key? key,
    required this.onSubmit,
  });

  final void Function(dynamic awarenessName, dynamic awarenessDescription,
      dynamic awarenessesPerDay) onSubmit; // Changed parameters

  @override
  State<NewAwarenessScreen> createState() =>
      _NewAwarenessScreenState(); // Changed class name
}

class _NewAwarenessScreenState extends State<NewAwarenessScreen> {
  // Changed class name
  final awarenessNameController =
      TextEditingController(); // Changed variable name
  final awarenessDescriptionController =
      TextEditingController(); // Changed variable name
  int awarenessesPerDay = 1; // Changed variable name
  /* List<TimeOfDay> times = []; // List of times

  @override
  void initState() {
    super.initState();
    // Initialize times with default values
    times = List.generate(awarenessesPerDay, (index) => TimeOfDay(hour: 0, minute: 0)); // Changed variable name
  }*/

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add New", // Changed title
          style: TextStyle(color: AppColor.textWhiteColor),
        ),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Text(
                      "Awareness:", // Changed label
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller:
                          awarenessNameController, // Changed variable name
                    ),
                  ),
                  SizedBox(height: Height * 0.02),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Text(
                      "Description:", // Changed label
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller:
                          awarenessDescriptionController, // Changed variable name
                    ),
                  ),
                  /* SizedBox(height: Height * 0.02),
                  Container(
                    width: Width * 0.8,
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            " Per Day", // Changed label
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        Container(
                          width: Width * 0.15,
                          child: DropdownButton<int>(
                            value: awarenessesPerDay, // Changed variable name
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
                                awarenessesPerDay = newValue!; // Changed variable name
                                times = List.generate(newValue, (index) => TimeOfDay(hour: 0, minute: 0));
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),*/
                  /* Center(
                    child: Column(
                      children: List.generate(
                        awarenessesPerDay, // Changed variable name
                        (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: InkWell(
                              onTap: () => _selectTime(index),
                              child: Container(
                                width: Width * 0.2,
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                    labelText: 'Time ${index + 1}',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  child: Text(
                                    '${times[index].hour}:${times[index].minute.toString().padLeft(2, '0')}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: Height * 0.13),*/
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {
                    widget.onSubmit(
                      awarenessNameController.text
                          .toString(), // Changed variable name
                      awarenessDescriptionController.text
                          .toString(), // Changed variable name
                      awarenessesPerDay, // Changed variable name
                    );
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: Height * 0.085,
                      width: Width * 0.35,
                      child: Center(
                        child: Container(
                          width: Width * 0.45,
                          child: Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: AppColor.textWhiteColor, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomRight: Radius.circular(20)),
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
