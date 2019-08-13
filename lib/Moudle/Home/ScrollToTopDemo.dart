import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ScrollToTopDemo());

class ScrollToTopDemo extends StatefulWidget {
  @override
  State createState() => _ScrollToTopDemoState();
}

class _ScrollToTopDemoState extends State<ScrollToTopDemo> {
  ScrollController _listViewController;

  @override
  void initState() {
    super.initState();
    _listViewController = ScrollController();
  }

  void _floatButtonClick() {
    if (_listViewController.offset != 0) {
      _listViewController.animateTo(0,duration:Duration(seconds: 1),curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_drop_up),
        onPressed: _floatButtonClick,
      ),
      appBar: AppBar(
        title: Text("ScrollToTopDemo"),
      ),
      body: ListView.builder(
        controller: _listViewController,
        itemCount: 30,
        itemBuilder: (context, index) {
          return ListTile(
              title: Center(
            child: Text("$index"),
          ));
        },
      ),
    );
  }
}
