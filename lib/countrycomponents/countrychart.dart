import 'package:flutter/material.dart';
import '../chartcomponents/MultipLineChart.dart';
import "../chartcomponents/PatternForwardHatchBarChart .dart";
import '../utility/bulletin.dart';
import '../utility/selsectbox.dart';
import "../utility/rangeslider.dart";
import '../data.dart';

class countrychart extends StatefulWidget {
  final int myIndex;
  countrychart(this.myIndex);
  @override
  _countrychartState createState() => _countrychartState();
}

class _countrychartState extends State<countrychart> {
  List countrydaily = [];
  List countrydailyaddition = [];
  List countrydailyfatal = [];
  List countrydailyadditionfatal = [];
  List<String> globeconfirmkey = [];
  late RangeValues rangevalue;
  double len = data.usconfirm[4].length.toDouble();
  List barchartdata = [];
  int count = 10;
  @override
  void initState() {
    rangevalue = RangeValues(0, len);
    if (data.globeconfirm.length != 0) {
      setState(() {
        globeconfirmkey = (data.globeconfirm[2].keys.cast<String>()).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: data.countryname,
        builder: (BuildContext context, String value, Widget? child) {
          countrydaily = data.globedailyconfirm[0][data.countryname.value];
          countrydailyaddition =
              data.globedailyconfirm[2][data.countryname.value];
          countrydailyfatal = data.globedailyfatal[0][data.countryname.value];
          countrydailyadditionfatal =
              data.globedailyfatal[2][data.countryname.value];
          if (data.countryMore.indexOf(data.countryname.value) > -1) {
            barchartdata = data.getdataforstatecountry(
                data.globeconfirm[2][data.countryname.value],
                data.globefatal[2][data.countryname.value],
                data.countryname.value);
          }
          return SingleChildScrollView(
              child: Column(
            children: [
              bulletin(
                  data.globeconfirm[2][data.countryname.value]["total"][0],
                  data.globeconfirm[2][data.countryname.value]["total"][1],
                  data.globefatal[2][data.countryname.value]["total"][0],
                  data.globefatal[2][data.countryname.value]["total"][1],
                  data.countryname.value),
              selsectbox(globeconfirmkey, widget.myIndex),
              Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(8),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  width: 600,
                  height: 500,
                  child: MultipLineChart(
                      data.usconfirm[4],
                      data.getusaveragedata(countrydailyaddition, count),
                      countrydaily,
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
                      data.getusaveragedata(countrydailyadditionfatal, count),
                      countrydailyfatal,
                      rangevalue,
                      "Fatal cases",
                      "10-day average new death",
                      count - 1)),
              if (data.countryMore.indexOf(data.countryname.value) > -1)
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
