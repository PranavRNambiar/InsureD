import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../res/palette.dart';

class ReceivePage extends StatelessWidget {
  final String str;
  const ReceivePage({@required this.str});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(),
          QrImage(
              data: str,
              version: QrVersions.auto,
              size: 300.0,
              foregroundColor: Colors.black),
          SizedBox(height: 24.0),
          Text(
            str,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: 60.0),
        ],
      ),
    );
  }
}
