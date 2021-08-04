import 'package:flutter/material.dart';
import 'package:flutter_witai/flutter_witai.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final searchController = TextEditingController();
  dynamic response;
  dynamic languageResponse;
  var textValue = 'null';
  var language = 'No Language Detected';
  var confidence = '';

  void getValues() async {
    final wit = WitManager(
        utterance: searchController.text,
        headers: "XXXXXXXXXXX"); //Replace with SERVER ACCESS TOKEN
    final withandler =
        WitHandler(utterance: searchController.text, headers: "XXXXXXXXXXXX");
    response = await wit.fetchLink();
    languageResponse = await withandler.getLang();
    setState(() {
      textValue = response.toString();
      language =
          "Language: ${languageResponse['detected_locales'][0]['locale'].toString()}";
      confidence =
          "Confidence: ${languageResponse['detected_locales'][0]['confidence'].toString()}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('wit.ai Demo'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: searchController,
                    )),
                    TextButton(
                        onPressed: () {
                          getValues();
                        },
                        child: Icon(Icons.search))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(textValue),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(language),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(confidence),
            )
          ],
        ),
      ),
    );
  }
}
