import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "My app",
      home: TutorialHome(),
    ));
/// 脚手架内置了app的一些基本组件,当然可以自己实现
class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      ///列组件
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              "Example title",
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          Expanded(
            child: Center(
              child: Text("Hello world"),
            ),
          )
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(color: Colors.blue),
      /// 行组件
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: null
          ),
          Expanded(
              child: title
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: null
          )
        ],
      ),
    );
  }

  MyAppBar({@required this.title});
}

class TutorialHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: nullFunc,
        ),
        title: Text("Example title"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              tooltip: "Search",
              onPressed: nullFunc,
          ),
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: nullFunc,
          )
        ],
      ),
      body: Center(
        child: Text("Hello world"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "add",
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return SearchRoute();
              })
          );
        },
      ),
    );
  }


  void nullFunc() {
  }
}

class SearchRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("second page title"),
      ),
      body: Center(
        child: Text("second page body"),
      ),
    );
  }

}
