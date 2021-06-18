# Flutter wit.ai Package

wit.ai is a natural language interface for statements into structured data. This package helps get a structured data from wit.ai console as per the trained utterance for Flutter. You can read a lot more about wit.ai and its documentation [here](https://wit.ai).

Feel free to hit me up with PR for any issues and further improvements for this package.

## Getting Started

Begin by importing the package into your `dart` file.

```
import 'package:flutter_witai/flutter_witai.dart';
```
Create an object wit from the package's `WitManager` option. WitManager has two parameters, namely `utterance` and `headers`.

Witin `utterance`, add your utterance text for which the data has to be generated, and within `headers` add your `Server Access Token` which can be retrieved from wit.ai settings console.

```
    final wit = WitManager(
        utterance: "hello",
        headers: "SERVER_ACCESS_TOKEN");
```

Retrieve the HTTP API, by executing 
```
wit.fetchLink();
```
To verify if the retrieval was a success, print the value of the retrieved API to the console.

To get parameters like `entities` and `traits`, simply tap into the retrieved API's entities and traits value. Other parameters can similary be retrieved and also viewed within the print of retrieved API

```
dynamic response = await wit.fetchLink();
print(response['entities]);
```