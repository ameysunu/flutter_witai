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
  var textValue = 'null';

  void getValues() async {
    final wit = WitManager(
        utterance: searchController.text,
        headers: "TXGBHYKKFQ7BU3BMKM7IAVYO5IGGN5DE");
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
            )
          ],
        ),
      ),
    );
  }
}
