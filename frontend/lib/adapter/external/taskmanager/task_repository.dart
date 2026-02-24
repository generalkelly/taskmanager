import 'package:openapi/api.dart';

class TaskRepository {
  final TaskControllerApi _taskControllerApi;

  TaskRepository(String basePath)
    : _taskControllerApi = TaskControllerApi(ApiClient(basePath: basePath));

  Future<void> addTask(AddTaskRequest addTaskRequest) {
    return _taskControllerApi.addTask(addTaskRequest);
  }

  Future<void> updateTask(int id, UpdateTaskRequest updateTaskRequest) {
    return _taskControllerApi.updateTask(id, updateTaskRequest);
  }

  Future<GetAllTasksResponse?> getAllTasks() {
    return _taskControllerApi.getAllTasks();
  }

  Future<void> deleteTask(int id) {
    return _taskControllerApi.deleteTask(id);
  }
}
