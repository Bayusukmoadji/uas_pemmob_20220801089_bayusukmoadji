import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "http://localhost:8000/api"; // Sesuaikan dengan backend

  Future<List<dynamic>> getReports() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/reports"));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception("Gagal memuat laporan: ${response.statusCode}");
      }
    } catch (e) {
      return [];
    }
  }

  Future<void> createReport(
      String title, String description, String date) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/reports"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "title": title,
          "description": description,
          "date": date,
        }),
      );

      if (response.statusCode != 201) {
        throw Exception("Gagal menambahkan laporan: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Terjadi kesalahan saat mengirim laporan: $e");
    }
  }

  Future<void> deleteReport(int id) async {
    try {
      final response = await http.delete(Uri.parse("$baseUrl/reports/$id"));

      if (response.statusCode != 200) {
        throw Exception("Gagal menghapus laporan: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Terjadi kesalahan saat menghapus laporan: $e");
    }
  }
}
