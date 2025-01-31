import 'package:flutter/material.dart';
import 'screens/report_screen.dart'; // Pastikan ada file ini di folder screens

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reminder App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReportScreen(), // Set halaman utama ke ReportScreen
    );
  }
}
