import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import "package:scroll_to_index/scroll_to_index.dart";
import "./components/globe.dart";
import "./components/united_states.dart";
import 'components/eachState.dart';
import "./components/country.dart";
import 'bottom_nav.dart';
import "./utility/loading.dart";
import "data.dart";

class home extends StatefulWidget {
  TabController? tabController;
  home(this.tabController);
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  AutoScrollController? _scrollControll;
  bool isloading = true;

  @override
  void initState() {
    _scrollControll = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom));

    data.get_us(onDataLoadforus);
    data.get_globe(ondataloadforglobe);
  }

  void onDataLoadforus(data1, data2) {
    setState(() {
      data.usconfirm = data.getustableobj(data1, 1);
      data.usfatal = data.getustableobj(data2, 2);
      isloading = false;
    });
  }

  void ondataloadforglobe(data1, data2) {
    setState(() {
      data.globeconfirm = data.getglobetableobj(data1);
      data.globefatal = data.getglobetableobj(data2);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isloading) {
      return loading();
    } else {
      return Scaffold(
          body: TabBarView(controller: widget.tabController, children: [
            united_states(),
            eachState(),
            globe(),
            country(),
          ]),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
              color: Colors.black54,
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () async {
                    const url = 'https://github.com/CSSEGISandData/COVID-19';

                    if (await canLaunch(url)) {
                      await launch(url, forceSafariVC: false);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Text("JHU CSSE COVID-19 Data",
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ))),
                        TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: (){
                       showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 150.0),
                        child: AlertDialog(
                            content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Disclaimer",
                                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                      fontSize: 18,),
                      textAlign: TextAlign.center,),
                                  Column(children: 
                                   data.contextArr.map((x) => (
                                     Text(x,
                  style: TextStyle(
                    fontSize: 16,
                  ))))
              .toList()),
                                
                            ])));
                  });
                  },
                  child:Text("Disclaimer",
                    style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ))
                   ),
                ])));
    }
  }
}
