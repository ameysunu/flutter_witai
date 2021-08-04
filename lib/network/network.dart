import 'dart:convert';
import 'package:http/http.dart' as http;

class WitManager {
  WitManager(
      {required this.utterance, required this.headers, required this.params});

  final String utterance;
  final String headers;
  final String params;

  Future fetchLink() async {
    final response = await http.get(
        Uri.parse('https://api.wit.ai/$params?q=$utterance'),
        headers: {'Authorization': 'Bearer $headers'});

    if (response.statusCode == 200) {
      String witResponse = response.body;
      return jsonDecode(witResponse);
    } else {
      print('Error');
    }
  }
}
