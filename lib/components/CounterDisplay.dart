import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {

  CounterDisplay(this.count);

  final int count;
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('按钮点击 $count 次！'),
    );
  }
}