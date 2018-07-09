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
import 'views/achievement_view_list.dart';
import 'components/achievement_view_list_item.dart';
import 'views/test.dart';
import 'views/DirectInput.dart';
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

final List<Target> _kTargets = <Target>[
  new Target(name: '生存100天', reward: "金钱￥2500\t最高能量+20"),
  new Target(name: '大学毕业', reward: "获得毕业学位\t金钱￥5000\t最高情绪+30"),
  new Target(name: '获得￥5000', reward: "获得信用卡"),
  new Target(name: '购买廉价的公寓', reward: "最高能量+60\t最高饥饿度+30"),
  new Target(name: '购买普通的公寓', reward: "最高能量+80\t最高饥饿度+50"),
  new Target(name: '生存100天', reward: "金钱￥2500\t最高能量+20"),
  new Target(name: '大学毕业', reward: "获得毕业学位\t金钱￥5000\t最高情绪+30"),
  new Target(name: '获得￥5000', reward: "获得信用卡"),
  new Target(name: '购买廉价的公寓', reward: "最高能量+60\t最高饥饿度+30"),
  new Target(name: '购买普通的公寓', reward: "最高能量+80\t最高饥饿度+50"),
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
//            new PopupMenu(),
            new AchievementViewList(targets: _kTargets,),
            //new ShoppingList(products: _kProducts),
            new MaterialCard(titlle: 'MaterialCard',),
//            new Counter(),
//            new ReadAndWrite(),
            new ContainerWidget(),
            //new TextContainer(),
//            new ImageFromAssest(),
//            new ActionViewEcology(maximumEmergy: 100,maximumHunger: 100,maximumMood: 100,currentEmergy: 30,currentHunger: 65,currentMood: 80),
            new DirectInput(),
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
