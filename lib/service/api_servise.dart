// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://api.movieposterdb.com/v1/posters';
  final String _token = '2|orm8s8TMSQSZcziQOXZwOgmRsrsW233VqoAP5oeU';

  Future<dynamic> fetchPosters() async {
    final url = Uri.parse(_baseUrl);

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $_token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error durante la solicitud: $e');
    }
  }
}
