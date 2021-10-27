import 'package:flutter/material.dart';
import "../data.dart";

class selsectbox extends StatefulWidget {
  final List<String> statekey;
  final callback;
  selsectbox(this.statekey, [this.callback]);
  @override
  // final List pieces;
  // table(this.pieces);

  _selsectboxState createState() => _selsectboxState();
}

class _selsectboxState extends State<selsectbox> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Container(
          // width: 300,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(12)),
          child: DropdownButtonHideUnderline(
              child: DropdownButton(
            // hint: Text('Please choose a location'),
            iconSize: 36,
            icon: Icon(Icons.arrow_drop_down, color: Colors.black),
            value: data.mainindex == 1
                ? data.stateName.value
                : data.countryname.value,
            isExpanded: true,
            onChanged: (String? value) {
              setState(() {
                if (data.mainindex == 1) {
                  data.stateName.value = value!;
                } else {
                  data.countryname.value = value!;
                }
              });
              widget.callback();
            },
            items: widget.statekey.map((location) {
              return DropdownMenuItem(
                child: Text(location),
                value: location,
              );
            }).toList(),
          )),
        ));
  }
}
