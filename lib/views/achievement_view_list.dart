import 'package:flutter/material.dart';
import '../components/achievement_view_list_item.dart';

class AchievementViewList extends StatefulWidget{

  AchievementViewList({
    this.targets,
    Key key
}): super(key: key);

  final List<Target> targets;
  @override
  State<StatefulWidget> createState() {
    return new AchievementViewListState();
  }
}

class AchievementViewListState extends State<AchievementViewList>{

  Set<Target> _achievements = new Set<Target>();

  void _achievementsChanged(Target target,bool nowTarget){
    setState(() {
      if(nowTarget){
        _achievements.add(target);
      }else{
        _achievements.remove(target);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('质感设计值列表项'),
      ),
      body: new ListView(
        children: widget.targets.map((Target target){
          return new AchievementViewItem(
            target: target,
            nowTarget: _achievements.contains(target),
            onTargetChanged: _achievementsChanged,
          );
        }).toList(),
      ),
    );
  }
}