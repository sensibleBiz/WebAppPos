// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class RadioButtonsCopy extends StatefulWidget {
  const RadioButtonsCopy({
    Key? key,
    this.width,
    this.height,
    required this.list,
    required this.initialValue,
  }) : super(key: key);

  final double? width;
  final double? height;
  final PremisesRecord list;
  final String initialValue;

  @override
  _RadioButtonsCopyState createState() => _RadioButtonsCopyState();
}

class _RadioButtonsCopyState extends State<RadioButtonsCopy> {
  String? _cValue = FFAppState().Bill;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: Text("Bill"),
          value: "Bill",
          groupValue: _cValue,
          onChanged: (String? value) {
            setState(() {
              _cValue = value;
            });
          },
        ),
        RadioListTile(
          title: Text("Table"),
          value: "Table",
          groupValue: _cValue,
          onChanged: (String? value) {
            setState(() {
              _cValue = value;
            });
          },
        ),
        RadioListTile(
          title: Text("Other"),
          value: "Other",
          groupValue: _cValue,
          onChanged: (String? value) {
            setState(() {
              _cValue = value;
            });
          },
        )
      ],
    );
  }
}
