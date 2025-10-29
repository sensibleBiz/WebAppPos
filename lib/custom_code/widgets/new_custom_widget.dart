// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class NewCustomWidget extends StatefulWidget {
  const NewCustomWidget({
    super.key,
    this.width,
    this.height,
    required this.selectedItem,
    required this.doc,
    required this.changeEvent,
  });

  final double? width;
  final double? height;
  final String selectedItem;
  final List<TeamTreeRecord> doc;
  final Future Function(String value) changeEvent;

  @override
  State<NewCustomWidget> createState() => _NewCustomWidgetState();
}

class _NewCustomWidgetState extends State<NewCustomWidget> {
  late String selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedItem.isNotEmpty ? selectedItem : null,
      onChanged: (String? newValue) async {
        if (newValue != null) {
          setState(() {
            selectedItem = newValue;
            FFAppState().selectedItem = newValue;
          });

          await widget.changeEvent(newValue);
        }
      },
      items: widget.doc.map((TeamTreeRecord item) {
        IconData iconData;
        Color iconColor;

        switch (item.workMode) {
          case "AVAILABLE":
            iconData = Icons.check_circle;
            iconColor = Colors.green;
            break;
          case "AWAY":
            iconData = Icons.pause_circle_filled;
            iconColor = Colors.orange;
            break;
          case "BUSY":
            iconData = Icons.error;
            iconColor = Colors.red;
            break;
          case "NOT_AVAILABLE":
            iconData = Icons.close_rounded;
            iconColor = Colors.black;
            break;
          default:
            iconData = Icons.person;
            iconColor = Colors.grey;
        }

        return DropdownMenuItem<String>(
          value: item.userProfileId, // Store only the ID as value
          child: Row(
            children: [
              Icon(iconData, size: 25, color: iconColor),
              SizedBox(width: 10),
              Text(item.userName), // Display Name
            ],
          ),
        );
      }).toList(),
    );
  }
}
