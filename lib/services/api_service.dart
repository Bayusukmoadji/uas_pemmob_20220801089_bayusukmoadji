import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "http://localhost:8000/api"; // Sesuaikan dengan backend kamu

  Future<List<dynamic>> getReports() async {
    final response = await http.get(Uri.parse("$baseUrl/reports"));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load reports");
    }
  }

  Future<void> createReport(String title, String description) async {
    final response = await http.post(
      Uri.parse("$baseUrl/reports"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"title": title, "description": description}),
    );

    if (response.statusCode != 201) {
      throw Exception("Failed to create report");
    }
  }
}
