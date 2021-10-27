import 'package:flutter/material.dart';
import '../chartcomponents/DashPatternLineChart.dart';
import "../utility/bulletin.dart";
import '../data.dart';

class trendingforglobe extends StatefulWidget {
  Map average;
  trendingforglobe(this.average);
  @override
  // final List pieces;
  // trending(this.pieces);

  _trendingforglobeState createState() => _trendingforglobeState();
}

class _trendingforglobeState extends State<trendingforglobe> {
  Map statedailyobj = {};
  List eachstateaverage = [];
  List truncatstate = [];
  List eachstateaveragekey = [];
  List truncatedate = [];
  @override
  void initState() {
    setState(() {
      if (widget.average.length != 0) {
        Map stateday = widget.average;
        for (var key in stateday.keys) {
          eachstateaverage = data.getusaveragedata(stateday[key],20);
          truncatstate = eachstateaverage.sublist(200);
          statedailyobj[key] = truncatstate;
          eachstateaveragekey = statedailyobj.keys.toList();
          truncatedate = data.usconfirm[4].sublist(200);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      bulletin(data.globeconfirm[0], data.globeconfirm[1], data.globefatal[0],
          data.globefatal[1], "Globe"),
      Wrap(
        alignment:WrapAlignment.center,
          children: eachstateaveragekey
              .map((x) => Column(children: [
                    Container(
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        width: 172,
                        height: 200,
                        child: DashPatternLineChart(
                            statedailyobj[x], truncatedate)),
                     Container(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 24),
                        child:  Text(
                      x,
                      style: TextStyle(
                        // color: Data.famousColor[Data.backgroundIndex.value],
                        // height: 2,
                        // fontSize: Data.fontSize[Data.fontIndex.value],
                        fontWeight: FontWeight.bold,
                        fontFamily: "font1",
                      ),
                    ))
                  ]))
              .toList()
              .cast<Widget>())
    ]));
  }
}
