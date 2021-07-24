import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

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
          onPressed: () async {
            FilePickerResult result = await FilePicker.platform.pickFiles();

            if (result != null) {
              File file = File(result.files.single.path);
            } else {
              // User canceled the picker
            }
          },
          icon: Icon(Icons.add),
          label: Text('Add Docs')),
    );
  }
}
