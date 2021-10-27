import 'package:flutter/material.dart';
import "../data.dart";

class rangeslider extends StatefulWidget {
  final List date;
  final callback;
  rangeslider(this.date, this.callback);
  @override
  // final List pieces;
  // table(this.pieces);

  _rangesliderState createState() => _rangesliderState();
}

class _rangesliderState extends State<rangeslider> {
  double length = 0.0;
  late RangeValues values;
  late RangeLabels rLabels;
  // RangeValues values = RangeValues(lowervalue, uppervalue);
  @override
  void initState() {
    length = widget.date.length - 1;
    values = RangeValues(0, length);
    rLabels = RangeLabels(
        widget.date[values.start.floor()], widget.date[values.end.floor()]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 8),
        child: SliderTheme(
            data:
                SliderThemeData(showValueIndicator: ShowValueIndicator.always),
            child: RangeSlider(
                activeColor: Color.fromARGB(255, 26, 120, 135),
                inactiveColor: Color.fromARGB(255, 163, 198, 204),
                labels: rLabels,
                min: 0.0,
                max: length,
                values: values,
                onChanged: (val) {
                  setState(() {
                    values = val;
                    rLabels = RangeLabels(widget.date[values.start.floor()],
                        widget.date[values.end.floor()]);
                    widget.callback(values);
                  });
                })));
  }
}
