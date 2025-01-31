import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'add_report_screen.dart'; // Import halaman tambah laporan

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final ApiService apiService = ApiService();
  late Future<List<dynamic>> reports;

  @override
  void initState() {
    super.initState();
    reports = apiService.getReports();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reports")),
      body: FutureBuilder<List<dynamic>>(
        future: reports,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No reports found"));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var report = snapshot.data![index];
              return ListTile(
                title: Text(report['title']),
                subtitle: Text(report['description']),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddReportScreen()),
          );

          if (result == true) {
            setState(() {
              reports = apiService.getReports(); // Refresh data jika berhasil
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
