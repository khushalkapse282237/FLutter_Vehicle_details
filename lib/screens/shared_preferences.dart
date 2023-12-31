import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'MyHomePage.dart';

class add_vehicle extends StatefulWidget {
  const add_vehicle({super.key});
  @override
  State<StatefulWidget> createState() => add_vehicle_state();
}

class add_vehicle_state extends State<add_vehicle> {
  String dropdownvalue1 = '-';
  var dd1 = ['Bike', 'Car', '-'];
  String dropdownvalue2 = '-';
  var dd2 = ["BMW", 'Mercedes', 'Mahindra', 'Tata', "-"];
  String dropdownvalue3 = '-';
  var dd3 = ['Petrol', 'Diesel', '-'];
  var vehicle_no = TextEditingController();
  final String KEYNAME1 = "vehicle_type";
  final String KEYNAME2 = "Brand_name";
  final String KEYNAME3 = "Fuel_type";
  final String KEYNAME4 = "vehicle_no";
  var text_data;

  @override
  void initState() {
    super.initState();
    get_data();
  }

  void get_data() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var data1 = shared_preferences.getString(KEYNAME1);
    var data2 = shared_preferences.getString(KEYNAME2);
    var data3 = shared_preferences.getString(KEYNAME3);
    var data4 = shared_preferences.getString(KEYNAME4);
    var data = data1!+data2!+data3!+data4!;//this ! after variable is for null check
    text_data =
        data ?? "No data"; //this means if data is empty then "No data" will
    // be their in text_data variable
    setState(() {});
  }

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
                if(dropdownvalue1=="-" || dropdownvalue2=="-" || dropdownvalue3=="-"){
                  text_data= "please fill all details";
                  setState(() {});
                }else{
                  var sharedPreferences = await SharedPreferences.getInstance();
                  sharedPreferences.setString(KEYNAME1, dropdownvalue1);
                  sharedPreferences.setString(KEYNAME2, dropdownvalue2);
                  sharedPreferences.setString(KEYNAME3, dropdownvalue3);
                  sharedPreferences.setString(KEYNAME4, vehicle_no.text.toString());

                  // ignore: use_build_context_synchronously
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
          Text(text_data),
        ],
      ),
    );
  }
}
