import 'package:flutter/material.dart';

import 'Second.dart';

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
    Widget titleSection = Container(
      padding: const EdgeInsets.only(left: 32,right: 32,top: 20,bottom: 20),
      child: Row(
        children: <Widget>[
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Oeschinen Lake Campground",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(
                  "Kandersteg, Switzerland",
                  style: TextStyle(fontWeight: FontWeight.normal,
                      color: Colors.grey[500]),
                ),
              ),
            ],
          ),
          ),
          Icon(Icons.star,color: Colors.red[500],),
          Text("41"),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;
    Widget btnSec = Row(
      mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
      children: <Widget>[
        _buildIconButton(color, Icons.call, 'CALL'),
        _buildIconButton(color, Icons.near_me, 'ROUTE'),
        _buildIconButton(color, Icons.share, 'SHARE'),

      ],
    );

    Widget txtSec = Container(
      padding: EdgeInsets.only(left: 32,right: 32,top: 20,bottom: 20),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    SnackBar snackBar = SnackBar(
      content: Text(
          "Yay! A SnackBar"
      ),
      action: SnackBarAction(
          label: "I'm a label ",
          onPressed: () {
            //do something
          }
      ),
    );

    return Scaffold(
      appBar: AppBar(
        /*Builder(builder: (BuildContext context){
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        })*/
        leading: null,
        title: Text("Example title"),
        actions: <Widget>[
          Builder(builder: (BuildContext context){
            return IconButton(
              icon: Icon(Icons.add_alert),
              onPressed: () {
                Scaffold.of(context).showSnackBar(snackBar);
              },
              tooltip: MaterialLocalizations.of(context).alertDialogLabel,
            );
          }),
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: nullFunc,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Image.asset(
            "static/images/lake.jpg",
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          btnSec,
          txtSec,
        ],
      ),
      drawer: Drawer(

        child: ListView(
          ///不加这个,状态栏显示有问题
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: new Center(
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: CircleAvatar(
                    child: Text("L"),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.blue
              ),
            ),
            ListTile(
              title: Text("item1"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("item2"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
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

Column _buildIconButton(Color color, IconData icon, String name) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(icon, color: color),
      Container(
        margin: EdgeInsets.only(top: 8),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),

    ],
  );
}



