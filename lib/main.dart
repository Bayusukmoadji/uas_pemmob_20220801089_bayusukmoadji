import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/report_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ingat Kantong Belanja!',
      theme: ThemeData(
        primarySwatch: Colors.green, // Warna hijau untuk tema ramah lingkungan
        textTheme: GoogleFonts.latoTextTheme(), // Font lebih modern
      ),
      home: ReportScreen(),
    );
  }
}
