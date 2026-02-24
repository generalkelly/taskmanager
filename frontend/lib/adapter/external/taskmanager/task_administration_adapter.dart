import 'package:frontend/adapter/external/taskmanager/task_repository.dart';
import 'package:frontend/domain/model/task.dart';
import 'package:frontend/domain/usecases/acl/task_administration_port.dart';
import 'package:openapi/api.dart' as api;

class TaskAdministrationAdapter extends TaskAdministrationPort {
  final TaskRepository _taskRepository;

  TaskAdministrationAdapter(String basePath)
    : _taskRepository = TaskRepository(basePath);

  @override
  Future<void> addTask(Task task) async {
    await _taskRepository.addTask(
      api.AddTaskRequest(
        name: task.name,
        priority: mapPriorityToString(task.priority),
      ),
    );
  }

  @override
  Future<void> updateTask(Task task) async {
    final id = task.id;
    if (id != null) {
      await _taskRepository.updateTask(
        id,
        api.UpdateTaskRequest(name: task.name, done: task.done),
      );
    }
  }

  @override
  Future<TaskList> getAllTasks() async {
    var allTasks = await _taskRepository.getAllTasks();
    if (allTasks != null) {
      TaskList tasks = (allTasks).tasks
          .where(
            (taskFromResponse) =>
                taskFromResponse.name != null &&
                taskFromResponse.done != null &&
                taskFromResponse.created != null,
          )
          .map(
            (taskFomResponse) => Task(
              taskFomResponse.id,
              taskFomResponse.name!,
              taskFomResponse.done!,
              mapPriorityFromResponse(taskFomResponse),
              DateTime.fromMillisecondsSinceEpoch(taskFomResponse.created!),
            ),
          )
          .toList();
      return tasks;
    } else {
      return [];
    }
  }

  @override
  Future<void> deleteTask(int id) {
    return _taskRepository.deleteTask(id);
  }

  Priority mapPriorityFromResponse(api.Task taskFomResponse) {
    switch (taskFomResponse.priority) {
      case api.TaskPriorityEnum.LOW:
        return Priority.low;
      case api.TaskPriorityEnum.NORMAL:
        return Priority.normal;
      case api.TaskPriorityEnum.URGENT:
        return Priority.urgent;
      default:
        return Priority.low;
    }
  }

  api.AddTaskRequestPriorityEnum mapPriorityToString(Priority priority) {
    switch (priority) {
      case Priority.low:
        return api.AddTaskRequestPriorityEnum.LOW;
      case Priority.normal:
        return api.AddTaskRequestPriorityEnum.NORMAL;
      case Priority.urgent:
        return api.AddTaskRequestPriorityEnum.URGENT;
    }
  }
}
