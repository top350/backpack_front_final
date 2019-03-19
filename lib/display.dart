import 'package:flutter/material.dart';

class DisplayWidget extends StatelessWidget{
  final Color color;
  DisplayWidget(this.color);
  Widget build(BuildContext context){
    return Container(
      color: color,
    );
  }
}