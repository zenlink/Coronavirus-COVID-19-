import 'package:flutter/material.dart';
import "package:scroll_to_index/scroll_to_index.dart";
import '../statesubcomponents/statechart.dart';
import '../statesubcomponents/subtable.dart';
import '../statesubcomponents/statemap.dart';
import "../bottom_nav.dart";
import "../data.dart";

class eachState extends StatefulWidget {
  @override
  _eachStateState createState() => _eachStateState();
}

class _eachStateState extends State<eachState>
    with SingleTickerProviderStateMixin {
  AutoScrollController? _scrollControll;
   TabController? _sub_tabController;
  Map stateconfirmTotal = {};
  List stateconfirmkey = [];
  Map statefatalTotal = {};
  List statefatalkey = [];
  List countyconfirmkey = [];
  List countyfatalkey = [];
  List openList = [];
  Map statedailyconfirm = {};
  Map statedailyconfirmaddition = {};
  Map statedailyfatal = {};
  Map statedailyfataladdition = {};
  int myIndex = -1;

  @override
  void initState() {
    myIndex = data.mainindex;
      _sub_tabController =
        TabController(length: data.bottom_tab_list[data.mainindex].length, vsync: this);
    // _scrollControll = AutoScrollController(
    //     viewportBoundaryGetter: () =>
    //         Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom));
    if (data.usconfirm.length != 0) {
      setState(() {
        stateconfirmTotal = data.usconfirm[2];
        stateconfirmkey = stateconfirmTotal.keys.toList();
        openList = List.filled(stateconfirmkey.length, false);
      });
    }
    if (data.usfatal.length != 0) {
      setState(() {
        statefatalTotal = data.usfatal[2];
        statefatalkey = statefatalTotal.keys.toList();
      });
    }

    if (data.usdailyconfirm.length != 0) {
      setState(() {
        statedailyconfirm = data.usdailyconfirm[0];
        statedailyconfirmaddition = data.usdailyconfirm[2];
      });
    }

    if (data.usdailyfatal.length != 0) {
      setState(() {
        statedailyfatal = data.usdailyfatal[0];
        statedailyfataladdition = data.usdailyfatal[2];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(controller: _sub_tabController, children: [
          subtable(myIndex),
          statechart(myIndex),
          // statemap()
        ]),
        bottomNavigationBar: bottom_nav(_sub_tabController,myIndex));
  }
}
