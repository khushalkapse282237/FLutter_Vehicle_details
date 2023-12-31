import 'package:get/get.dart';
import 'package:vehicle_detaild/model/model_table.dart';
import '../db/db_helper.dart';

class TaskController extends GetxController {
  final RxList<model_table> taskList = <model_table>[].obs;

  Future<int> addTask({model_table? task}) {
    return DBHelper.insert(task);
  }

  Future<void> getTasks() async {
    final List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => model_table.fromJson(data)).toList());
  }

  void deleteTasks(model_table task) async {
    await DBHelper.delete(task);
    getTasks();
  }

  void deleteAllTasks() async {
    await DBHelper.deleteAll();
    getTasks();
  }
}
