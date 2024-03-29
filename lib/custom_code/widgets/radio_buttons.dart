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

class RadioButtons extends StatefulWidget {
  const RadioButtons({
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
  _RadioButtonsState createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  String? gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: Text("Bill"),
          value: "Bill",
          groupValue: widget.initialValue,
          onChanged: (value) {
            setState(() {
              gender = value.toString();
            });
          },
        ),
        RadioListTile(
          title: Text("Table"),
          value: "Table",
          groupValue: widget.initialValue,
          onChanged: (value) {
            setState(() {
              gender = value.toString();
            });
          },
        ),
        RadioListTile(
          title: Text("Room"),
          value: "Room",
          groupValue: widget.initialValue,
          onChanged: (value) {
            setState(() {
              gender = value.toString();
            });
          },
        )
      ],
    );
  }
}
