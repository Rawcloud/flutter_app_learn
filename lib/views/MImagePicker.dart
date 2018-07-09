import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MImagePicker extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new MImagePickerState();
  }
}

class MImagePickerState extends State<MImagePicker>{

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery,maxWidth: 300.0,maxHeight: 400.0);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('图片选取'),
      ),
      body: new Center(
        child: _image == null ? new Text('未选取照片'): new Image.file(_image),
      ),
      floatingActionButton: new FloatingActionButton(onPressed: getImage,
      tooltip: '选取图片',
      child: new Icon(Icons.image),),
    );
  }
}