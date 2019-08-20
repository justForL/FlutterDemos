import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const btnWidth = 240.0;
const btnHeight = 40.0;
void main() => runApp(AnimationButtonDemo());

class AnimationButtonDemo extends StatefulWidget {
  @override
  State createState() => _AnimationButtonDemoState();
}

class _AnimationButtonDemoState extends State<AnimationButtonDemo>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addStatusListener(_animationStatusListen);
    _animation = Tween(begin: btnWidth, end: btnHeight).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.250)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _animationStatusListen(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      //  _controller.reverse();
      Future.delayed(Duration(milliseconds: 2000),(){
        _controller.reverse();
      });
    }
  }

  Future<Null> _playAnimation() async {
    try {
      _controller.forward();
    } on TickerCanceled {}
  }

  Widget _buildLoginBtn(BuildContext context, Widget child) {
    var loading = _currentLoadingOrText();
    return Center(
      child: InkWell(
        onTap: () {
          _playAnimation();
        },
        child: Container(
          width: _animation.value,
          height: btnHeight,
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [BoxShadow(color: Colors.grey)],
          ),
          child: loading,
        ),
      ),
    );
  }

  Widget _currentLoadingOrText() {
    return _animation.value <= btnHeight * 2
        ? Container(padding: EdgeInsets.all(5),child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
            strokeWidth: 0.5,
          ),)
        : Text(
            "Press Me",
            style: TextStyle(color: Colors.white),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AnimationButtonDemo"),
        ),
        body: AnimatedBuilder(
          animation: _controller,
          builder: _buildLoginBtn,
        ));
  }
}
