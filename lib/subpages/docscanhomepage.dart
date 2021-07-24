import 'package:flutter/material.dart';

class DocScanHomepage extends StatefulWidget {
  @override
  _DocScanHomepageState createState() => _DocScanHomepageState();
}

class _DocScanHomepageState extends State<DocScanHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: ElevatedButton.icon(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('Add Docs')),
    );
  }
}
