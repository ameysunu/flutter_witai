import 'dart:convert';
import 'package:http/http.dart' as http;

class WitHandler {
  WitHandler({required this.utterance, required this.headers});

  final String utterance;
  final String headers;
}
