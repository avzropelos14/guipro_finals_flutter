import 'package:flutter/material.dart';
import 'package:flutterr/util/tasktile.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onToggleComplete;
  final VoidCallback onDelete;

  const TaskTile({
    required this.task,
    required this.onToggleComplete,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        '${task.description} | Due: ${task.dueDate.toLocal().toString().split(' ')[0]}',
      ),
      trailing: Wrap(
        spacing: 8,
        children: [
          IconButton(
            icon: Icon(
              task.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: onToggleComplete,
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}