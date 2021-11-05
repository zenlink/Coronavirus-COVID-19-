import 'package:flutter/material.dart';
import '../utility/bulletin.dart';
import '../data.dart';

class tabletitle extends StatefulWidget {
  final Map confirm;
  final Map fatal;
  final callback;
  tabletitle(this.confirm, this.fatal,this.callback);
  @override
  _tabletitleState createState() => _tabletitleState();
}

class _tabletitleState extends State<tabletitle> {
  Map objfortable = {};
  List listfortable = [];
  List tablekey = [];

  Map stateconfirmTotal = {};
  List stateconfirmkey = [];
  Map statefatalTotal = {};
  bool isstateup = false;
  bool iscaseup = false;
  bool isdeath = false;
  bool israte = false;
  @override
  void initState() {
    setState(() {
      objfortable = data.getdatafortable(widget.confirm, widget.fatal);
    });
    if (data.usconfirm.length != 0) {
      setState(() {
        stateconfirmTotal = widget.confirm;
        stateconfirmkey = widget.confirm.keys.toList();
        
      });
    }
  
  }

  @override
  Widget build(BuildContext context) {
   
    return SingleChildScrollView(
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
                        isstateup = !isstateup;
                        List arr = [];
                        objfortable.forEach((key, value) {
                          arr.add([key, value]);
                        });
                        if (isstateup) {
                          arr.sort((a, b) => b[0].compareTo(a[0]));
                        } else {
                          arr.sort((a, b) => a[0].compareTo(b[0]));
                        }
                        objfortable = {};
                        arr.forEach((x) {
                          objfortable[x[0]] = x[1];
                        });
                      });
                      widget.callback(objfortable);
                    },
                    child: Row(children: [
                      Icon(
                        isstateup ? Icons.arrow_drop_up : Icons.arrow_drop_down,
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
                  
                    onPressed: () {
                      setState(() {
                        iscaseup = !iscaseup;
                        List arr = [];
                        objfortable.forEach((key, value) {
                          arr.add([key, value]);
                        });
                        if (iscaseup) {
                          arr.sort((a, b) =>
                              b[1]["total"][0].compareTo(a[1]["total"][0]));
                        } else {
                          arr.sort((a, b) =>
                              a[1]["total"][0].compareTo(b[1]["total"][0]));
                        }
                        objfortable = {};
                        arr.forEach((x) {
                          objfortable[x[0]] = x[1];
                        });
                      });
                      widget.callback(objfortable);
                    },
                    child: Row(children: [
                      Icon(
                        iscaseup ? Icons.arrow_drop_up : Icons.arrow_drop_down,
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
                        List arr = [];
                        objfortable.forEach((key, value) {
                          arr.add([key, value]);
                        });
                        if (isdeath) {
                          arr.sort((a, b) =>
                              b[1]["total"][2].compareTo(a[1]["total"][2]));
                        } else {
                          arr.sort((a, b) =>
                              a[1]["total"][2].compareTo(b[1]["total"][2]));
                        }
                        objfortable = {};
                        arr.forEach((x) {
                          objfortable[x[0]] = x[1];
                        });
                      });
                      widget.callback(objfortable);
                    },
                    child: Row(children: [
                      Icon(
                        isdeath ? Icons.arrow_drop_up : Icons.arrow_drop_down,
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
                      setState(() {
                        israte = !israte;
                        List arr = [];
                        objfortable.forEach((key, value) {
                          arr.add([key, value]);
                        });
                        if (israte) {
                          arr.sort((a, b) {
                            if (b[1]["total"][0] == 0) {
                              b[1]["total"][0] = 1;
                            }
                            if (a[1]["total"][0] == 0) {
                              a[1]["total"][0] = 1;
                            }
                            return (b[1]["total"][2] / b[1]["total"][0])
                                .compareTo(a[1]["total"][2] / a[1]["total"][0]);
                          });
                        } else {
                          arr.sort((a, b) {
                            if (b[1]["total"][0] == 0) {
                              b[1]["total"][0] = 1;
                            }
                            if (a[1]["total"][0] == 0) {
                              a[1]["total"][0] = 1;
                            }
                            return (a[1]["total"][2] / a[1]["total"][0])
                                .compareTo(b[1]["total"][2] / b[1]["total"][0]);
                          });
                        }
                        objfortable = {};
                        arr.forEach((x) {
                          objfortable[x[0]] = x[1];
                        });
                      });
                      widget.callback(objfortable);
                    },
                    child: Row(children: [
                      Icon(
                        israte ? Icons.arrow_drop_up : Icons.arrow_drop_down,
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
          ]),
    );
  }
}
