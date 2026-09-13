import 'dart:convert';
import 'package:http/http.dart' as http;

class NasaService {
  Future<Map<String, dynamic>> getApod() async {
    const apiKey = String.fromEnvironment('NASA_API_KEY');

    final url = Uri.parse(
      'https://api.nasa.gov/planetary/apod?api_key=$apiKey',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erro ao buscar dados da NASA: ${response.statusCode}');
    }
  }
}
