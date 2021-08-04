# Flutter wit.ai Package

[![Codemagic build status](https://api.codemagic.io/apps/60cd6d74ab51634d70139dae/60cd6d74ab51634d70139dad/status_badge.svg)](https://codemagic.io/apps/60cd6d74ab51634d70139dae/60cd6d74ab51634d70139dad/latest_build)

wit.ai is a natural language interface for statements into structured data. This package helps get a structured data from wit.ai console as per the trained utterance for Flutter. You can read a lot more about wit.ai and its documentation [here](https://wit.ai).

Feel free to hit me up with PR for any issues and further improvements for this package.

## Getting Started

Begin by importing the package into your `dart` file.

```
import 'package:flutter_witai/flutter_witai.dart';
```
Create an object wit from the package's `WitManager` option. WitManager has three parameters, namely  `params`, `utterance` and `headers`.

Within `utterance`, add your utterance text for which the data has to be generated, and within `headers` add your `Server Access Token` which can be retrieved from wit.ai settings console. `params` is the GET parameter for accessing various HTTP APIs. Various parameters for the retrieval of HTTP API can be viewed below.

```
    final wit = WitManager(
        params: "message"
        utterance: "hello",
        headers: "SERVER_ACCESS_TOKEN");
```

Retrieve the HTTP API, by executing 
```
wit.fetchLink();
```
To verify if the retrieval was a success, print the value of the retrieved API to the console.

```
dynamic response = await wit.fetchLink();
print(response);
```

## HTTP API Parameters

* **message** : Used to retrieve the extracted meaning from a sentence.
* **language** : Returns the top detected locales for the text message.
* **intents** : Retrieve the list of all the intents.
* **entities** : Returns the list of all entities.
* **traits** : Returns the list of all traits.

## Screenshots

<img src= "https://i.imgur.com/JaEqFjx.png" width="414" height="896" > 