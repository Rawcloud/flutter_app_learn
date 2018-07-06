import 'package:flutter/material.dart';
//标签演示样式
enum TabsStyle {
  iconsAndText,//图标和文本
  iconsOnly,//图标
  textOnly//文本
}
//页面类
class _Page {
  _Page({
    this.icon,
    this.text,
});

  final IconData icon;
  final String text;
}

final List<_Page> _allPages = <_Page>[
  new _Page(icon: Icons.event,text: 'EVENT'),
  new _Page(icon: Icons.home,text: 'HOME'),
  new _Page(icon: Icons.android,text: 'ANDROID'),
  new _Page(icon: Icons.alarm,text: 'ALARM'),
  new _Page(icon: Icons.face,text: 'FACE'),
  new _Page(icon: Icons.language,text: 'LANGUAGE'),
];

class ScrollableTabs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ScrollableTabsState();
  }
}

class ScrollableTabsState extends State<ScrollableTabs> with SingleTickerProviderStateMixin{

  TabController _tabController;
  TabsStyle _style = TabsStyle.iconsAndText;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: _allPages.length, );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void _changeStyle(TabsStyle style){
    setState(() {
      _style = style;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).accentColor;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('可滚动的标签页'),
        actions: <Widget>[
          new PopupMenuButton<TabsStyle>(
            onSelected: _changeStyle,
              itemBuilder: (BuildContext context) => <PopupMenuItem<TabsStyle>>[
                new PopupMenuItem<TabsStyle>(
                  value: TabsStyle.iconsAndText,
                  child: new Text('图标和文本'),
                ),
                new PopupMenuItem(child: new Text('仅图标'),value: TabsStyle.iconsOnly,),
                new PopupMenuItem(child: new Text('仅文本'),value: TabsStyle.textOnly,),
              ]
          ),
        ],
        bottom: new TabBar(
          tabs: _allPages.map((_Page page){
            switch(_style) {
              case TabsStyle.iconsAndText:
                return new Tab(text: page.text,icon: new Icon(page.icon),);
              case TabsStyle.textOnly:
                return new Tab(text: page.text,);
              case TabsStyle.iconsOnly:
                return new Tab(icon: new Icon(page.icon),);
            }
          }).toList(),
          controller: _tabController,
          isScrollable: true,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: _allPages.map((_Page page){
          return new Container(
            key: new ObjectKey(page.icon),
            padding: const EdgeInsets.all(12.0),
            child: new Card(
              child: new Center(
                child: new Icon(
                  page.icon,
                  color: color,
                  size: 128.0,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}