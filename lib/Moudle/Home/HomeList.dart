import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(HomeList());

class HomeList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeList"),
      ),
      body: Center(
        child: Text("ListView"),
      ),
    );
  }
}
