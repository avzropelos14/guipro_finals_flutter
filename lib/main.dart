import 'package:flutter/material.dart';
import 'package:flutterr/page/homepage.dart';


void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asian College Todo App for Students',      
      theme: ThemeData(
        primaryColor: Color(0xFF0056b3), 
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFFFFD700), 
        ),
      ),
      home: Home(),
    );
  }
}