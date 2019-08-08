import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Router extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Router"),
      ),
      body: Center(child: Text("this is RouterDemo")),
    );
  }
}
