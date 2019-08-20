import 'package:flutter/material.dart';

class AnimationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 40,
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [BoxShadow(color: Colors.grey)],
      ),
      child: Text(
        "Press Me",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
