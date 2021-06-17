import 'dart:convert';
import 'package:http/http.dart' as http;

class WitManager {
  WitManager({required this.utterance, required this.headers});

  final String utterance;
  final String headers;

  void fetchLink() async {
    final response = await http.get(
        Uri.parse('https://api.wit.ai/message?q=$utterance'),
        headers: {'Authorization': 'Bearer $headers'});

    if (response.statusCode == 200) {
      var witResponse = json.decode(response.body);
      print(witResponse);
    } else {
      print('Error');
    }
  }
}
