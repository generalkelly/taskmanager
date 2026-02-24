import 'package:flutter/material.dart';
import 'package:frontend/domain/model/task.dart';

class AddTaskDialog extends StatefulWidget {
  final Task? task;
  final void Function(Task) addTaskCallback;
  const AddTaskDialog(this.task, this.addTaskCallback, {super.key});

  @override
  State<StatefulWidget> createState() => AddTaskDialogState();
}

class AddTaskDialogState extends State<AddTaskDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isNew = true;
  int? _id;
  String? _name;
  Priority _priority;
  bool _done;

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _isNew = false;
      _id = widget.task!.id;
      _name = widget.task!.name;
      _done = widget.task!.done;
    }
  }

  AddTaskDialogState() : _done = false, _priority = Priority.low;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              _isNew ? "Erstelle eine neue Aufgabe" : "Bearbeite die Aufgabe",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: 500,
                height: 300,
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      initialValue: _name,
                      decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(),
                        hintText: "Hier könnte eine neue Aufgabe stehen.",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Das Feld Name darf nicht leer sein.";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _name = value;
                        });
                      },
                    ),
                    if (_isNew)
                      DropdownMenuFormField(
                        dropdownMenuEntries: [
                          DropdownMenuEntry(
                            value: Priority.low,
                            label: "niedrig",
                          ),
                          DropdownMenuEntry(
                            value: Priority.normal,
                            label: "normal",
                          ),
                          DropdownMenuEntry(
                            value: Priority.urgent,
                            label: "wichtig",
                          ),
                        ],
                        initialSelection: _priority,
                        onSelected: (value) {
                          setState(() {
                            _priority = value ?? Priority.low;
                          });
                        },
                      ),
                    if (!_isNew)
                      FormField(
                        builder: (state) => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('erledigt:'),
                            Checkbox(
                              value: _done,
                              onChanged: (bool? value) {
                                setState(() {
                                  _done = value ?? false;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          if (_id != null) {
                            widget.addTaskCallback(
                              Task(_id, _name ?? '', _done, _priority, null),
                            );
                          } else {
                            widget.addTaskCallback(
                              Task(null, _name ?? '', _done, _priority, null),
                            );
                          }
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
