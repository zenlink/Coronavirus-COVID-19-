import 'package:flutter/material.dart';
import "package:scroll_to_index/scroll_to_index.dart";
import '../countrycomponents/countrychart.dart';
import '../countrycomponents/countrytable.dart';
import '../countrycomponents/countrymap.dart';
import "../bottom_nav.dart";
import "../data.dart";

class country extends StatefulWidget {
  @override
  _countryState createState() => _countryState();
}

class _countryState extends State<country> with SingleTickerProviderStateMixin {
  // AutoScrollController? _scrollControll;
  TabController? _sub_tabController;
  int myIndex = -1;
  @override
  void initState() {
    myIndex = data.mainindex;
    _sub_tabController = TabController(
        length: data.bottom_tab_list[data.mainindex].length, vsync: this);
    // _scrollControll = AutoScrollController(
    //     viewportBoundaryGetter: () =>
    //         Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom));
    if (data.globedailyconfirm.length == 0) {
      setState(() {
        data.globedailyconfirm =
            data.getglobedailydata(data.globeconfirm[3], data.usconfirm[4]);
      });
    }
    if (data.globedailyfatal.length == 0) {
      setState(() {
        data.globedailyfatal =
            data.getglobedailydata(data.globefatal[3], data.usconfirm[4]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(controller: _sub_tabController, children: [
          countrytable(),
          countrychart(),
          //  countrymap()
        ]),
        bottomNavigationBar: bottom_nav(_sub_tabController,myIndex));
  }
}
