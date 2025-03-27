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

//import 'package:syncfusion_flutter_charts/charts.dart';

class CustomFunnelChart extends StatefulWidget {
  const CustomFunnelChart({
    super.key,
    this.width,
    this.height,
    required this.dataList,
    required this.leadIncomingList,
  });

  final double? width;
  final double? height;
  final List<dynamic> dataList;
  final List<OutletLeadsRecord> leadIncomingList;

  @override
  State<CustomFunnelChart> createState() => _CustomFunnelChartState();
}

class _CustomFunnelChartState extends State<CustomFunnelChart> {
  List<_SalesData> salesdata = [];

  @override
  void initState() {
    super.initState();
    generate(widget.dataList);
  }

  // This method will update the salesdata list and trigger a rebuild
  void generate(List<dynamic> dataList) {
    List<_SalesData> newSalesData = [];
    // newSalesData.add(
    //     "New" as _SalesData, widget.leadIncomingList.length.toInt());
    for (int i = 0; i < dataList.length; i++) {
      newSalesData.add(_SalesData(dataList[i]["status"], dataList[i]["count"]));
    }

    // Use setState to update the UI with the new data
    setState(() {
      salesdata = newSalesData;
    });
  }

  @override
  void didUpdateWidget(CustomFunnelChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if the new data is different from the old data
    if (oldWidget.dataList != widget.dataList) {
      generate(widget.dataList); // Update data when it changes
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    // return Scaffold(
    //   body: Center(
    //     child: Container(
    //       child: SfFunnelChart(
    //         legend: Legend(isVisible: true),
    //         series: FunnelSeries<_SalesData, String>(
    //           dataSource: salesdata,
    //           xValueMapper: (_SalesData data, _) => data.year,
    //           yValueMapper: (_SalesData data, _) => data.sales,
    //           animationDuration: 1000,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
