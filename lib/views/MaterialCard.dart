import 'package:flutter/material.dart';

const String _explanatoryText =
    "当Scaffold的浮动操作按钮改变时，新按钮消失并变成视图。"
    "在这个Demo中，更改选项卡会导致应用程序与浮动操作按钮重建，"
    "Scaffold通过键值与其他区分。";

class _Page {
  _Page({
    this.label,
    this.colors,
    this.icon,
});
  final String label;
  final MaterialColor colors;
  final IconData icon;
  Color get labelColor => colors != null ? colors[300] : Colors.grey[300];
  bool get fabDefined => colors !=null && icon != null;
  Color get fabColor => colors[400];
  Icon get fabIcon => new Icon(icon);
  Key get fabKey => new ValueKey<Color>(fabColor);
}

final List<_Page> _allPages = <_Page>[
  new _Page(label: '蓝色',colors: Colors.indigo,icon: Icons.add),
  new _Page(label: '绿色', colors: Colors.green, icon: Icons.create),
  new _Page(label: '空白'),
  new _Page(label: '蓝绿色', colors: Colors.teal, icon: Icons.add),
  new _Page(label: '红色', colors: Colors.red, icon: Icons.create),
];

class MaterialCard extends StatefulWidget{
  MaterialCard({Key key,this.titlle}) : super(key: key);
  final String titlle;
  @override
  State<StatefulWidget> createState() {
    return new MaterialCardState();
  }
}

class MaterialCardState extends State<MaterialCard> with SingleTickerProviderStateMixin{
  //应用的唯一值，Scaffold的状态
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController _controller;
  //局部变量，选择页面
  _Page _selectedPage;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: _allPages.length, vsync: this);
    //每次动画的值更改时调用监听器
    _controller.addListener(_handleTabSelection);
    _selectedPage = _allPages[0];
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  //处理选项卡选择的函数
  void _handleTabSelection(){
    setState(() {
      _selectedPage = _allPages[_controller.index];
    });
  }

  //显示说明文本
  void _showExplanatoryTex(){
    _scaffoldKey.currentState.showBottomSheet<Null>(
        (BuildContext context){
          return new Container(
            decoration: new BoxDecoration(
              border: new Border(top: new BorderSide(color: Theme.of(context).dividerColor)),
            ),
            child: new Padding(
              padding: const EdgeInsets.all(32.0),
              child: new Text(_explanatoryText),
            ),
          );
        }
    );
  }

  Widget buildTabView(_Page page){
    return new Builder(
      builder: (BuildContext context){
        return new Container(
          key: new ValueKey(page.label),
          padding: const EdgeInsets.fromLTRB(48.0, 48.0, 48.0, 96.0),
          child: new Card(
            child: new Center(
              child: new Text(
                page.label,
                style: new TextStyle(
                  color: page.labelColor,
                  fontSize: 32.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text(widget.titlle),
        bottom: new TabBar(
          controller: _controller,
          tabs: _allPages.map((_Page page){
            return new Tab(
              text: page.label,
            );
          }).toList(),
        ),
      ),
      floatingActionButton: !_selectedPage.fabDefined ? null : new FloatingActionButton(
        key: _selectedPage.fabKey,
        tooltip: '显示说明',
        backgroundColor: _selectedPage.fabColor,
        child: _selectedPage.fabIcon,
        onPressed: _showExplanatoryTex,
      ),
      body: new TabBarView(
        controller: _controller,
        children: _allPages.map(buildTabView).toList(),
      ),
    );
  }
}