import 'package:flutter/material.dart';
import 'package:phms/Colors/colors.dart';

class NewMedicinePage extends StatefulWidget {
  const NewMedicinePage({super.key});

  @override
  State<NewMedicinePage> createState() => _NewMedicinePageState();
}

class _NewMedicinePageState extends State<NewMedicinePage> {
  final medicineNameController = TextEditingController();
  final medicineDescriptionController = TextEditingController();
  int dosesPerDay = 1;
List<TimeOfDay> times = []; // List of times

  
 @override
  void initState() {
    super.initState();
    // Initialize times with default values
    times = List.generate(dosesPerDay, (index) => TimeOfDay(hour: 0, minute: 0));
  }
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
        title: Text("Add New",style: TextStyle(color: AppColor.textWhiteColor),),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Stack(
        children:[

          SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                  child: Text("Medicine Name :",
                  style: TextStyle(
                    fontSize: 22
                  ),),
                ),
               
          
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: medicineDescriptionController,
                    
                  ),
                ),
                 SizedBox(height: Height*0.02,),

                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                  child: Text("Description:",
                  style: TextStyle(
                    fontSize: 22
                  ),),
                ),
               
          
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: medicineNameController,
                    
                  ),
                ),
                 SizedBox(height: Height*0.02,),
          
                Container(
                  width: Width*0.8,
                  child: Wrap(
                    
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text("Doses Per Day",
                        style: TextStyle(
                        fontSize: 22
                                        ),),
                      ),
                  
                     Container(
                      width: Width*0.15,
                    
                       child: DropdownButton<int>(
                        
                              value: dosesPerDay,
                              items: List.generate(48, (index) => index + 1)
                              .map<DropdownMenuItem<int>>(
                              (int value) => DropdownMenuItem<int>(
                               value: value,
                               child: Text(value.toString(),),
                              ),
                              )
                              .toList(),
                              onChanged: (int? newValue) {
                               setState(() {
                                       dosesPerDay = newValue!;
                                        times = List.generate(newValue, (index) => TimeOfDay(hour: 0, minute: 0));
                               });
                              },
                            ),
                     ),
                    ],
                  ),
                ),
          
                Center(
                  child: Column(
                children: List.generate(dosesPerDay, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: InkWell(
                      onTap: () => _selectTime(index),
                      child: Container(
                        width: Width*0.2,
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Time ${index + 1}',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)
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
                }),)
                ),
                SizedBox(height: Height*0.13,)
          
          
              ],
            ),
          ),
        ),

        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  onTap: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => NewMedicinePage(),));

                  },
                  child: Container(
                    height: Height*0.085,
                    width: Width*0.35,
                   child: Center(
                    child: Container(
                      width: Width*0.45,
                      
                      child: Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(color:AppColor.textWhiteColor,fontSize: 18 ),),
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
        ] 
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
