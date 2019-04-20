import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerator extends StatefulWidget {
  String input;
  QrGenerator(this.input);
  @override
  _QrGeneratorState createState() => _QrGeneratorState(input);
}

class _QrGeneratorState extends State<QrGenerator> {
  String input;
  _QrGeneratorState(this.input);


  @override
  Widget build(BuildContext context) {
    return _contentWidget();
  }

  @override
  void didUpdateWidget(QrGenerator oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  Widget _contentWidget() {
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: QrImage(
            data: input,
            gapless: false,
            foregroundColor: const Color(0xFF111111),
          ),
        ),
      ),
    );
  }
}
