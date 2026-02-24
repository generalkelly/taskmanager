import 'package:frontend/domain/model/task.dart';

abstract class TaskAdministrationPort {
  Future<TaskList> getAllTasks();

  Future<void> addTask(Task task);

  Future<void> updateTask(Task task);

  Future<void> deleteTask(int id);
}
