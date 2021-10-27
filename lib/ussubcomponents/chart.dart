import 'package:flutter/material.dart';
import '../chartcomponents/MultipLineChart.dart';
import "../chartcomponents/PatternForwardHatchBarChart .dart";
import "../utility/bulletin.dart";
import "../utility/rangeslider.dart";
import '../data.dart';

class chart extends StatefulWidget {
  @override
  

  _chartState createState() => _chartState();
}

class _chartState extends State<chart> {
  late RangeValues rangevalue;
  double len = data.usconfirm[4].length.toDouble();
  List barchartdata = [];
  int count = 10;

 
  @override
  void initState() {
    rangevalue = RangeValues(0, len);
    barchartdata =
        data.getdataforchartusglobe(data.usconfirm[2], data.usfatal[2]);
  
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: data.stateName,
        builder: (BuildContext context, String value, Widget? child) {
      
          return SingleChildScrollView(
              child: Column(
            children: [
              bulletin(data.usconfirm[0], data.usconfirm[1], data.usfatal[0],
                  data.usfatal[1], "United States"),
              Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(8),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  width: 600,
                  height: 500,
                  child: MultipLineChart(
                      data.usconfirm[4],
                      data.getusaveragedata(data.usdailyconfirm[3], count),
                      data.usdailyconfirm[1],
                      rangevalue,
                      "Confirmed cases",
                      "10-day average new cases",
                      count - 1)),
              rangeslider(data.usconfirm[4], (values) {
                setState(() {
                  rangevalue = values;
                });
              }),
              Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(8),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  width: 600,
                  height: 500,
                  child: MultipLineChart(
                      data.usconfirm[4],
                      data.getusaveragedata(data.usdailyfatal[3], count),
                      data.usdailyfatal[1],
                      rangevalue,
                      "Fatal cases",
                      "10-day average new death",
                      count - 1)),
              Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(8),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  width: 600,
                  height: 500,
                  child: PatternForwardHatchBarChart(barchartdata)),
            ],
          ));
        });
  }
}
