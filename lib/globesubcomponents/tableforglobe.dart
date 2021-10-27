import 'package:flutter/material.dart';
import '../utility/bulletin.dart';
import "../utility/tabletitle.dart";
import '../data.dart';

class tableforglobe extends StatefulWidget {
  // final Map confirm;
  // final Map fatal;
  // tableforglobe(this.confirm, this.fatal);
  @override
  // final List pieces;
  // table(this.pieces);

  _tableforglobeState createState() => _tableforglobeState();
}

class _tableforglobeState extends State<tableforglobe> {
  Map objfortable = {};
  List listfortable = [];
  List tablekey = [];

  Map stateconfirmTotal = {};
  List stateconfirmkey = [];
  Map statefatalTotal = {};
  List statefatalkey = [];
  List countyconfirmkey = [];
  List countyfatalkey = [];
  List openList = [];
    bool isstateup = false;
  bool iscaseup = false;
  bool isdeath = false;
  bool israte = false;
  @override
  void initState() {
    setState(() {
      objfortable =
          data.getdatafortable(data.globeconfirm[2], data.globefatal[2]);
    });
   
    if (data.globeconfirm.length != 0) {
      setState(() {
        stateconfirmTotal = data.globeconfirm[2];

        stateconfirmkey = stateconfirmTotal.keys.toList();
        openList = List.filled(stateconfirmkey.length, false);
      });
    }
    if (data.usfatal.length != 0) {
      setState(() {
        statefatalTotal = data.globefatal[2];
        statefatalkey = statefatalTotal.keys.toList();
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

    return SingleChildScrollView(
        child: Column(children: [
      bulletin(data.globeconfirm[0], data.globeconfirm[1], data.globefatal[0],
          data.globefatal[1], "Globe"),
           tabletitle(data.globeconfirm[2], data.globefatal[2], (x) {
        setState(() {
          objfortable = x;
        });
      }),
      // Row(
      //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Expanded(
      //           flex: 5,
      //           child: Container(
      //               height: 40,
      //               color: Colors.grey,
      //               child: TextButton(
      //                   onPressed: () {
      //                       setState(() {
      //                       isstateup = !isstateup;
      //                       List arr = [];
      //                       objfortable.forEach((key, value) {
      //                         arr.add([key, value]);
      //                       });
      //                       if (isstateup) {
      //                         arr.sort((a, b) => b[0].compareTo(a[0]));
      //                       } else {
      //                         arr.sort((a, b) => a[0].compareTo(b[0]));
      //                       }
      //                       objfortable = {};
      //                       arr.forEach((x) {
      //                         objfortable[x[0]] = x[1];
      //                       });
      //                     });
      //                   },
      //                   child: Row(children: [
      //                     Icon(
      //                     isstateup
      //                           ? Icons.arrow_drop_up
      //                           : Icons.arrow_drop_down,
      //                       color: Colors.white,
      //                     ),
      //                     Text(
      //                       "Location",
      //                       style: TextStyle(
      //                         color: Colors.white,
      //                       ),
      //                       textAlign: TextAlign.center,
      //                     )
      //                   ])))),
      //       Expanded(
      //           flex: 4,
      //           child: Container(
      //               height: 40,
      //               color: Colors.red.shade700,
      //               child: TextButton(
      //                   // style: TextButton.styleFrom(
      //                   //    primary: Colors.grey,
      //                   // ),
      //                   onPressed: () {
      //                      setState(() {
      //                       iscaseup = !iscaseup;
      //                       List arr = [];
      //                       objfortable.forEach((key, value) {
      //                         arr.add([key, value]);
      //                       });
      //                       if (iscaseup) {
      //                         arr.sort((a, b) =>
      //                             b[1]["total"][0].compareTo(a[1]["total"][0]));
      //                       } else {
      //                         arr.sort((a, b) =>
      //                             a[1]["total"][0].compareTo(b[1]["total"][0]));
      //                       }
      //                       objfortable = {};
      //                       arr.forEach((x) {
      //                         objfortable[x[0]] = x[1];
      //                       });
      //                     });
      //                   },
      //                   child: Row(children: [
      //                     Icon(
      //                       iscaseup
      //                           ? Icons.arrow_drop_up
      //                           : Icons.arrow_drop_down,
      //                       color: Colors.white,
      //                     ),
      //                     Text(
      //                       "Cases",
      //                       style: TextStyle(
      //                         color: Colors.white,
      //                       ),
      //                       textAlign: TextAlign.center,
      //                     )
      //                   ])))),
      //       Expanded(
      //           flex: 4,
      //           child: Container(
      //               height: 40,
      //               color: Colors.brown.shade700,
      //               child: TextButton(
      //                   onPressed: () {
      //                      setState(() {
      //                       isdeath = !isdeath;
      //                       List arr = [];
      //                       objfortable.forEach((key, value) {
      //                         arr.add([key, value]);
      //                       });
      //                       if (isdeath) {
      //                         arr.sort((a, b) =>
      //                             b[1]["total"][2].compareTo(a[1]["total"][2]));
      //                       } else {
      //                         arr.sort((a, b) =>
      //                             a[1]["total"][2].compareTo(b[1]["total"][2]));
      //                       }
      //                       objfortable = {};
      //                       arr.forEach((x) {
      //                         objfortable[x[0]] = x[1];
      //                       });
      //                     });
      //                   },
      //                   child: Row(children: [
      //                     Icon(
      //                       isdeath
      //                           ? Icons.arrow_drop_up
      //                           : Icons.arrow_drop_down,
      //                       color: Colors.white,
      //                     ),
      //                     Text(
      //                       "Death",
      //                       style: TextStyle(
      //                         color: Colors.white,
      //                       ),
      //                       textAlign: TextAlign.center,
      //                     )
      //                   ])))),
      //       Expanded(
      //           flex: 3,
      //           child: Container(
      //             alignment: Alignment.center,
      //               height: 40,
      //               color: Colors.black,
      //               child: TextButton(
      //                   onPressed: () {
      //                      setState(() {
      //                       israte = !israte;
      //                       List arr = [];
      //                       objfortable.forEach((key, value) {
      //                         arr.add([key, value]);
      //                       });
      //                       if (israte) {
      //                         arr.sort((a, b) {
      //                           if (b[1]["total"][0] == 0) {
      //                             b[1]["total"][0] = 1;
      //                           }
      //                           if (a[1]["total"][0] == 0) {
      //                             a[1]["total"][0] = 1;
      //                           }
      //                           return (b[1]["total"][2] / b[1]["total"][0])
      //                               .compareTo(
      //                                   a[1]["total"][2] / a[1]["total"][0]);
      //                         });
      //                       } else {
      //                         arr.sort((a, b) {
      //                            if (b[1]["total"][0] == 0) {
      //                             b[1]["total"][0] = 1;
      //                           }
      //                           if (a[1]["total"][0] == 0) {
      //                             a[1]["total"][0] = 1;
      //                           }
      //                           return 
      //                           (a[1]["total"][2] / a[1]["total"][0]).compareTo(
      //                               b[1]["total"][2] / b[1]["total"][0]);
      //                         });
      //                       }
      //                       objfortable = {};
      //                       arr.forEach((x) {
      //                         objfortable[x[0]] = x[1];
      //                       });
      //                     });
      //                   },
      //                   child: Row(children: [
      //                     Icon(
      //                        israte
      //                           ? Icons.arrow_drop_up
      //                           : Icons.arrow_drop_down,
      //                       color: Colors.white,
      //                     ),
      //                     Text(
      //                       "CFR",
      //                       style: TextStyle(
      //                         color: Colors.white,
      //                       ),
      //                       // textAlign: TextAlign.center,
      //                     )
      //                   ])))),
      //     ]),
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
                                    child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      List openListcopy = [...openList];
                                      openListcopy[i] = !openListcopy[i];
                                      openList = openListcopy;
                                    });
                                  },
                                  child: Row(children: [
                                    // Icon(Icons.arrow_drop_down),
                                    data.countryMore.indexOf(tablekey[i]) > -1
                                        ? Icon(Icons.arrow_drop_down)
                                        : Container(
                                            padding: EdgeInsets.only(left: 24),
                                          ),
                                    Flexible(
                                        child: Text(tablekey[i],
                                            style:
                                                TextStyle(color: Colors.black)))
                                  ]))),
                          // Expanded(
                          //     flex: 4,
                          //     child: 
                                Container(
                                    width:90,
                                    child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(data.get_number_comma(
                                      x[tablekey[i]]["total"][0].toString())),
                                  x[tablekey[i]]["total"][1] != 0
                                      ? Column(children: [SizedBox(height: 6),Text("+${data.get_number_comma(
                                          x[tablekey[i]]["total"][1]
                                              .toString())}")])
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
                                  Text(data.get_number_comma(
                                      x[tablekey[i]]["total"][2].toString())),
                                  x[tablekey[i]]["total"][3] != 0
                                      ? Column(children: [SizedBox(height: 6),Text("+${data.get_number_comma(
                                          x[tablekey[i]]["total"][3]
                                              .toString())}")])
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
                      ? (data.countryMore.indexOf(tablekey[i]) >-1
                          ?  Container(
                            margin: EdgeInsets.symmetric(horizontal: 6),
                              decoration: BoxDecoration(
                                        border: Border.all(color: Colors.orange)
                                      ),
                            child:Column(
                              children: data.getsublist(x[tablekey[i]]).asMap()
                                  .entries
                                  .map((e) {
                                    int id = e.key;
                                    String y = e.value;

                                    return Container(
                                      // decoration: BoxDecoration(
                                      //   border: Border.all(color: Colors.blue)
                                      // ),
                                      height: 60,
                                      color: id % 2 == 0
                                          ? Colors.blue.shade100
                                          : null,
                                      padding: EdgeInsets.fromLTRB(24, 8, 8, 8),
                                      child: Row(children: [
                                        Expanded(
                                            flex: 5,
                                            child: Container(
                                                child: Text(y==""?tablekey[i]:y,
                                                    style: TextStyle(
                                                        color: Colors.black)))),
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
                                                        "+${data.get_number_comma(
                                                            x[tablekey[i]][y][1]
                                                                .toString())}")
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
                                                        "+${data.get_number_comma(
                                                            x[tablekey[i]][y][3]
                                                                .toString())}")
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
              .cast<Widget>()
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
        )])
    );
  }
}
