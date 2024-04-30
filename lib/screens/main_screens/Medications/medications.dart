import 'package:flutter/material.dart';
import 'package:phms/Colors/colors.dart';
import 'package:phms/screens/main_screens/Medications/new_medicine.dart';

class MedicationsScreen extends StatefulWidget {
  const MedicationsScreen({super.key});

  @override
  State<MedicationsScreen> createState() => _MedicationsScreenState();
}

class _MedicationsScreenState extends State<MedicationsScreen> {
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    bool openContainer ;
    return Scaffold(
      appBar: AppBar(
        title: Text("Medications",),
        
        backgroundColor:AppColor.primaryColor,

      ),
      body: Stack(
        children: [
           Container(
          color: Colors.blue,
          height: Height*1,
        ),

          Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NewMedicinePage(),));

                  },
                  child: Container(
                    height: Height*0.085,
                    width: Width*0.75,
                   child: Center(
                    child: Container(
                      width: Width*0.45,
                      
                      child: Wrap(alignment: WrapAlignment.spaceAround,
                        children: [
                          Icon(Icons.add,color: AppColor.textWhiteColor,),
                        //  SizedBox(width: Width*0.05,),
                          Text(
                            "Add Medication",
                            style: TextStyle(color:AppColor.textWhiteColor,fontSize: 18 ),)
                        ],
                      ),
                    ),
                   ),
                    decoration: BoxDecoration(
                       color: Colors.red,
                       borderRadius: BorderRadius.circular(16),
                       boxShadow: [
                        BoxShadow(
                          offset: Offset(-4, 2),
                          blurRadius: 10
                          )
                       ]
                          
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
       
        ],
        
      ),
    );
  }
}