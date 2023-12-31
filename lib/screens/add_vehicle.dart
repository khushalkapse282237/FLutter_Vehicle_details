import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle_detaild/model/model_table.dart';
import 'MyHomePage.dart';
import 'package:get/get.dart';
import 'package:vehicle_detaild/controllers/model_table_controller.dart';
class add_vehicle extends StatefulWidget {
  const add_vehicle({super.key});
  @override
  State<StatefulWidget> createState() => add_vehicle_state();
}

class add_vehicle_state extends State<add_vehicle> {
  String dropdownvalue1 = 'None';
  var dd1 = ['Bike', 'Car','None'];
  String dropdownvalue2 = 'None';
  var dd2 = ["BMW", 'Mercedes', 'Mahindra', 'Tata','None'];
  String dropdownvalue3 = 'None';
  var dd3 = ['Petrol', 'Diesel','None'];
  final vehicle_no = TextEditingController();
  final TaskController controller = Get.put(TaskController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Add a Vehicle",
          style: TextStyle(
            fontSize: 27,
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Vehicle type",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: DropdownButton(
                      value: dropdownvalue1,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: dd1.map((String dd1) {
                        return DropdownMenuItem(
                          value: dd1,
                          child: Text(dd1),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue1 = newValue!;
                        });
                      }),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Brand Name",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: DropdownButton(
                      value: dropdownvalue2,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: dd2.map((String dd2) {
                        return DropdownMenuItem(
                          value: dd2,
                          child: Text(dd2),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue2 = newValue!;
                        });
                      }),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Fuel type      ",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: DropdownButton(
                      value: dropdownvalue3,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: dd3.map((String dd3) {
                        return DropdownMenuItem(
                          value: dd3,
                          child: Text(dd3),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue3 = newValue!;
                        });
                      }),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 235,
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: vehicle_no,
                    decoration:
                        const InputDecoration(hintText: "Enter Vehicle no."),
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () async {
                if(dropdownvalue1=="None" || dropdownvalue2=="None" || dropdownvalue3=="None"){
                  debugPrint("all data is not fill");
                }else{
                  try{
                    int value=0;
                    if(dropdownvalue1!=null && dropdownvalue2!=null && dropdownvalue3!=null){
                      value = await controller.addTask(
                        task: model_table(vehicleType: dropdownvalue1,brandType: dropdownvalue2,fuelType: dropdownvalue3,vehicleNo: vehicle_no.toString()),
                      ) ;
                    }
                    print("data : $value");
                  }catch(e){
                    print(e);
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage()));
                }
              },
              child: const Text(
                "Submit",
                style: TextStyle(fontSize: 23),
              )),
        ],
      ),
    );
  }
}
