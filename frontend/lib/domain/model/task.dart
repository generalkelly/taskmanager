class Task {
  final int? _id;
  final String _name;
  final bool _done;
  final Priority _priority;
  final DateTime? _created;

  Task(this._id, this._name, this._done, this._priority, this._created);

  Task.createTask(name, done, prio) : this(null, name, done, prio, null);

  int? get id => _id;
  String get name => _name;
  bool get done => _done;
  Priority get priority => _priority;
  DateTime? get created => _created;
}

enum Priority { low, normal, urgent }

typedef TaskList = List<Task>;
