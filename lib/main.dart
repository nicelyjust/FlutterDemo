import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'welcom to my zone',
      /*home: Scaffold(
        appBar: AppBar(
          title: Text("appbar"),
        ),
        body: Center(
          child: new RandomWords(),
        ),
      ),*/
      home: RandomWords(),
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
  final _suggestions = <WordPair>[];
  final _bigFont = const TextStyle(fontSize: 20);
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    /* var wordPair = new WordPair.random();
    return Text(
      wordPair.asPascalCase,
      style: TextStyle(
        color: Color(0xFFFF9000),
        fontSize: 20,
        fontStyle: FontStyle.italic,
      ),
    );*/
    // return _buildSuggestions();
    return new Scaffold(
      appBar: AppBar(
        title: Text("Startup Name Generator"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();

          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index], index.isOdd);
        });
  }

  Widget _buildRow(WordPair pair, bool isOdd) {
    var alreadySaved = _saved.contains(pair);
    return ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _bigFont,
      ),
      subtitle: new Text(isOdd ? "" : pair.asUpperCase),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: (){
        setState(() {
          if(alreadySaved){
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
  }
}
