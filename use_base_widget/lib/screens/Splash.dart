import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = new TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 40,
    );

    return Scaffold(
      appBar: null,
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Center(
              child: Text(
                "first ",
                style: textStyle,
              )
          ),
          Center(
            child: Text(
              "second ",
              style: textStyle,
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[
                Text(
                  "third ",
                  style: textStyle,
                ),
                IconButton(
                  padding: EdgeInsets.only(top: 30),
                  icon: Icon(Icons.navigate_next),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/main");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
