import 'package:demo02/Moudle/Home/HomeList.dart';
import 'package:demo02/Router.dart';
import 'package:flutter/material.dart';

void main() => runApp(BottomTab());

class BottomTab extends StatefulWidget {
  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int _index = 0;
  List<Widget> _eachView;
  @override
  void initState() {
    super.initState();
    _eachView = List();
    _eachView..add(HomeList())..add(Router());
  }

  void _centerBtnClick() {
    Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return Router();
        }));
  }

  void _changeCurrentIndex(int index) {
    if (_index == index) return;
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _eachView[_index],
        floatingActionButton: FloatingActionButton(
          onPressed: _centerBtnClick,
          child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: SizedBox(
                  height: 48,
                  width: 48,
                  child: Icon(
                    Icons.add,
                    color: Colors.lightBlueAccent,
                  ))),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            color: Colors.blue,
            shape: CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.home),
                    color: Colors.white,
                    onPressed: () => _changeCurrentIndex(0)),
                IconButton(
                    icon: Icon(Icons.contacts),
                    color: Colors.white,
                    onPressed: () => _changeCurrentIndex(1))
              ],
            )));
  }
}
