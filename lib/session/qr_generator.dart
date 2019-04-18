import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerator extends StatefulWidget {
  @override
  _QrGeneratorState createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {

  String _dataString = 'abcd';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Generate'),
      ),
      body: _contentWidget(),
      resizeToAvoidBottomPadding: true,
    );
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
            data: _dataString,
            gapless: false,
            foregroundColor: const Color(0xFF111111),
          ),
        ),
      ),
    );
  }
}
