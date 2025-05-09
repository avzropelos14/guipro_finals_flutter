import 'package:flutter/material.dart';
import 'package:flutterr/util/task.dart';
import 'package:flutterr/util/tasktile.dart';

class AddTaskDialog extends StatefulWidget {
  final Function(Task) onSubmit;

  const AddTaskDialog({required this.onSubmit});

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  DateTime _dueDate = DateTime.now();
  String _category = 'Academic';


  void _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => _dueDate = picked);
    }
  }

  void _submit() {
    if (_titleController.text.isEmpty) return;
    final task = Task(
      title: _titleController.text,
      description: _descController.text,
      dueDate: _dueDate,
      category: _category,
    );
    widget.onSubmit(task);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Task'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(controller: _titleController, decoration: InputDecoration(labelText: 'Title')),
            TextField(controller: _descController, decoration: InputDecoration(labelText: 'Description')),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Due: ${_dueDate.toLocal().toString().split(' ')[0]}'),
                TextButton(onPressed: _pickDate, child: Text('Pick Date'))
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('Cancel')),
        ElevatedButton(onPressed: _submit, child: Text('Add Task')),
      ],
    );
  }
}