import 'package:flutter/material.dart';
import '../utility/selsectbox.dart';
import '../utility/bulletin.dart';
import '../data.dart';

class countrytable extends StatefulWidget {
  final int myIndex;
  countrytable(this.myIndex);
  @override
  _countrytableState createState() => _countrytableState();
}

class _countrytableState extends State<countrytable> {
  List<String> globeconfirmkey = [];
  List countyconfirmkey = [];
  Map countryconfirmTotal = {};
  Map countryfatalTotal = {};
  List listfortable = [];
  bool isstateup = false;
  bool iscaseup = false;
  bool isdeath = false;
  bool israte = false;
  @override
  void initState() {
    if (data.globeconfirm.length != 0) {
      setState(() {
        globeconfirmkey = (data.globeconfirm[2].keys.cast<String>()).toList();
        countryconfirmTotal = data.globeconfirm[2][data.countryname.value];
        countryfatalTotal = data.globefatal[2][data.countryname.value];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: data.countryname,
        builder: (BuildContext context, String value, Widget? child) {
          listfortable = [];
          if (data.countryMore.indexOf(data.countryname.value) > -1) {
            listfortable = [];
            countryconfirmTotal.forEach((key, value) {
              if (key != "total") {
                listfortable.add([key, ...value, ...countryfatalTotal[key]]);
              }
            });
            countyconfirmkey = countryconfirmTotal.keys.toList().sublist(1);
          }

          // if (stateconfirmkey.length == 0) return loading();
          return SingleChildScrollView(
              child: Column(children: [
            bulletin(
                data.globeconfirm[2][data.countryname.value]["total"][0],
                data.globeconfirm[2][data.countryname.value]["total"][1],
                data.globefatal[2][data.countryname.value]["total"][0],
                data.globefatal[2][data.countryname.value]["total"][1],
                data.countryname.value),
            selsectbox(globeconfirmkey,widget.myIndex, () {
              setState(() {
                countryconfirmTotal =
                    data.globeconfirm[2][data.countryname.value];
                countryfatalTotal = data.globefatal[2][data.countryname.value];
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
                      // Expanded(
                      //     flex: 5,
                      //     child:
                      Container(
                          width: 130,
                          height: 40,
                          color: Colors.grey,
                          child: TextButton(
                              onPressed: () {
                                if (data.countryMore
                                        .indexOf(data.countryname.value) >
                                    -1) {
                                  setState(() {
                                    List arr1 = [];
                                    countryconfirmTotal.forEach((key, value) {
                                      arr1.add([key, ...value]);
                                    });
                                    if (isstateup) {
                                      arr1.sort((a, b) => a[0].compareTo(b[0]));
                                    } else {
                                      arr1.sort((a, b) => b[0].compareTo(a[0]));
                                    }
                                    countryconfirmTotal = {};
                                    arr1.forEach((x) {
                                      countryconfirmTotal[x[0]] = [x[1], x[2]];
                                    });
                                    isstateup = !isstateup;
                                  });
                                }
                              },
                              child: Row(children: [
                                Icon(
                                  data.countryMore
                                              .indexOf(data.countryname.value) >
                                          -1
                                      ? (isstateup
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down)
                                      : null,
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
                      // Expanded(
                      //     flex: 4,
                      //     child:
                      Container(
                          width: 90,
                          height: 40,
                          color: Colors.red.shade700,
                          child: TextButton(
                              // style: TextButton.styleFrom(
                              //    primary: Colors.grey,
                              // ),
                              onPressed: () {
                                if (data.countryMore
                                        .indexOf(data.countryname.value) >
                                    -1) {
                                  setState(() {
                                    iscaseup = !iscaseup;
                                    List arr1 = [];
                                    countryconfirmTotal.forEach((key, value) {
                                      arr1.add([key, ...value]);
                                    });
                                    if (iscaseup) {
                                      arr1.sort((a, b) => a[1].compareTo(b[1]));
                                    } else {
                                      arr1.sort((a, b) => b[1].compareTo(a[1]));
                                    }
                                    countryconfirmTotal = {};
                                    arr1.forEach((x) {
                                      countryconfirmTotal[x[0]] = [x[1], x[2]];
                                    });
                                  });
                                }
                              },
                              child: Row(children: [
                                Icon(
                                  data.countryMore
                                              .indexOf(data.countryname.value) >
                                          -1
                                      ? (iscaseup
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down)
                                      : null,
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
                                if (data.countryMore
                                        .indexOf(data.countryname.value) >
                                    -1) {
                                  setState(() {
                                    isdeath = !isdeath;
                                    Map arr1 = {};
                                    List arr2 = [];
                                    arr1 = countryconfirmTotal;
                                    countryfatalTotal.forEach((key, value) {
                                      arr2.add([key, ...value]);
                                    });
                                    if (isdeath) {
                                      arr2.sort((a, b) => a[1].compareTo(b[1]));
                                    } else {
                                      arr2.sort((a, b) => b[1].compareTo(a[1]));
                                    }
                                    countryconfirmTotal = {};
                                    arr2.forEach((x) {
                                      countryconfirmTotal[x[0]] = arr1[x[0]];
                                    });
                                  });
                                }
                              },
                              child: Row(children: [
                                Icon(
                                  data.countryMore
                                              .indexOf(data.countryname.value) >
                                          -1
                                      ? (isdeath
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down)
                                      : null,
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
                          width: 70,
                          height: 40,
                          color: Colors.black,
                          child: TextButton(
                              onPressed: () {
                                if (data.countryMore
                                        .indexOf(data.countryname.value) >
                                    -1) {
                                  setState(() {
                                    israte = !israte;
                                    Map arr1 = {};
                                    List arr2 = [];
                                    arr1 = countryconfirmTotal;
                                    countryconfirmTotal.forEach((key, value) {
                                      arr2.add([
                                        key,
                                        ...value,
                                        ...countryfatalTotal[key],
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
                                    countryconfirmTotal = {};
                                    arr2.forEach((x) {
                                      countryconfirmTotal[x[0]] = arr1[x[0]];
                                    });
                                  });
                                }
                              },
                              child: Row(children: [
                                Icon(
                                  data.countryMore
                                              .indexOf(data.countryname.value) >
                                          -1
                                      ? (israte
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down)
                                      : null,
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
            data.countryMore.indexOf(data.countryname.value) > -1
                ? Column(
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
                              // padding: EdgeInsets.symmetric(
                              // vertical: 8, horizontal: 0),
                              child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            width: 130,
                                            padding: EdgeInsets.only(left: 24),
                                            child: Text(
                                                x[0] == ""
                                                    ? data.countryname.value
                                                    : x[0],
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
                        .cast<Widget>())
                : Container(
                    height: 60,
                    // color: i % 2 == 0 ? Colors.grey.shade300 : null,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 130,
                                  padding: EdgeInsets.only(left: 24),
                                  child: Text(data.countryname.value,
                                      style: TextStyle(color: Colors.black))),
                              Container(
                                  width: 90,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(data.get_number_comma(
                                          countryconfirmTotal["total"][0]
                                              .toString())),
                                      countryconfirmTotal["total"][1] != 0
                                          ? Text(
                                              "+${data.get_number_comma(countryconfirmTotal["total"][1].toString())}")
                                          : Container()
                                    ],
                                  )),
                              Container(
                                  width: 85,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(data.get_number_comma(
                                          countryfatalTotal["total"][0]
                                              .toString())),
                                      countryfatalTotal["total"][1] != 0
                                          ? Text(
                                              "+${data.get_number_comma(countryfatalTotal["total"][1].toString())}")
                                          : Container()
                                    ],
                                  )),
                              Container(
                                  width: 70,
                                  padding: EdgeInsets.only(right: 8),
                                  child: Text(
                                    "${(countryconfirmTotal["total"][0] != 0 ? countryfatalTotal["total"][0] * 100 / countryconfirmTotal["total"][0] : 0).toStringAsFixed(1)}%",
                                    textAlign: TextAlign.center,
                                  ))
                            ])),
                  ),
          ]));
        });
  }
}
