import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'welcom to my zone',
      home: Scaffold(
        appBar: AppBar(
          title: Text("appbar"),
        ),
        body: Center(
          child: new RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var wordPair = new WordPair.random();
    return Text(
      wordPair.asPascalCase,
      style: TextStyle(
        color: Color(0xFFFF9000),
        fontSize: 20,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
