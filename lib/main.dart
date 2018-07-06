import 'package:flutter/material.dart';
//import 'package:flutter_app_learn/views/Fdemo.dart';
import 'package:flutter_app_learn/views/ShoppingList.dart';
import 'package:flutter_app_learn/components/ShoppingListItem.dart';
//import 'package:flutter_app_learn/views/counter.dart';
//import 'package:flutter_app_learn/views/TextContainer.dart';
import 'package:flutter_app_learn/views/ImageDemo.dart';
//import 'package:flutter_app_learn/views/LayoutDemo.dart';
import 'package:flutter_app_learn/views/StackLocation.dart';
//import 'package:flutter_app_learn/views/RollingBlock.dart';
import 'views/PopupMenu.dart';
import 'views/ReadAndWrite.dart';
import 'views/ActionViewEcology.dart';
import 'views/ScrollableTabs.dart';
import 'views/MaterialCard.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
final List<Product> _kProducts = <Product>[
  new Product(name: '鸡蛋'),
  new Product(name: '面粉'),
  new Product(name: '其他'),
];

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  // ignore: must_call_super
  void initState() {
    controller = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

 @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        controller: controller,
          children: [
//            new Fdemo(),
            new PopupMenu(),
            //new ShoppingList(products: _kProducts),
            new MaterialCard(titlle: 'MaterialCard',),
//            new Counter(),
            new ReadAndWrite(),
            //new TextContainer(),
//            new ImageFromAssest(),
            new ActionViewEcology(maximumEmergy: 100,maximumHunger: 100,maximumMood: 100,currentEmergy: 30,currentHunger: 65,currentMood: 80),
            //new HorizontalLayout(),
//            new VerticalLayout(),
//            new StackLocation(),
//            new RollingBlock(),
//            new AlignDemo(),
            new ScrollableTabs(),
          ]
      ),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          controller: controller,
            tabs: [
              new Tab(text: 'fdemo',icon: new Icon(Icons.alarm),),
              new Tab(text: 'scart',icon: new Icon(Icons.shop),),
              new Tab(text: 'counter',icon: new Icon(Icons.collections),),
              new Tab(text: 'image',icon: new Icon(Icons.image),),
              new Tab(text: 'layout',icon: new Icon(Icons.layers),)
            ]
        ),
      ),
    );
  }
}
