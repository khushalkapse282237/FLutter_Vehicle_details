import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_detaild/screens/widget_data.dart';
import '../../model/model_table.dart';
import '../controllers/model_table_controller.dart';
import 'add_vehicle.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState(){
    super.initState();
    _taskController.getTasks();
  }
  final TaskController _taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Vehicle Details",
          style: TextStyle(
            fontSize: 27,
          ),
        ),
        actions: [
        IconButton(
          icon: const Icon(Icons.cleaning_services_outlined,
              size: 24),
          onPressed: () {
            _taskController.deleteAllTasks();
          },
        ),
        const SizedBox(
          width: 20,
        ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Bike",
                        style: TextStyle(fontSize: 23),
                      )),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Car",
                        style: TextStyle(fontSize: 23),
                      )),
                ),
              )
            ],
          ),
          _showData(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
                flex: 1,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const add_vehicle(),
                          ));
                    },
                    child: const Text(
                      "Add vehicle",
                      style: TextStyle(fontSize: 23),
                    ))),
          ),
        ],
      ),
    );
  }
  _showData(){
    return Expanded(child: Obx(() {
      if(_taskController.taskList.isEmpty){
        return const Text("NO DATA");
      }else{
        return RefreshIndicator(onRefresh: _onRefresh, child: ListView.builder(
          scrollDirection: Axis.vertical,
            itemCount: _taskController.taskList.length,
            itemBuilder: (BuildContext context,int index){
              var data = _taskController.taskList[index];
              return datawidget(data);
            }
        ));
      }
    }),
    );
  }
  Future<void> _onRefresh() async {
    _taskController.getTasks();
  }
}