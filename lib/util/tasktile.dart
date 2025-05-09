import 'package:flutter/material.dart';
import 'package:flutterr/main.dart';

void main() {
  runApp(TodoApp());
}

  class Task {
    String title;
    String description;
    DateTime dueDate;
    bool isCompleted;
    String category;

    Task({
      required this.title,
      required this.description,
      required this.dueDate,
      this.isCompleted = false,
      required this.category,
    });
  }