import 'package:flutter/material.dart';
import '../chartcomponents/MultipLineChart.dart';
import "../chartcomponents/PatternForwardHatchBarChart .dart";
import '../utility/bulletin.dart';
import '../utility/selsectbox.dart';
import "../utility/rangeslider.dart";
import '../data.dart';

class statechart extends StatefulWidget {
  final int myIndex;
  statechart(this.myIndex);
  @override
  _statechartState createState() => _statechartState();
}

class _statechartState extends State<statechart> {
  List<String> stateconfirmkey = [];
  late RangeValues rangevalue;
  double len = data.usconfirm[4].length.toDouble();
  List barchartdata = [];
  int count = 10;

  @override
  void initState() {
    rangevalue = RangeValues(0, len);
    if (data.usconfirm.length != 0) {
      setState(() {
        stateconfirmkey = (data.usconfirm[2].keys.cast<String>()).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: data.stateName,
        builder: (BuildContext context, String value, Widget? child) {
          if (data.usarea.indexOf(data.stateName.value) < 0) {
            barchartdata = data.getdataforstatecountry(
                data.usconfirm[2][data.stateName.value],
                data.usfatal[2][data.stateName.value],
                data.stateName.value);
          }
          return SingleChildScrollView(
              child: Column(
            children: [
              bulletin(
                  data.usconfirm[2][data.stateName.value]["total"][0],
                  data.usconfirm[2][data.stateName.value]["total"][1],
                  data.usfatal[2][data.stateName.value]["total"][0],
                  data.usfatal[2][data.stateName.value]["total"][1],
                  data.stateName.value),
              selsectbox(
                stateconfirmkey,widget.myIndex
              ),
              Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(8),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  width: 600,
                  height: 500,
                  child: MultipLineChart(
                      data.usconfirm[4],
                      data.getusaveragedata(
                          data.usdailyconfirm[2][data.stateName.value], count),
                      data.usdailyconfirm[0][data.stateName.value],
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
                      data.getusaveragedata(
                          data.usdailyfatal[2][data.stateName.value], count),
                      data.usdailyfatal[0][data.stateName.value],
                      rangevalue,
                      "Fatal cases",
                      "10-day average new death",
                      count - 1)),
              if (data.usarea.indexOf(data.stateName.value) < 0)
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
