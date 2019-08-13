import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(ExpentionDemo());

class ExpentionDemo extends StatefulWidget {
  @override
  State createState() => _ExpentionDemoState();
}

class _ExpentionDemoState extends State<ExpentionDemo> {
  List<ExpantionDemoBean> _expandStateList;
  List<int> _mList;
  int _currentPanelIndex = -1;

  @override
  void initState() {
    super.initState();
    _expandStateList = List();
    _mList = List();
    for (var i = 0; i < 20; i++) {
      _mList.add((i));
      _expandStateList.add(ExpantionDemoBean(i, false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ExpensionDemo")),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, bol) {
            setState(() {
              _expandStateList[index].isOpen = !_expandStateList[index].isOpen;
            });
          },
          children: _expandStateList.map((ExpantionDemoBean item) {
            return ExpansionPanel(
                body: ListTile(
                  title: Text(item.index.toString()),
                ),
                isExpanded: item.isOpen,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text('this is the ' + item.index.toString() + ' item'),
                  );
                });
          }).toList(),
        ),
      ),
    );
  }
}

class ExpantionDemoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ExpansionTile(
        title: Text("james"),
        // initiallyExpanded: true,
        // leading: Icon(Icons.add),
        trailing: Icon(Icons.menu),
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print("onTap");
            },
            child: ListTile(
              title: Text('title'),
              subtitle: Text("desc"),
            ),
          )
        ],
      ),
    );
  }
}

class ExpantionDemoBean {
  bool isOpen;
  int index;
  ExpantionDemoBean(this.index, this.isOpen);
}
