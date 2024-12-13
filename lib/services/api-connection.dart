import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:barbershop_app/constants.dart';
import 'package:test/test.dart';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<dynamic> get(String endpoint) async {
    final url = Uri.https('$baseUrl', '$endpoint');
    try {
      final response = await http.get(url);
      return _processResponse(response);
    } catch (e) {
      throw Exception('Failed to GET data: $e');
    }
  } 

  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.https('$baseUrl', '$endpoint');
    print(url);
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      print('Status Code: ${response.statusCode}');
      print('Response: ${response.body}');
      return _processResponse(response);
    } 
      catch (e) {
        throw Exception('Failed to POST data: $e');
    }
  }

  dynamic _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error: ${response.statusCode} - ${response.body}');
    }
  }
}