import 'package:flutter/material.dart';
import '../chartcomponents/MultipLineChart.dart';
import "../chartcomponents/PatternForwardHatchBarChart .dart";
import "../utility/bulletin.dart";
import "../utility/rangeslider.dart";
import '../data.dart';

class chartforglobe extends StatefulWidget {
  @override
  _chartforglobeState createState() => _chartforglobeState();
}

class _chartforglobeState extends State<chartforglobe> {
  late RangeValues rangevalue;
  double len = data.usconfirm[4].length.toDouble();
  List barchartdata = [];
    int count = 10;
  @override
  void initState() {
    rangevalue = RangeValues(0, len);
    barchartdata =
        data.getdataforchartusglobe(data.globeconfirm[2], data.globefatal[2]);
    // setState(() {
    //   if (data.usdailyconfirm.length != 0) {
    //     data.averageconfirm = data.getusaveragedata(data.usdailyconfirm[3]);
    //   }
    //   if (data.usdailyfatal.length != 0) {
    //     data.averagefatal = data.getusaveragedata(data.usdailyfatal[3]);
    //   }
    // });
    // print(data.averageconfirm);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        bulletin(data.globeconfirm[0], data.globeconfirm[1], data.globefatal[0],
            data.globefatal[1], "Globe"),
        Container(
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            width: 600,
            height: 500,
            child: MultipLineChart(
                data.usconfirm[4],
                 data.getusaveragedata(data.globedailyconfirm[3],count),
                data.globedailyconfirm[1],
                rangevalue,
                "Confirmed cases",
                "10-day average new cases",count-1)),
        rangeslider(data.usconfirm[4], (values) {
          setState(() {
            rangevalue = values;
          });
        }),
        Container(
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            width: 600,
            height: 500,
            child: MultipLineChart(
                data.usconfirm[4],
                 data.getusaveragedata(data.globedailyfatal[3],count),
                data.globedailyfatal[1],
                rangevalue,
                "Fatal cases",
                "10-day average new death",count-1)),
        Container(
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            width: 600,
            height: 500,
            child: PatternForwardHatchBarChart(barchartdata)),
      ],
    ));
  }
}
