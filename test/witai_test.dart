import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_witai/flutter_witai.dart';

void main() {
  final witest = WitManager(
      params: 'message',
      utterance: "test",
      headers: "TXGBHYKKFQ7BU3BMKM7IAVYO5IGGN5DE");

  test('checks correct response from the server', () async {
    dynamic data = await witest.fetchLink();
    final utteranceResponse = data['text'];

    expect(utteranceResponse, witest.utterance);
  });
}
