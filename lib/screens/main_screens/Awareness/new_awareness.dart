import 'package:flutter/material.dart';
import 'package:phms/Colors/colors.dart';
import 'package:phms/screens/main_screens/Drawer/drawer.dart';

class AwarenessDetail {
  final String name;
  final String description;
 

  AwarenessDetail({
    required this.name,
    required this.description,
   
  });
}

class NewAwarenessPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onSubmit;

  const NewAwarenessPage({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<NewAwarenessPage> createState() => _NewAwarenessPageState();
}

class _NewAwarenessPageState extends State<NewAwarenessPage> {
  final awarenessNameController = TextEditingController();
  final awarenessDescriptionController = TextEditingController();
  
 

  

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;

    return Scaffold(
      //drawer: CustomDrawer(currentPage: 'health_monitoring'),
      appBar: AppBar(
        title: Text("Add New Awareness"),
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
                  Text("Awareness Name :", style: TextStyle(fontSize: 22)),
                  TextFormField(controller: awarenessNameController),
                  SizedBox(height: Height * 0.02),
                  Text("Description:", style: TextStyle(fontSize: 22)),
                  TextFormField(controller: awarenessDescriptionController),
                  SizedBox(height: Height * 0.02),
                 
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
                    Map<String, dynamic> awarenessData = {
                      'name': awarenessNameController.text.toString(),
                      'description':
                          awarenessDescriptionController.text.toString(),
                     
                    };
                    widget.onSubmit(awarenessData);
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

  
  
}
