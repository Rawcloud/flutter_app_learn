import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('图片控件基础'),
      ),
      body: new Center(
        child: new Image.network(//加载网络资源
          'http://pic.baike.soso.com/p/20130828/20130828161137-1346445960.jpg',
          scale: 1.5,
        ),
      ),
    );
  }
}

class ImageFromAssest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('本地图片'),
      ),
      body: new Center(
        //child: new Image.asset('images/flutter.png'),
        child: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage('images/flutter.png')),
          ),
        ),
      ),
    );
  }
}