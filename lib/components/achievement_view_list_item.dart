import 'package:flutter/material.dart';

class Target {
  const Target({
    this.name,
    this.reward,
});
  final String name;
  final String reward;
}

typedef void TargetChangedCallbak(
    Target target,
    bool nowTarget,
    );

class AchievementViewItem extends StatelessWidget{

  AchievementViewItem({
    Target target,
    this.nowTarget,
    this.onTargetChanged,
}) :target = target, super(key: new ObjectKey(target));

  final Target target;
  final bool nowTarget;
  final TargetChangedCallbak onTargetChanged;

  Color _getColor(BuildContext context){
    return nowTarget ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getNameTextStyle(BuildContext context){
    if(!nowTarget) return new TextStyle(
      fontSize: 16.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    return new TextStyle(
      fontSize: 16.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.lineThrough,
    );
  }

  TextStyle _getRewardTextStyle(BuildContext context){
    if(!nowTarget) return new TextStyle(
      fontSize: 13.0,
      color: Colors.black,
    );
    return new TextStyle(
      fontSize: 13.0,
      color: Colors.black54,
      decoration: TextDecoration.lineThrough
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new ListTile(
          onTap: (){
            onTargetChanged(target,!nowTarget);
          },
          leading: new CircleAvatar(
            backgroundColor: _getColor(context),
            child: new Text(target.name[0]),
          ),
          title: new Text(
            target.name,
            style: _getNameTextStyle(context),
          ),
          subtitle: new Text(
            target.reward,
            style: _getRewardTextStyle(context),
          ),
        ),
      ],
    );
  }
}