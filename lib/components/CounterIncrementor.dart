import 'package:flutter/material.dart';

class CounterIncrementor extends StatelessWidget {

  CounterIncrementor(this.onPressed);

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return new FloatingActionButton(
        onPressed: onPressed,
        tooltip: '增加',
        child: new Icon(Icons.add),
    );
  }
}