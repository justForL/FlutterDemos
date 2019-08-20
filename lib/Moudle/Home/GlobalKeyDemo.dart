import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(GlobalKeyDemo());

class GlobalKeyDemo extends StatefulWidget {
  GlobalKeyDemo({Key key}) : super(key: key);
  @override
  _GlobalKeyDemoState createState() => _GlobalKeyDemoState();
}

class _GlobalKeyDemoState extends State<GlobalKeyDemo> {
  final GlobalKey<_SwitcherState> key = GlobalKey<_SwitcherState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GlobalKeyDemo"),
      ),
      body: Container(
        child: Center(
          child: Switcher(
            key: key,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          key.currentState.changeState();
        },
        child: Text(
          "切换",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class Switcher extends StatefulWidget {
  Switcher({Key key}) : super(key: key);
  @override
  _SwitcherState createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  bool _isOn = false;

  _onChange(value) {
    setState(() {
      _isOn = value;
    });
  }

  changeState() {
    setState(() {
      _isOn = !_isOn;
    });
  }

  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: _isOn,
      onChanged: _onChange,
      activeColor: Colors.blueAccent,
    );
  }
}
