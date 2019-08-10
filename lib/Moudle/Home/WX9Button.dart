import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(WX9Button());

class WX9Button extends StatefulWidget {
  @override
  _WX9ButtonState createState() => _WX9ButtonState();
}

class _WX9ButtonState extends State<WX9Button> {
  List<Widget> _list;
  @override
  void initState() {
    super.initState();
    _list = List<Widget>()..add(buildAddBtn());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("微信九宫格Demo"),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height * 0.5 ,
            color: Colors.grey,
            child: Wrap(
              children: _list,
              spacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAddBtn() {
    _onPress() {
      if (_list.length < 9) {
        setState(() {
          _list.insert(_list.length - 1, buildPhotoBtn());
        });
      }
    }

    return GestureDetector(
      onTap: _onPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100,
          height: 100,
          color: Colors.black54,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildPhotoBtn() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.amber,
        child: Text("照片"),
      ),
    );
  }
}
