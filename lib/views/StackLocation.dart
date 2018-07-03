import 'package:flutter/material.dart';
class StackLocation extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('层叠定位布局'),
      ),
      body: new Center(
        child: new Stack(
          children: <Widget>[
            new Image.network('http://img2.cxtuku.com/00/13/12/s97783873391.jpg'),
            new Positioned(
              left: 35.0,
              top: 55.0,
              right: 35.0,
              child: new Text(
                'Whatever is worth doing is worth doing well. O(∩_∩)O~',
                style: new TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'serif'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlignDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('align demo'),
      ),
      body: new Stack(
        children: <Widget>[
          new Align(
            alignment: FractionalOffset(0.0, 0.0),
            child: new SizedBox(
              width: 50.0,
              height: 50.0,
              child: new Image.asset('images/元宵.jpg',),
            ),
          ),
          new Align(
            alignment: FractionalOffset.bottomRight,
            child: new Image.asset('images/flutter.png'),
          ),
          new Align(
            alignment: FractionalOffset.center,
            child: new AspectRatio(aspectRatio: 0.3/0.2,
            child: new Image.asset('images/1.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}