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
  dynamic newResponse;
  var textValue = 'null';
  var httpHandlers = 'null';

  void getValues() async {
    final wit = WitManager(
        utterance: searchController.text,
        params: 'message',
        headers: "XXXXXXXXXXX"); //Replace with SERVER ACCESS TOKEN
    response = await wit.fetchLink();
    setState(() {
      textValue = response.toString();
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
          ],
        ),
      ),
    );
  }
}
