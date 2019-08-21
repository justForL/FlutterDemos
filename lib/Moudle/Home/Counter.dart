import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterDemo extends StatefulWidget {
  CounterDemo({Key key}) : super(key: key);

  _CounterDemoState createState() => _CounterDemoState();
}

class _CounterDemoState extends State<CounterDemo> {
  int _count;
  @override
  void initState() {
    super.initState();
    _count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CountDemo"),
      ),
      body: Center(
        child: Text("{$_count}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {setState(() {
          _count++;
        });},
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() => runApp(CounterDemo());
