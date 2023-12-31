import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_detaild/model/model_table.dart';

class datawidget extends StatelessWidget{
  datawidget(this.data);
  final model_table data;
  @override
  Widget build(BuildContext context) {
    String a = data.vehicleType.toString();
    String b = data.brandType.toString();
    String c = data.fuelType.toString();
    String d = data.vehicleNo.toString();
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height*0.13,
        color: const Color.fromARGB(255, 253, 208, 251),
        child: Column(
          children: [
            Text("Vehicle Type : $a",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w300)),
            Text("Brand Name : $b",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w300)),
            Text("Fuel Type : $c",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w300)),
          ],
        ),
      ),
    );
  }
}