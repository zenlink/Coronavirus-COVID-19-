import 'package:flutter/material.dart';
import 'data.dart';

class bottom_nav extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize = Size.fromHeight(100); // default is 56.0
  final TabController? tabController;
  bottom_nav(this.tabController);

  @override
  _bottom_navState createState() => _bottom_navState();
}

class _bottom_navState extends State<bottom_nav>
    with SingleTickerProviderStateMixin {
  @override

  Widget build(BuildContext context) {
          return BottomAppBar(
              color: Color.fromARGB(255, 60, 60, 60),
              
               child:TabBar(
                  unselectedLabelColor: Colors.white,
                  labelColor: Colors.orange[200],
                  controller: widget.tabController,
                  // isScrollable: true,
                  indicatorColor: Colors.red,
                  indicatorWeight: 3,
                  tabs: data.bottom_tab_list[data.mainindex]
                      .asMap()
                      .entries
                      .map((e) {
                        int i = e.key;
                        String x = e.value;
                        return Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(x,
                                style: TextStyle(
                                    fontSize:
                                        data.bottomSize[data.fontIndex.value],
                                    // fontFamily: "font1",
                                    fontWeight: FontWeight.bold)));
                      })
                      .toList()
                      .cast<Widget>())
                      
                    
                );
                      
         
      
  }
}
