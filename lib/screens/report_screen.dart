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
      appBar: AppBar(
        title: Text(
          "Aplikasi Pengingat Sebelum Anda Pergi Belanja",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade700, // Warna hijau sesuai tema
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            reports =
                apiService.getReports(); // Refresh data saat swipe ke bawah
          });
        },
        child: FutureBuilder<List<dynamic>>(
          future: reports,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Terjadi kesalahan: ${snapshot.error}",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.warning_amber_rounded,
                        size: 60, color: Colors.orange),
                    SizedBox(height: 10),
                    Text(
                      "Belum ada laporan!",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Tambahkan laporan baru dengan menekan tombol +",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var report = snapshot.data![index];
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(12),
                    leading: CircleAvatar(
                      backgroundColor: Colors.green.shade100,
                      child: Icon(Icons.receipt_long,
                          color: Colors.green.shade700),
                    ),
                    title: Text(
                      report['title'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      report['description'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black87),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 18, color: Colors.grey),
                    onTap: () {
                      // Tambahkan aksi jika ingin melihat detail laporan
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddReportScreen()),
          );

          if (result == true) {
            setState(() {
              reports = apiService
                  .getReports(); // Refresh data jika laporan berhasil ditambahkan
            });
          }
        },
        backgroundColor: Colors.green.shade700,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
