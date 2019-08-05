import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text("second page title"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return item(index, color);
        },
        itemCount: 20,
      ),
    );
  }

  Widget item(int index, Color color) {
    return new Container(
      child: Card(
        child: FlatButton(
            onPressed: () {},
            child: new Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "这是描述!",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14,
                      ),
                    ),
                    margin: EdgeInsets.only(bottom: 10),
                    alignment: AlignmentDirectional.topStart,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _buildIconButton(color, Icons.link, "10"),
                      _buildIconButton(color, Icons.not_interested, "100"),
                      _buildIconButton(color, Icons.headset_mic, "1000"),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }

  _buildIconButton(Color color, IconData link, String s) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          link,
          color: color,
        ),
        Text(
          s,
          maxLines: 1,
        )
      ],
    );
  }
}
