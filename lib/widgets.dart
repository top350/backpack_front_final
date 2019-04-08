import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = AssetImage('assets/logo.png');
    var image = Image(image: assetsImage, width: 300.0, height: 300.0);
    return Container(child: image);
  }
}