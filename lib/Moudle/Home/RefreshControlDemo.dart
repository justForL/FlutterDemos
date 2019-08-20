import 'package:demo02/Moudle/Home/HomeList.dart';
import 'package:demo02/Moudle/Home/WX9Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(RefreshControlDemo());

class RefreshControlDemo extends StatefulWidget {
  @override
  State createState() => _RefreshControlDemoState();
}

class _RefreshControlDemoState extends State<RefreshControlDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RefreshControlDemo"),
      ),
      body: Container(
        child: Center(
          child: _buildListView(),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return GestureDetector(
              child: ListTile(
                title: Text('item $index'),
              ),
              onTap: () {
                
              });
        });
  }
}
