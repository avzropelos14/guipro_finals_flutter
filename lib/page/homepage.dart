import 'package:flutter/material.dart';
import 'package:flutterr/util/task.dart';
import 'package:flutterr/util/tasktile.dart';
import 'package:flutterr/util/dialogue.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final List<Task> _tasks = [];

  //add task funhction 
  void _addTask(Task task) {
    setState(() => _tasks.add(task));
  }
  //delete task function
  void _deleteTask(Task task) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          'Delete Task'
          ),
        content: Text(
          'Are you sure?'
          ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), child: Text('Cancel')),
          TextButton(
            onPressed: () {
              setState(() => _tasks.remove(task));
              Navigator.of(context).pop();
            },
            child: Text(
              'Delete', 
              style: TextStyle(color: Colors.red)),
          )
        ],
      ),
    );
  }


  //if task is complete 
  void _taskComplete(Task task) {
    setState(() => task.isCompleted = !task.isCompleted);
  }


  List<Task> get _dueSoonTasks {
    final today = DateTime.now();
    return _tasks.where((t) => t.dueDate.difference(today).inDays <= 1 && !t.isCompleted).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children:[
            Image.network('data:image/png;base64,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',
            width: 45,
            height: 45,
            ),
            Text('Asian College Todo App', style: TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            if (_dueSoonTasks.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text('Due Soon Tasks:', style: TextStyle(color: Colors.black)),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (_) => AddTaskDialog(onSubmit: _addTask),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(Icons.add),
      ),
    );
  }
}