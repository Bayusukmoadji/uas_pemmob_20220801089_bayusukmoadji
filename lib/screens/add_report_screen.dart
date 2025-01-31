import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AddReportScreen extends StatefulWidget {
  @override
  _AddReportScreenState createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  final ApiService apiService = ApiService();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Report")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Description"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await apiService.createReport(
                  titleController.text,
                  descriptionController.text,
                );
                Navigator.pop(context, true); // Kirim hasil ke ReportScreen
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
