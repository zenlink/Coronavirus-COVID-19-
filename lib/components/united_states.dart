import 'package:flutter/material.dart';
import "package:scroll_to_index/scroll_to_index.dart";
import '../ussubcomponents/chart.dart';
import '../ussubcomponents/table.dart';
import '../ussubcomponents/trending.dart';
import '../ussubcomponents/map.dart';
import "../utility/bulletin.dart";
import "../bottom_nav.dart";
import "../data.dart";

class united_states extends StatefulWidget {
  // TabController? tabController;
  // united_states(this.tabController);
  @override
  _united_statesState createState() => _united_statesState();
}

class _united_statesState extends State<united_states>
    with SingleTickerProviderStateMixin {
  AutoScrollController? _scrollControll;
  TabController? _sub_tabController;

  @override
  void initState() {
    _sub_tabController =
        TabController(length: data.bottom_tab_list[data.mainindex].length, vsync: this);
    setState(() {
      data.usdailyconfirm =
          data.getusdailydata(data.usconfirm[3], data.usconfirm[4]);
      data.usdailyfatal = data.getusdailydata(data.usfatal[3], data.usfatal[4]);
    });
    _scrollControll = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
            controller: _sub_tabController,
            children: [table(), chart(), trending(), 
            // map()
            ]),
        bottomNavigationBar: bottom_nav(_sub_tabController));
  }
}
