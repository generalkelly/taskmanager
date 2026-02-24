import 'package:button_group_m3e/button_group_m3e.dart';
import 'package:flutter/material.dart';
import 'package:frontend/adapter/external/taskmanager/task_administration_adapter.dart';
import 'package:frontend/adapter/ui/add_task_dialog.dart';
import 'package:frontend/adapter/ui/task_list.dart';
import 'package:frontend/domain/model/task.dart';
import 'package:frontend/domain/usecases/acl/task_administration_port.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:m3e_design/m3e_design.dart';

void main() {
  initializeDateFormatting('de_DE', null).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taskmanager',
      theme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: Brightness.light,
      ).toM3EThemeData(),
      home: const TaskmanagerMainPage(title: 'Taskmanager'),
    );
  }
}

class TaskmanagerMainPage extends StatefulWidget {
  const TaskmanagerMainPage({super.key, required this.title});
  final String title;
  @override
  State<TaskmanagerMainPage> createState() => _TaskmanagerMainPageState();
}

class _TaskmanagerMainPageState extends State<TaskmanagerMainPage> {
  TaskList _tasks = List.empty();
  final TaskAdministrationPort _taskAdministrationPort =
      TaskAdministrationAdapter('/taskmanager');
  int _selectedFilterIndex;
  Set<Priority> _selectedPrioFilters = {
    Priority.low,
    Priority.normal,
    Priority.urgent,
  };

  _TaskmanagerMainPageState() : _selectedFilterIndex = 0;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getAllTasks();
    });
  }

  Future<void> _getAllTasks() async {
    TaskList tasks = await _taskAdministrationPort.getAllTasks();
    setState(() {
      _tasks = tasks;
    });
  }

  Future<void> _deleteTask(int id) async {
    await _taskAdministrationPort.deleteTask(id);
    await _getAllTasks();
  }

  Future<void> Function(Task) _addTaskCallback() {
    return (Task task) async {
      await _taskAdministrationPort.addTask(task);
      await _getAllTasks();
    };
  }

  Future<void> Function(Task) _updateTaskCallback() {
    return (Task task) async {
      await _taskAdministrationPort.updateTask(task);
      await _getAllTasks();
    };
  }

  VoidCallback? _showTaskForm(Task? task) {
    return () => showDialog(
      context: context,
      builder: (context) => task != null
          ? AddTaskDialog(task, _updateTaskCallback())
          : AddTaskDialog(task, _addTaskCallback()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actionsPadding: EdgeInsets.only(right: 30),
        actions: [
          ButtonGroupM3E(
            density: ButtonGroupM3EDensity.compact,
            selectedIndex: _selectedFilterIndex,
            actions: [
              ButtonGroupM3EAction(
                label: const Text('alle'),
                onPressed: () => setState(() => _selectedFilterIndex = 0),
              ),
              ButtonGroupM3EAction(
                label: const Text('erledigt'),
                onPressed: () => setState(() => _selectedFilterIndex = 1),
              ),
              ButtonGroupM3EAction(
                label: const Text('offen'),
                onPressed: () => setState(() => _selectedFilterIndex = 2),
              ),
            ],
          ),
          SizedBox(width: 20),
          SegmentedButton<Priority>(
            multiSelectionEnabled: true,
            segments: [
              ButtonSegment<Priority>(
                value: Priority.low,
                label: Text('niedrig'),
                icon: Icon(Icons.low_priority_outlined),
              ),
              ButtonSegment<Priority>(
                value: Priority.normal,
                label: Text('normal'),
                icon: Icon(Icons.check),
              ),
              ButtonSegment<Priority>(
                value: Priority.urgent,
                label: Text('wichtig'),
                icon: Icon(Icons.warning_amber_rounded),
              ),
            ],
            selected: _selectedPrioFilters,
            onSelectionChanged: (Set<Priority> newlySelectedPriorities) =>
                setState(() {
                  _selectedPrioFilters = newlySelectedPriorities;
                }),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: TaskListView(
                _tasks.where((task) => taskMeetsFilterCriteria(task)).toList(),
                _updateTaskCallback(),
                _getAllTasks,
                _showTaskForm,
                _deleteTask,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showTaskForm(null),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  bool taskMeetsFilterCriteria(Task task) {
    return taskMeetsDoneCriteria(task) && taskMeetsPrioCriteria(task);
  }

  bool taskMeetsDoneCriteria(Task task) {
    return _selectedFilterIndex == 0 ||
        (_selectedFilterIndex == 1 && task.done) ||
        (_selectedFilterIndex == 2 && !task.done);
  }

  bool taskMeetsPrioCriteria(Task task) {
    return _selectedPrioFilters.contains(task.priority);
  }
}
