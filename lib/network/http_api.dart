import 'dart:convert';
import 'package:http/http.dart' as http;

class WitHandler {
  WitHandler({required this.utterance, required this.headers});

  final String utterance;
  final String headers;

  Future getLang() async {
    final response = await http.get(
        Uri.parse('https://api.wit.ai/language?q=$utterance'),
        headers: {'Authorization': 'Bearer $headers'});

    if (response.statusCode == 200) {
      String witResponse = response.body;
      return jsonDecode(witResponse);
    } else {
      print('Error');
    }
  }
}
