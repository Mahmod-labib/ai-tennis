import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherPredictionRemoteDataSource {
  Future<int> getPrediction(List<int> features) async {
    final url = Uri.parse('http://10.0.2.2:5001/predict');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'features': features}),
    );

    if (response.statusCode == 200) {
      final prediction = json.decode(response.body)['prediction'][0];
      return prediction;
    } else {
      throw Exception('Failed to get prediction');
    }
  }
}
