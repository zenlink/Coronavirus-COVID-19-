import 'package:flutter/material.dart';
import 'data.dart';
import 'nav.dart';
import "./home.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController? _tabController;
 
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    data.tabController = _tabController;
   
    _tabController!.addListener(() {
      setState(() {
         data.mainindex = _tabController!.index;
      });
     
    });
  
  }

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        
        ),
        home: Scaffold(
            appBar: nav(data.tabController, () {}),
            body: home(data.tabController)));
  }
}
