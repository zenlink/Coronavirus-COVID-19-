import 'package:flutter/material.dart';
import 'data.dart';
import 'nav.dart';
import "./home.dart";

// import "./utility/BottomNav.dart";

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
    // Data.getItem([...Data.favoriteList, ...Data.settingList], loadData);
  }

  // void loadData(Map data) {
  //   setState(() {
  //     if (data["favoriteAuthor"].length > 0) {
  //       data["favoriteAuthor"].forEach((key, value) {
  //         Data.favoriteAuthor[int.parse(key)] = value;
  //       });
  //     }
  //     if (data["favoritePoetry"].length > 0) {
  //       data["favoritePoetry"].forEach((key, value) {
  //         Data.favoritePoetry[int.parse(key)] = value;
  //       });
  //       Data.myPoetryList = Data.favoritePoetry.values.toList();
  //     }

  //     if (data["背景"] != null) {
  //       Data.backgroundIndex.value = data["背景"];
  //     }
  //     if (data["字体大小"] != null) {
  //       Data.fontIndex.value = data["字体大小"];
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        
        ),
        home: Scaffold(
            appBar: nav(data.tabController, () {}),
            body: home(data.tabController)));

    //             });
    //       });
    // });
  }
}
