import 'package:flutter/material.dart';
import "package:scroll_to_index/scroll_to_index.dart";
import '../globesubcomponents/chartforglobe.dart';
import '../globesubcomponents/tableforglobe.dart';
import '../globesubcomponents/trendingforglobe.dart';
import '../globesubcomponents/mapforglobe.dart';
import "../bottom_nav.dart";
import "../data.dart";

class globe extends StatefulWidget {
  @override
  _globeState createState() => _globeState();
}

class _globeState extends State<globe> with SingleTickerProviderStateMixin {
  AutoScrollController? _scrollControll;
  TabController? _sub_tabController;
 int myIndex = -1;

  @override
  void initState() {
     myIndex = data.mainindex;
    _sub_tabController = TabController(
        length: data.bottom_tab_list[data.mainindex].length, vsync: this);
    _scrollControll = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom));
    setState(() {
      data.globedailyconfirm =
          data.getglobedailydata(data.globeconfirm[3], data.usconfirm[4]);

      data.globedailyfatal =
          data.getglobedailydata(data.globefatal[3], data.usconfirm[4]);
    });
  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
        body: TabBarView(controller: _sub_tabController, children: [
          tableforglobe(),
          chartforglobe(),
          trendingforglobe(data.globedailyconfirm[2]),
          // mapforglobe()
        ]),
        bottomNavigationBar: bottom_nav(_sub_tabController,myIndex));
  }
}
