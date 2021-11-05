import 'package:covidtally/utility/loading.dart';
import 'package:flutter/material.dart';
import '../utility/selsectbox.dart';
import '../utility/bulletin.dart';
import '../data.dart';

class subtable extends StatefulWidget {
  final int myIndex;
  subtable(this.myIndex);
  @override
  _subtableState createState() => _subtableState();
}

class _subtableState extends State<subtable> {
  Map stateconfirmTotal = {};
  List<String> stateconfirmkey = [];
  Map statefatalTotal = {};
  List<String> statefatalkey = [];
  List countyconfirmkey = [];
  List countyfatalkey = [];

  List listfortable = [];
  bool isstateup = false;
  bool iscaseup = false;
  bool isdeath = false;
  bool israte = false;
  @override
  void initState() {
    if (data.usconfirm.length != 0) {
      setState(() {
        stateconfirmTotal = data.usconfirm[2][data.stateName.value];
        statefatalTotal = data.usfatal[2][data.stateName.value];
        stateconfirmkey = (data.usconfirm[2].keys.cast<String>()).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: data.stateName,
        builder: (BuildContext context, String value, Widget? child) {
          listfortable = [];
          stateconfirmTotal.forEach((key, value) {
            if (key != "total") {
              listfortable.add([key, ...value, ...statefatalTotal[key]]);
            }
          });

          if (stateconfirmkey.length == 0) return loading();
          return SingleChildScrollView(
              child: Column(children: [
            bulletin(
                data.usconfirm[2][data.stateName.value]["total"][0],
                data.usconfirm[2][data.stateName.value]["total"][1],
                data.usfatal[2][data.stateName.value]["total"][0],
                data.usfatal[2][data.stateName.value]["total"][1],
                data.stateName.value),
            selsectbox(stateconfirmkey,widget.myIndex, () {
              setState(() {
                stateconfirmTotal = data.usconfirm[2][data.stateName.value];
                statefatalTotal = data.usfatal[2][data.stateName.value];
                isstateup = false;
                iscaseup = false;
                isdeath = false;
                israte = false;
              });
            }),
            SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     
                      Container(
                          width: 130,
                          height: 40,
                          color: Colors.grey,
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  List arr1 = [];
                                  stateconfirmTotal.forEach((key, value) {
                                    arr1.add([key, ...value]);
                                  });
                                  if (isstateup) {
                                    arr1.sort((a, b) => a[0].compareTo(b[0]));
                                  } else {
                                    arr1.sort((a, b) => b[0].compareTo(a[0]));
                                  }
                                  stateconfirmTotal = {};
                                  arr1.forEach((x) {
                                    stateconfirmTotal[x[0]] = [x[1], x[2]];
                                  });
                                  isstateup = !isstateup;
                                });
                              },
                              child: Row(children: [
                                Icon(
                                  isstateup
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Location",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ]))),
                    
                      Container(
                          width: 90,
                          height: 40,
                          color: Colors.red.shade700,
                          child: TextButton(
                              // style: TextButton.styleFrom(
                              //    primary: Colors.grey,
                              // ),
                              onPressed: () {
                                setState(() {
                                  iscaseup = !iscaseup;
                                  List arr1 = [];
                                  stateconfirmTotal.forEach((key, value) {
                                    arr1.add([key, ...value]);
                                  });
                                  if (iscaseup) {
                                    arr1.sort((a, b) => a[1].compareTo(b[1]));
                                  } else {
                                    arr1.sort((a, b) => b[1].compareTo(a[1]));
                                  }
                                  stateconfirmTotal = {};
                                  arr1.forEach((x) {
                                    stateconfirmTotal[x[0]] = [x[1], x[2]];
                                  });
                                });
                              },
                              child: Row(children: [
                                Icon(
                                  iscaseup
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Cases",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ]))),
                    
                      Container(
                          width: 85,
                          height: 40,
                          color: Colors.brown.shade700,
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  isdeath = !isdeath;
                                  Map arr1 = {};
                                  List arr2 = [];
                                  arr1 = stateconfirmTotal;
                                  statefatalTotal.forEach((key, value) {
                                    arr2.add([key, ...value]);
                                  });
                                  if (isdeath) {
                                    arr2.sort((a, b) => a[1].compareTo(b[1]));
                                  } else {
                                    arr2.sort((a, b) => b[1].compareTo(a[1]));
                                  }
                                  stateconfirmTotal = {};
                                  statefatalTotal = {};
                                  arr2.forEach((x) {
                                    statefatalTotal[x[0]] = [x[1], x[2]];
                                    stateconfirmTotal[x[0]] = arr1[x[0]];
                                  });
                                });
                              },
                              child: Row(children: [
                                Icon(
                                  isdeath
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Death",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ]))),
                     
                      Container(
                          height: 40,
                          width: 70,
                          color: Colors.black,
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  israte = !israte;
                                  Map arr1 = {};
                                  List arr2 = [];
                                  arr1 = stateconfirmTotal;
                                  statefatalTotal.forEach((key, value) {
                                    arr2.add([
                                      key,
                                      ...stateconfirmTotal[key],
                                      ...value
                                    ]);
                                  });
                                  if (israte) {
                                    arr2.sort((a, b) {
                                      if (a[1] == 0) {
                                        a[1] = 1;
                                      }
                                      if (b[1] == 0) {
                                        b[1] = 1;
                                      }
                                      return (a[3] / a[1])
                                          .compareTo(b[3] / b[1]);
                                    });
                                  } else {
                                    arr2.sort((a, b) {
                                      if (a[1] == 0) {
                                        a[1] = 1;
                                      }
                                      if (b[1] == 0) {
                                        b[1] = 1;
                                      }
                                      return (b[3] / b[1])
                                          .compareTo(a[3] / a[1]);
                                    });
                                  }
                                  stateconfirmTotal = {};
                                  arr2.forEach((x) {
                                    stateconfirmTotal[x[0]] = arr1[x[0]];
                                  });
                                });
                              },
                              child: Row(children: [
                                Icon(
                                  israte
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                                Text(
                                  "CFR",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ]))),
                    ])),
            Column(
                children: listfortable
                    .asMap()
                    .entries
                    .map((e) {
                      int i = e.key;
                      List x = e.value;
                      return Column(children: [
                        Container(
                          height: data.locationbuttonheight,
                          color: i % 2 == 0 ? Colors.blue.shade100 : null,
                          // padding:
                          //     EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                          child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  
                                    Container(
                                        width: 130,
                                        padding: EdgeInsets.only(left: 24),
                                        child: Text(x[0],
                                            style: TextStyle(
                                                color: Colors.black))),
                                    // Expanded(
                                    //     flex: 4,
                                    //     child:
                                    Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(data.get_number_comma(
                                                x[1].toString())),
                                            x[2] != 0
                                                ? Column(children: [
                                                    SizedBox(height: 6),
                                                    Text(
                                                        "+${data.get_number_comma(x[2].toString())}")
                                                  ])
                                                : Container()
                                          ],
                                        )),
                                   
                                    Container(
                                        width: 85,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(data.get_number_comma(
                                                x[3].toString())),
                                            x[4] != 0
                                                ? Column(children: [
                                                    SizedBox(height: 6),
                                                    Text(
                                                        "+${data.get_number_comma(x[4].toString())}")
                                                  ])
                                                : Container()
                                          ],
                                        )),
                                   
                                    Container(
                                        width: 70,
                                        padding: EdgeInsets.only(right: 8),
                                        child: Text(
                                          "${(x[1] != 0 ? x[3] * 100 / x[1] : 0).toStringAsFixed(1)}%",
                                          textAlign: TextAlign.center,
                                        ))
                                  ])),
                        ),
                      ]);
                    })
                    .toList()
                    .cast<Widget>()),
          ]));
        });
  }
}
