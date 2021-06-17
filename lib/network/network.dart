import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkManager {
  NetworkManager({required this.headers});

  final String headers;

  void fetchLink() async {
    final response = await http.get(
        Uri.parse('https://api.wit.ai/message?v=20210507&q=hello'),
        headers: {'Authorization': 'Bearer $headers'});

    if (response.statusCode == 200) {
      print(json.decode(response.body));
    } else {
      print('Error');
    }
  }
}
