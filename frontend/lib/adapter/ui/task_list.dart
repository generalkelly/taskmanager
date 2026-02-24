import 'package:flutter/material.dart';
import 'package:frontend/domain/model/task.dart';
import 'package:intl/intl.dart';

class TaskListView extends StatelessWidget {
  final TaskList _tasks;
  final void Function(Task) _updateTaskCallback;
  final Future<void> Function() _getAllTasks;
  final Future<void> Function(int) _deleteTask;

  final VoidCallback? Function(Task?) _showTaskForm;

  static final DateFormat dateFormat = DateFormat(
    'EEEE, d MMMM yyyy - HH:mm',
    'de_DE',
  );

  const TaskListView(
    this._tasks,
    this._updateTaskCallback,
    this._getAllTasks,
    this._showTaskForm,
    this._deleteTask, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        var task = _tasks[index];
        return Dismissible(
          key: Key(task.id.toString()),
          child: ListTile(
            leading: Checkbox(
              value: task.done,
              onChanged: (value) {
                _updateTaskCallback(
                  Task(
                    task.id,
                    task.name,
                    value ?? false,
                    task.priority,
                    task.created,
                  ),
                );
              },
            ),
            title: Text(task.name),
            subtitle: task.created != null
                ? Text('Erstellt am ${dateFormat.format(task.created!)}')
                : Text(''),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Chip(
                  label: Text(prioToString(task.priority)),
                  avatar: Icon(prioToIcon(task.priority)),
                  backgroundColor: prioToColor(task.priority),
                ),
                MenuAnchor(
                  builder: (context, controller, child) {
                    return IconButton(
                      onPressed: () {
                        if (controller.isOpen) {
                          controller.close();
                        } else {
                          controller.open();
                        }
                      },
                      icon: Icon(Icons.more_vert),
                    );
                  },
                  menuChildren: [
                    MenuItemButton(
                      onPressed: _showTaskForm(task),
                      child: Row(
                        spacing: 5,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.edit_outlined),
                          const Text('bearbeiten'),
                        ],
                      ),
                    ),
                    MenuItemButton(
                      onPressed: task.id != null
                          ? () => _deleteTask(task.id!)
                          : null,
                      child: Row(
                        spacing: 5,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.delete_forever, color: Colors.red),
                          const Text('löschen'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          onDismissed: (direction) async {
            task.id != null ? await _deleteTask(task.id!) : null;
          },
        );
      },
    );
  }

  String prioToString(Priority priority) {
    switch (priority) {
      case Priority.low:
        return 'niedrig';
      case Priority.normal:
        return 'normal';
      case Priority.urgent:
        return 'wichtig';
    }
  }

  Color prioToColor(Priority priority) {
    switch (priority) {
      case Priority.low:
        return Colors.green.shade300;
      case Priority.normal:
        return Colors.yellow.shade300;
      case Priority.urgent:
        return Colors.red.shade300;
    }
  }

  IconData prioToIcon(Priority priority) {
    switch (priority) {
      case Priority.low:
        return Icons.low_priority_outlined;
      case Priority.normal:
        return Icons.check;
      case Priority.urgent:
        return Icons.warning_amber_rounded;
    }
  }
}
