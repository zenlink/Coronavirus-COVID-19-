import 'package:flutter/material.dart';
import '../utility/bulletin.dart';
import "../utility/tabletitle.dart";
import '../data.dart';

class table extends StatefulWidget {
  @override
  _tableState createState() => _tableState();
}

class _tableState extends State<table> {
  Map objfortable = {};
  List listfortable = [];
  List tablekey = [];

  Map stateconfirmTotal = {};
  List stateconfirmkey = [];
  Map statefatalTotal = {};
  List openList = [];
 
  @override
  void initState() {
    setState(() {
      objfortable = data.getdatafortable(data.usconfirm[2], data.usfatal[2]);
    });
    if (data.usconfirm.length != 0) {
      setState(() {
        stateconfirmTotal = data.usconfirm[2];
        stateconfirmkey = data.usconfirm[2].keys.toList();
        openList = List.filled(stateconfirmkey.length, false);
      });
    }
  
  }

  @override
  Widget build(BuildContext context) {
    listfortable = [];
    objfortable.forEach((key, value) {
      listfortable.add({key: value});
    });
    tablekey = objfortable.keys.toList();
    // openList = List.filled(tablekey.length, false);
    return SingleChildScrollView(
        child: Column(children: [
      bulletin(data.usconfirm[0], data.usconfirm[1], data.usfatal[0],
          data.usfatal[1], "United States"),
      tabletitle(data.usconfirm[2], data.usfatal[2],(x) {
        setState(() {
          objfortable = x;
        });
      }),
    
      Column(
          children: listfortable
              .asMap()
              .entries
              .map((e) {
                int i = e.key;
                Map x = e.value;
                return Column(children: [
                  Container(
                    height: data.locationbuttonheight,
                    color: i % 2 == 0 ? Colors.grey.shade300 : null,
                    // padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Expanded(
                              //     flex: 5,
                              //     child: 
                                  Container(
                                    width:130,
                                    child:TextButton(
                                      onPressed: () {
                                        setState(() {
                                          List openListcopy = [...openList];
                                          openListcopy[i] = !openListcopy[i];
                                          openList = openListcopy;
                                        });
                                      },
                                      child: Row(children: [
                                        // Icon(Icons.arrow_drop_down),
                                        data.usarea.indexOf(tablekey[i]) < 0
                                            ? Icon(Icons.arrow_drop_down)
                                            : Container(
                                                padding:
                                                    EdgeInsets.only(left: 24),
                                              ),
                                        Flexible(
                                            child: Text(tablekey[i],
                                                style: TextStyle(
                                                    color: Colors.black)))
                                      ]))),
                              // Expanded(
                              //     flex: 4,
                              //     child: 
                                    Container(
                                    width:90,
                                    child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(data.get_number_comma(x[tablekey[i]]
                                              ["total"][0]
                                          .toString())),
                                      x[tablekey[i]]["total"][1] != 0
                                          ? Column(children: [
                                              SizedBox(height: 6),
                                              Text(
                                                  "+${data.get_number_comma(x[tablekey[i]]["total"][1].toString())}")
                                            ])
                                          : Container()
                                    ],
                                  )),
                              // Expanded(
                              //     flex: 4,
                              //     child: 
                                    Container(
                                    width:85,
                                    child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(data.get_number_comma(x[tablekey[i]]
                                              ["total"][2]
                                          .toString())),
                                      x[tablekey[i]]["total"][3] != 0
                                          ? Column(children: [
                                              SizedBox(height: 6),
                                              Text(
                                                  "+${data.get_number_comma(x[tablekey[i]]["total"][3].toString())}")
                                            ])
                                          : Container()
                                    ],
                                  )),
                              // Expanded(
                              //     flex: 3,
                              //     child:
                                   Container(
                                     width:70,
                                      padding: EdgeInsets.only(right: 8),
                                      child: Text(
                                        "${(x[tablekey[i]]["total"][2] != 0 ? x[tablekey[i]]["total"][2] * 100 / x[tablekey[i]]["total"][0] : 0).toStringAsFixed(1)}%",
                                        // "33%",
                                        textAlign: TextAlign.center,
                                      ))
                            ])),
                  ),
                  openList[i]
                      ? (data.usarea.indexOf(tablekey[i]) < 0
                          ? Container(
                              margin: EdgeInsets.symmetric(horizontal: 6),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.orange)),
                              child: Column(
                                  children: data
                                      .getsublist(x[tablekey[i]])
                                      .asMap()
                                      .entries
                                      .map((e) {
                                        int id = e.key;
                                        String y = e.value;

                                        return Container(
                                          height: 60,
                                          color: id % 2 == 0
                                              ? Colors.blue.shade100
                                              : null,
                                          padding:
                                              EdgeInsets.fromLTRB(24, 8, 8, 8),
                                          child: Row(children: [
                                            Expanded(
                                                flex: 5,
                                                child: Container(
                                                    child: Text(y,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black)))),
                                            Expanded(
                                                flex: 4,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(data.get_number_comma(
                                                        x[tablekey[i]][y][0]
                                                            .toString())),
                                                    x[tablekey[i]][y][1] != 0
                                                        ? Text(
                                                            "+${data.get_number_comma(x[tablekey[i]][y][1].toString())}")
                                                        : Container()
                                                  ],
                                                )),
                                            Expanded(
                                                flex: 4,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(data.get_number_comma(
                                                        x[tablekey[i]][y][2]
                                                            .toString())),
                                                    x[tablekey[i]][y][3] != 0
                                                        ? Text(
                                                            "+${data.get_number_comma(x[tablekey[i]][y][3].toString())}")
                                                        : Container()
                                                  ],
                                                )),
                                            Expanded(
                                                flex: 3,
                                                child: Container(
                                                    // padding: EdgeInsets.only(right:8),
                                                    child: Text(
                                                  "${(x[tablekey[i]][y][2] != 0 ? x[tablekey[i]][y][2] * 100 / x[tablekey[i]][y][0] : 0).toStringAsFixed(1)}%",
                                                  textAlign: TextAlign.center,
                                                )))
                                          ]),
                                        );
                                      })
                                      .toList()
                                      .cast<Widget>()))
                          : Container())
                      : Container()
                ]);
              })
              .toList()
              .cast<Widget>()),

      //   Column(
      //       children: stateconfirmkey
      //           .asMap()
      //           .entries
      //           .map((e) {
      //             int i = e.key;
      //             String x = e.value;
      //             return Column(children: [
      //               Container(
      //                 height: 50,
      //                 color: i % 2 == 0 ? Colors.grey.shade300 : null,
      //                 padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      //                 child: Row(
      //                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Expanded(
      //                           flex: 4,
      //                           child: TextButton(
      //                               onPressed: () {
      //                                 setState(() {
      //                                   countyconfirmkey = stateconfirmTotal[x]
      //                                       .keys
      //                                       .toList()
      //                                       .sublist(1);
      //                                   countyfatalkey = statefatalTotal[x]
      //                                       .keys
      //                                       .toList()
      //                                       .sublist(1);
      //                                   List openListcopy = [...openList];
      //                                   openListcopy[i] = !openListcopy[i];
      //                                   openList = openListcopy;
      //                                 });
      //                               },
      //                               child: Row(children: [
      //                                 Icon(Icons.arrow_drop_down),
      //                                 Flexible(
      //                                     child: Text(x,
      //                                         style:
      //                                             TextStyle(color: Colors.black)))
      //                               ]))),
      //                       Expanded(
      //                           flex: 3,
      //                           child: Column(
      //                             mainAxisAlignment: MainAxisAlignment.center,
      //                             children: [
      //                               Text(data.get_number_comma(
      //                                   stateconfirmTotal[x]["total"][0]
      //                                       .toString())),
      //                               stateconfirmTotal[x]["total"][1] != 0
      //                                   ? Text(data.get_number_comma(
      //                                       stateconfirmTotal[x]["total"][1]
      //                                           .toString()))
      //                                   : Container()
      //                             ],
      //                           )),
      //                       Expanded(
      //                           flex: 3,
      //                           child: Column(
      //                             mainAxisAlignment: MainAxisAlignment.center,
      //                             children: [
      //                               Text(data.get_number_comma(statefatalTotal[x]
      //                                       ["total"][0]
      //                                   .toString())),
      //                               statefatalTotal[x]["total"][1] != 0
      //                                   ? Text(data.get_number_comma(
      //                                       statefatalTotal[x]["total"][1]
      //                                           .toString()))
      //                                   : Container()
      //                             ],
      //                           )),
      //                       Expanded(
      //                           flex: 2,
      //                           child: Container(
      //                               padding: EdgeInsets.only(right: 8),
      //                               child: Text(
      //                                 "${(statefatalTotal[x]["total"][0] != 0 ? statefatalTotal[x]["total"][0] * 100 / stateconfirmTotal[x]["total"][0] : 0).toStringAsFixed(1)}%",
      //                                 textAlign: TextAlign.center,
      //                               )))
      //                     ]),
      //               ),
      //               openList[i]
      //                   ? (countyconfirmkey.length != 0
      //                       ? Column(
      //                           children:
      //                               countyconfirmkey.asMap().entries.map((e) {
      //                           int id = e.key;
      //                           String y = e.value;
      //                           return Container(
      //                             // decoration: BoxDecoration(
      //                             //   border: Border.all(color: Colors.blue)
      //                             // ),
      //                             height: 50,
      //                             color:
      //                                 id % 2 == 0 ? Colors.blue.shade100 : null,
      //                             padding: EdgeInsets.fromLTRB(24, 8, 8, 8),
      //                             child: Row(children: [
      //                               Expanded(
      //                                   flex: 4,
      //                                   child: Container(
      //                                       child: Text(y,
      //                                           style: TextStyle(
      //                                               color: Colors.black)))),
      //                               Expanded(
      //                                   flex: 3,
      //                                   child: Column(
      //                                     mainAxisAlignment:
      //                                         MainAxisAlignment.center,
      //                                     children: [
      //                                       Text(data.get_number_comma(
      //                                           stateconfirmTotal[x][y][0]
      //                                               .toString())),
      //                                       stateconfirmTotal[x][y][1] != 0
      //                                           ? Text(data.get_number_comma(
      //                                               stateconfirmTotal[x][y][1]
      //                                                   .toString()))
      //                                           : Container()
      //                                     ],
      //                                   )),
      //                               Expanded(
      //                                   flex: 3,
      //                                   child: Column(
      //                                     mainAxisAlignment:
      //                                         MainAxisAlignment.center,
      //                                     children: [
      //                                       Text(data.get_number_comma(
      //                                           statefatalTotal[x][y][0]
      //                                               .toString())),
      //                                       statefatalTotal[x][y][1] != 0
      //                                           ? Text(data.get_number_comma(
      //                                               statefatalTotal[x][y][1]
      //                                                   .toString()))
      //                                           : Container()
      //                                     ],
      //                                   )),
      //                               Expanded(
      //                                   flex: 2,
      //                                   child: Container(
      //                                       // padding: EdgeInsets.only(right:8),
      //                                       child: Text(
      //                                     "${(statefatalTotal[x][y][0] != 0 ? statefatalTotal[x][y][0] * 100 / stateconfirmTotal[x][y][0] : 0).toStringAsFixed(1)}%",
      //                                     textAlign: TextAlign.center,
      //                                   )))
      //                             ]),
      //                           );
      //                         }).toList())
      //                       : Container())
      //                   : Container()
      //             ]);
      //           })
      //           .toList()
      //           .cast<Widget>()),
    ]));
  }
}
