import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchRoute extends StatelessWidget {
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