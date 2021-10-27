import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import "package:scroll_to_index/scroll_to_index.dart";
import 'package:google_fonts/google_fonts.dart';
import 'data.dart';

class nav extends StatefulWidget implements PreferredSizeWidget {
  final TabController? tabController;
  dynamic callback;
  nav(this.tabController, this.callback);
  @override
  final Size preferredSize = Size.fromHeight(65); // default is 56.0

  @override
  _navState createState() => _navState();
}

class _navState extends State<nav> with SingleTickerProviderStateMixin {
  List settingKey = [];
  List settingValue = [];

  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Image(
        image: AssetImage(
          "assets/images/coronavirus1.jpg",
        ),
        fit: BoxFit.cover,
        alignment: Alignment.bottomCenter,
      ),
      backgroundColor: data.navBackgroundList[data.backgroundIndex.value],
      title: Text("Covid-19 Global Summary",
          style: GoogleFonts.lato(
              textStyle: TextStyle(
                  // backgroundColor: Color.fromARGB(125, 10, 10, 10),
                  color: Colors.white,
                  // fontFamily: "Noto Serif, serif",
                  fontSize: 18,
                  fontWeight: FontWeight.bold))),
      centerTitle: true,
      // leading: Data.isHome.value
      //     ? null
      //     : IconButton(
      //         onPressed: () {
      //           Data.isHome.value = true;
      //           Data.isAuthorGroup = false;
      //            Data.authorSearchIndex.value = -1;
      //         },
      //         icon: Icon(Icons.arrow_back)),
      actions: [
        IconButton(
            onPressed: () {
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
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade300,
                                              width: 3,
                                              style: BorderStyle.solid))),
                                  child: TextButton(
                                      onPressed: () async {
                                        const url =
                                            'https://play.google.com/store/apps/developer?id=JumpyPixels';

                                        if (await canLaunch(url)) {
                                          await launch(url,
                                              forceSafariVC: false);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                      child: Text(
                                        "More Jumpypixels' Apps",
                                        style: TextStyle(
                                          fontSize: 18,
                                           color:Colors.black
                                        ),
                                      ))),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: TextButton(
                                      onPressed: () async {
                                        const url =
                                            'mailto:jumpypixels@gmail.com';

                                        if (await canLaunch(url)) {
                                          await launch(url,
                                              forceSafariVC: false);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                      child: Text(
                                        "Contact us (jumpypixels@gmail.com)",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color:Colors.black
                                        ),
                                      ))),
                            ])));
                  });
            },
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            )),
      ],
      bottom: TabBar(
          controller: widget.tabController,
          isScrollable: true,
          indicatorColor: Colors.white,
          labelColor: Colors.yellow,
          // labelColor: Color.fromARGB(255,157,63,171),
          indicatorWeight: 3,
          tabs: data.main_tab_arr
              .map((x) => (Text(x,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    // color: Colors.red.shade900,
                    //  backgroundColor: Color.fromARGB(125, 10, 10, 10),
                    fontSize: 16,
                  )))))
              .toList()),
    );
  }
}
