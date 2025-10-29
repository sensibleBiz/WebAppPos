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

//import 'package:syncfusion_flutter_charts/charts.dart';
//import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class CustomlChart extends StatefulWidget {
  const CustomlChart({
    super.key,
    this.width,
    this.height,
    required this.data,
  });

  final double? width;
  final double? height;
  final List<dynamic> data;

  @override
  State<CustomlChart> createState() => _CustomlChartState();
}

class _CustomlChartState extends State<CustomlChart> {
  @override
  List<_ChartData> chartData = [
    _ChartData('Completed', 10, Colors.green),
    _ChartData('Nurturing', 20, Colors.yellow),
    _ChartData('Qualified', 60, Colors.blue),
    _ChartData('New', 100, Colors.orangeAccent)

    //_SalesData('May', 40)
  ];
  dynamic returnData(List<LeadsManagementRecord> data) {
    for (int i = 0; i < data.length; i++) {}
  }

  @override
  Widget build(BuildContext context) {
    //   return Scaffold(
    //       body: Center(
    //           child: Container(
    //               child: SfCircularChart(
    //                   legend: Legend(
    //                       isVisible: true,
    //                       // Legend will be placed at the left
    //                       position: LegendPosition.left),
    //                   series: <CircularSeries>[
    //         // Render pie chart
    //         PieSeries<_ChartData, String>(
    //             dataSource: chartData,
    //             pointColorMapper: (_ChartData data, _) => data.color,
    //             xValueMapper: (_ChartData data, _) => data.x,
    //             yValueMapper: (_ChartData data, _) => data.y)
    //       ]))));
    // }
    return Container();
  }
}

class _ChartData {
  _ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
