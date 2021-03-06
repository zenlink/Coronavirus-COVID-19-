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
    
      title: Text("Covid-19 Global Summary",
          style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold))),
      centerTitle: true,
    
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
          indicatorWeight: 3,
          tabs: data.main_tab_arr
              .map((x) => (Text(x,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )))))
              .toList()),
    );
  }
}
