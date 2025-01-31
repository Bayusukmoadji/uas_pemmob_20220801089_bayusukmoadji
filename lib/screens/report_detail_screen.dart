import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ReportDetailScreen extends StatelessWidget {
  final Map<String, dynamic> report;
  final ApiService apiService = ApiService();

  ReportDetailScreen({required this.report}) {
    print("Data yang diterima di ReportDetailScreen: $report"); // Debugging
  }

  String formatDate(String? date) {
    if (date == null || date.isEmpty) return "Tidak ada tanggal";
    return DateTime.tryParse(date) != null
        ? DateTime.parse(date).toLocal().toString().split(' ')[0]
        : "Format tanggal salah";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Pengingat"),
        backgroundColor: Colors.green.shade700,
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: Colors.white),
            onPressed: () async {
              bool confirmDelete = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Hapus Pengingat"),
                  content:
                      Text("Apakah Anda yakin ingin menghapus pengingat ini?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text("Batal"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Text("Hapus", style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              );

              if (confirmDelete == true) {
                try {
                  await apiService.deleteReport(report['id']);
                  Navigator.pop(
                      context, true); // Kembali ke ReportScreen & refresh
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Gagal menghapus pengingat: $e")),
                  );
                }
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              report['title'],
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Deskripsi:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(report['description'], style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text(
              "Tanggal Pengingat: ${formatDate(report['date'])}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
