import 'package:demo02/Utils/network_tool.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetworkUtilTest extends StatefulWidget {
  NetworkUtilTest({Key key}) : super(key: key);

  _NetworkUtilTestState createState() => _NetworkUtilTestState();
}

class _NetworkUtilTestState extends State<NetworkUtilTest> {
  _btnOnPress() {
   HttpUtil().post('journalismApi');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NetworkUtilTest"),
      ),
      body: Container(
        child: Text('test'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _btnOnPress,
        child: Icon(Icons.add),
      ),
    );
  }
}
