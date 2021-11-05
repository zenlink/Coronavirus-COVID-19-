import 'package:flutter/material.dart';
import '../chartcomponents/DashPatternLineChart.dart';
import '../utility/bulletin.dart';
import '../data.dart';

class trending extends StatefulWidget {

  @override
  

  _trendingState createState() => _trendingState();
}

class _trendingState extends State<trending> {
  Map statedailyobj = {};
  List eachstateaverage = [];
  List truncatstate = [];
  List eachstateaveragekey = [];
  List truncatedate = [];
  @override
  void initState() {
    setState(() {
      if (data.usdailyconfirm.length != 0) {
        Map stateday = data.usdailyconfirm[2];
        for (var key in stateday.keys) {
          eachstateaverage = data.getusaveragedata(stateday[key], 20);
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
            bulletin(data.usconfirm[0], data.usconfirm[1], data.usfatal[0],
                  data.usfatal[1], "United States"),
          Container(
            padding: EdgeInsets.only(bottom: 16),
            child:Text("20-Day Average New Cases",
          style:TextStyle(
            fontSize: 20,
            color:Colors.green,
          backgroundColor: Colors.yellow.shade300
          )
          )),
          Wrap(
              alignment:WrapAlignment.center,
            children: eachstateaveragekey
                .map((x) => Column(children: [
                      Container(
                         margin: EdgeInsets.all(2),
                  padding: EdgeInsets.all(4),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                          width: 172,
                          height: 200,
                          child: DashPatternLineChart(
                              statedailyobj[x], truncatedate)),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 24),
                        child: Text(
                        x,
                        style: TextStyle(
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
