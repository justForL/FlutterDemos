import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(ScrollBottomBar());

class ScrollBottomBar extends StatefulWidget {
  @override
  State createState() => _ScrollBottomBarState();
}

class _ScrollBottomBarState extends State<ScrollBottomBar>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    _scrollController = ScrollController(keepScrollOffset: true)
      ..addListener(_judgeScroll);
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _scrollController..removeListener(_judgeScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollBottomBar"),
      ),
      body: _buildListView(),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

    void _judgeScroll() {
    if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
      _animationController.forward();
    }

    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      _animationController.reverse();
    }
  }

  Widget _buildListView() {
    return ListView.builder(
        itemCount: 30,
        controller: _scrollController,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("this is No.$index"),
          );
        });
  }

  Widget _buildBottomBar(BuildContext context) {
    int _index = 0;
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          height: 0.0,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                bottom: _animation.value,
                left: 0.0,
                right: 0.0,
                child: child,
              )
            ],
          ),
        );
      },
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.title), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.title), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.title), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.title), title: Text("Home")),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
      ),
    );
  }


}
