import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'dart:ui';
import "package:http/http.dart";
import 'package:shared_preferences/shared_preferences.dart';

class data {
  static final host =
      "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/";
//   const remoteUSConfirmedFile = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_US.csv";
// const remoteGlobalConfirmedFile = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv";
// const remoteUSFatalityFile = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_US.csv";
// const remoteGlobalFatalityFile = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv";

  static TabController? tabController;
  static TabController? subTabController;
  static int mainindex = 0;
  static List usconfirm = [];
  static List usfatal = [];
  static List globeconfirm = [];
  static List globefatal = [];
  static List usdailyconfirm = [];
  static List usdailyfatal = [];
  static List globedailyconfirm = [];
  static List globedailyfatal = [];
  static List averageconfirm = [];
  static List averagefatal = [];
  static final stateName = ValueNotifier<String>('Alabama');
  static final countryname = ValueNotifier<String>('Afghanistan');
  static final backgroundIndex = ValueNotifier<int>(0);
  static final fontIndex = ValueNotifier<int>(1);
  static double locationbuttonheight = 65;
  static List fontSize = [16.0, 18.0, 20.0, 22.0, 24.0, 26.0];
  static List titleSize = [18.0, 20.0, 22.0, 24.0, 26.0, 28.0];
  static List bigTitleSize = [20.0, 22.0, 24.0, 26.0, 28.0, 30.0];
  static List bottomSize = [14.0, 16.0, 18.0, 20.0, 22.0, 24.0];
  static List sizeBoxWidth = [100.0, 100.0, 100.0, 100.0, 110.0, 140.0];
  static List sizeBoxWidth2 = [100.0, 100.0, 100.0, 100.0, 110.0, 110.0];
  static List bulletinbackground = [
    Color.fromARGB(255, 94, 28, 4),
    Color.fromARGB(255, 182, 86, 154),
    Color.fromARGB(255, 37, 45, 72),
    Color.fromARGB(255, 12, 64, 80),
  ];


  static List main_tab_arr = ["US", "State", "Globe", "Country"];
  static List bottom_tab_list = [
    ["table", "chart", "trend"],
    ["table", "chart"],
    ["table", "chart", "trend"],
    ["table", "chart"],
  ];

  static List homeFontColor = [Color.fromARGB(255, 47, 79, 79), Colors.white];
  static List collectionFontColor = [Colors.black54, Colors.white];
  static List authorDetailIndexBgd = [Color.fromARGB(125, 176, 224, 230), null];
  static List authorDetailBgdSub = [
    Color.fromARGB(
      125,
      255,
      248,
      220,
    ),
    null
  ];

 
  static List usarea = [
    "American Samoa",
    "Diamond Princess",
    "Grand Princess",
    "Guam",
    "Northern Mariana Islands",
    "Virgin Islands"
  ];
  static List countryMore = [
    "United Kingdom",
    "France",
    "Canada",
    "China",
    "Netherlands",
    "Denmark",
    "Australia"
  ];

  static List contextArr = [
    "　　",
    "Copyrighted contents are the property of the copyright holders. All contents are shown free of charge for the purpose of information and with good intentions only in accordance with fair use guidelines. If we have inadvertently included a copyrighted contents that the copyright holder does not wish to be displayed, we will take the contents down within 48 hours upon notification by the owner or the owner's legal representative.",
    "　　",
    "The information and tools in this app are given AS IS WITHOUT ANY WARRANTY OF ANY KIND.",
    "　　",
    "CovidTally and its contributors will not be liable for any damage or loss resulting from ",
    "◦ The use of the content or the tools on this app.",
    "◦ Using this app means that you accept the Terms of Use.",
    "◦ These Terms of Use are subject to change at any time."
  ];
  static Future get_us(callback) async {
    try {
      String url1 = "${host}/time_series_covid19_confirmed_US.csv";
      var res1 = await get(
        Uri.parse(url1),
        headers: {"Accept": 'application/json'},
      );

      String url2 = "${host}/time_series_covid19_deaths_US.csv";
      var res2 = await get(
        Uri.parse(url2),
        headers: {"Accept": 'application/json'},
      );

      if (res1.statusCode == 200) {
        String data1 = res1.body;
        String data2 = res2.body;
        callback(data1, data2);
      } else {
        print("Failed ${res1.statusCode}");
        print("Failed ${res2.statusCode}");
      }
    } catch (error) {
      print(error);
    }
  }

  static Future get_globe(callback) async {
    try {
      String url1 = "${host}/time_series_covid19_confirmed_global.csv";
      var res1 = await get(
        Uri.parse(url1),
        headers: {"Accept": 'application/json'},
      );

      String url2 = "${host}/time_series_covid19_deaths_global.csv";
      var res2 = await get(
        Uri.parse(url2),
        headers: {"Accept": 'application/json'},
      );

      if (res1.statusCode == 200) {
        String data1 = res1.body;
        String data2 = res2.body;
        callback(data1, data2);
      } else {
        print("Failed ${res1.statusCode}");
        print("Failed ${res2.statusCode}");
      }
    } catch (error) {
      print(error);
    }
  }

  static getustableobj(data, num) {
    List a = [];
    Map us_obj = {};
    Map uscountytotal = {};
    LineSplitter ls = new LineSplitter();
    List rawData = ls.convert(data);
    List dateList = [];
    int dateLen = 0;
    if (num == 1) {
      String a = rawData[0].substring(85);
      dateList = a.split(",");
      dateLen = dateList.length;
    } else {
      String a = rawData[0].substring(96);
      dateList = a.split(",");
      dateLen = dateList.length;
    }

    int len = rawData.length;
    String currentstate = "Alabama";
    int statetotal = 0;
    int stateaddition = 0;
    int ustotal = 0;
    int usaddition = 0;
    int curNum = 0;
    int newAddition = 0;
    List county_data = [];
    for (var i = 1; i < len; i++) {
      String item = rawData[i];
      int p1 = item.indexOf('"');
      int p2 = item.indexOf('"', p1 + 1);
      String state_county_name = item.substring(p1 + 1, p2);
      List state_county_list = state_county_name.split(",");
      // if (state_county_list[1].indexOf(" ") > -1 &&
      //     state_county_list[1].indexOf(" ") == 0) {
      //   state_county_list[1] = state_county_list[1].substring(1);
      // }
      if (num == 1) {
        county_data = item.substring(p2 + 2).split(",");
      } else {
        county_data = item.substring(p2 + 2).split(",").sublist(1);
      }
      int l = state_county_list.length;
      if (l < 3) {
        us_obj[state_county_list[0]] = county_data;
        int coutylen = county_data.length;

        int preNum = int.parse(county_data[coutylen - 2]);
        curNum = int.parse(county_data[coutylen - 1]);
        newAddition = curNum - preNum;
        if (uscountytotal[state_county_list[0]] == null) {
          uscountytotal[state_county_list[0]] = {};
        }
        uscountytotal[state_county_list[0]]["total"] = [curNum, newAddition];
      } else {
        state_county_list[1] = state_county_list[1].trim();
        if (us_obj[state_county_list[1]] == null) {
          us_obj[state_county_list[1]] = {};
        }
        us_obj[state_county_list[1]][state_county_list[0]] = county_data;
        int coutylen = county_data.length;
        int preNum = int.parse(county_data[coutylen - 2]);
        curNum = int.parse(county_data[coutylen - 1]);
        newAddition = curNum - preNum;
        if (currentstate == state_county_list[1]) {
          statetotal += curNum;
          stateaddition += newAddition;
        } else {
          currentstate = state_county_list[1];
          statetotal = curNum;
          stateaddition = newAddition;
        }

        if (uscountytotal[state_county_list[1]] == null) {
          uscountytotal[state_county_list[1]] = {};
        }
        uscountytotal[state_county_list[1]]
            ["total"] = [statetotal, stateaddition];
        uscountytotal[state_county_list[1]]
            [state_county_list[0]] = [curNum, newAddition];
      }

      ustotal += curNum;
      usaddition += newAddition;
    }
    return [ustotal, usaddition, uscountytotal, us_obj, dateList];
  }

  static getglobetableobj(data) {
    String country = "";
    Map countryObj = {};
    String countryDaily = "";
    int prenum = 0;
    int curnum = 0;
    int addition = 0;
    Map globalcountrytotal = {};
    int newAddition = 0;
    int dailydatalen = 0;
    List eachlist = [];
    int globetotal = 0;
    int globeaddition = 0;
    String countryName = "Australia";
    int countrytotal = 0;
    int countryaddition = 0;
    LineSplitter ls = new LineSplitter();
    List raw = ls.convert(data);
    List rawData = raw.sublist(1);
    List date = raw[0].substring(39).split(",");

    for (var i = 0; i < rawData.length; i++) {
      String item = rawData[i];
      int p1 = item.indexOf(',');
      int p2 = item.indexOf(',', p1 + 1);
      int p3 = item.indexOf(',', p2 + 1);
      int p4 = item.indexOf(',', p3 + 1);
      int pe1 = item.indexOf('"');
      int pe2 = item.indexOf('"', pe1 + 1);
      country = item.substring(p1 + 1, p2);
      if (country == '"Korea') {
        country = item.substring(pe1 + 1, pe2);
        int p5 = item.indexOf(',', p4 + 1);
        countryDaily = item.substring(p5 + 1);
        eachlist = countryDaily.split(",");
        countryObj[country] = eachlist;
        dailydatalen = eachlist.length;
        prenum = int.parse(eachlist[dailydatalen - 2]);
        curnum = int.parse(eachlist[dailydatalen - 1]);
        addition = curnum - prenum;
        if (globalcountrytotal[country] == null) {
          globalcountrytotal[country] = {};
        }
        globalcountrytotal[country]["total"] = [curnum, addition];
      } else {
        if (pe1 > -1) {
          country = item.substring(p2 + 1, p3);
          String stateName = item.substring(pe1 + 1, pe2);
          int p5 = item.indexOf(',', p4 + 1);
          countryDaily = item.substring(p5 + 1);
          eachlist = countryDaily.split(",");
          if (countryObj[country] == null) {
            countryObj[country] = {};
          }
          countryObj[country][stateName] = eachlist;
          dailydatalen = eachlist.length;
          prenum = int.parse(eachlist[dailydatalen - 2]);
          curnum = int.parse(eachlist[dailydatalen - 1]);
          addition = curnum - prenum;
          if (countryName == country) {
            countrytotal += curnum;
            countryaddition += addition;
          } else {
            countryName = country;
            countrytotal = curnum;
            countryaddition = addition;
          }
          if (globalcountrytotal[country] == null) {
            globalcountrytotal[country] = {};
          }
          globalcountrytotal[country][stateName] = [curnum, addition];
          globalcountrytotal[country]
              ["total"] = [countrytotal, countryaddition];
        } else if (countryMore.indexOf(country) > -1) {
          String stateName = item.substring(0, p1);
          countryDaily = item.substring(p4 + 1);
          eachlist = countryDaily.split(",");
          if (countryObj[country] == null) {
            countryObj[country] = {};
          }
          countryObj[country][stateName] = eachlist;
          dailydatalen = eachlist.length;
          prenum = int.parse(eachlist[dailydatalen - 2]);
          curnum = int.parse(eachlist[dailydatalen - 1]);
          addition = curnum - prenum;
          if (countryName == country) {
            countrytotal += curnum;
            countryaddition += addition;
          } else {
            countryName = country;
            countrytotal = curnum;
            countryaddition = addition;
          }
          if (globalcountrytotal[country] == null) {
            globalcountrytotal[country] = {};
          }
          globalcountrytotal[country][stateName] = [curnum, addition];
          globalcountrytotal[country]
              ["total"] = [countrytotal, countryaddition];
        } else {
          countryDaily = item.substring(p4 + 1);
          eachlist = countryDaily.split(",");
          countryObj[country] = eachlist;
          dailydatalen = eachlist.length;
          prenum = int.parse(eachlist[dailydatalen - 2]);
          curnum = int.parse(eachlist[dailydatalen - 1]);
          addition = curnum - prenum;
          if (globalcountrytotal[country] == null) {
            globalcountrytotal[country] = {};
          }
          globalcountrytotal[country]["total"] = [curnum, addition];
        }
      }
      globetotal += curnum;
      globeaddition += addition;
    }
    return [globetotal, globeaddition, globalcountrytotal, countryObj];
  }

  static getusdailydata(usobj, dateList) {
    // end of Table
    // make us state daily data
    Map daylyusobj = {};
    Map daylycountyobj = {};
    int sum = 0;
    List smallList = [];
    int dateLen = dateList.length;
    for (var key in usobj.keys) {
      smallList = [];
      if (usobj[key].length != dateLen) {
        for (var i = 0; i < dateLen; i++) {
          sum = 0;
          usobj[key].forEach((x, value) {
            sum += int.parse(value[i]);
          });
          smallList.add(sum);
        }
      } else {
        for (var i = 0; i < usobj[key].length; i++) {
          int n = int.parse(usobj[key][i]);
          smallList.add(n);
        }
      }
      daylycountyobj[key] = smallList;
    }

// make state addition
    int addition = 0;
    Map stateadditionobj = {};
    for (var key in daylycountyobj.keys) {
      smallList = [0];
      for (var i = 1; i < daylycountyobj[key].length; i++) {
        addition = daylycountyobj[key][i] - daylycountyobj[key][i - 1];

        smallList.add(addition);
      }
      stateadditionobj[key] = smallList;
    }

    // make us daily data
    int ussum = 0;
    int usadditionsum = 0;
    List usdaylyList = [];
    List usadditionList = [];

    for (var i = 0; i < dateLen; i++) {
      ussum = 0;
      usadditionsum = 0;
      for (var key in daylycountyobj.keys) {
        int b = daylycountyobj[key][i];
        ussum += b;
        int c = stateadditionobj[key][i];
        usadditionsum += c;
      }
      usdaylyList.add(ussum);
      usadditionList.add(usadditionsum);
    }

    return [daylycountyobj, usdaylyList, stateadditionobj, usadditionList];
  }

  static getglobedailydata(globeobj, dateList) {
    int globedailyaddition = 0;
    int globedaily = 0;
    int addition = 0;
    int countrytotal = 0;
    List countryList = [];
    Map countrydailyadditionobj = {};
    Map countrydailyobj = {};
    List smallarr = [0];
    int dateLen = dateList.length;
    List globedailyList = [];
    List globedailyadditionList = [];

    for (var key in globeobj.keys) {
      smallarr = [0];
      if (countryMore.indexOf(key) > -1) {
        countryList = [];
        for (var j = 0; j < dateLen; j++) {
          countrytotal = 0;
          globeobj[key].forEach((x, value) {
            // try {
            countrytotal += int.parse(value[j]);
            // }
            // catch (e) {
            //   print("ERrr");
            // }
          });
          countryList.add(countrytotal);
        }

        countrydailyobj[key] = countryList;

        for (var k = 1; k < countryList.length; k++) {
          int pre = countryList[k - 1];
          int next = countryList[k];
          addition = next - pre;
          smallarr.add(addition);
        }
        countrydailyadditionobj[key] = smallarr;
      } else {
        int a = int.parse(globeobj[key][0]);
        List temparr = [a];
        for (var i = 1; i < globeobj[key].length; i++) {
          int pre = int.parse(globeobj[key][i - 1]);
          int next = int.parse(globeobj[key][i]);
          addition = next - pre;
          smallarr.add(addition);
          temparr.add(next);
        }
        countrydailyadditionobj[key] = smallarr;
        countrydailyobj[key] = temparr;
      }
    }

    for (var i = 0; i < dateLen; i++) {
      globedailyaddition = 0;
      globedaily = 0;
      for (var key in countrydailyobj.keys) {
        int b = countrydailyobj[key][i];
        globedaily += b;
        int c = countrydailyadditionobj[key][i];
        globedailyaddition += c;
      }
      globedailyList.add(globedaily);
      globedailyadditionList.add(globedailyaddition);
    }

    return [
      countrydailyobj,
      globedailyList,
      countrydailyadditionobj,
      globedailyadditionList
    ];
  }
// make us average data;

  static getusaveragedata(dailydata, count) {
    int usaveragestart = 0;
    int usaveragestartsum = 0;
    List usaveragetList = [];
    int length = dailydata.length;
    // int averagecount = 20;
    List arr = [];
    for (var i = length - 1; i > length - count - 1; i--) {
      // arr.add(i);
      int t = dailydata[i];
      usaveragestartsum += t;
    }
    usaveragestart = (usaveragestartsum / count).floor();
    usaveragetList.add(usaveragestart);

    for (var i = length - 2; i > count - 2; i--) {
      usaveragestartsum += (dailydata[i - count + 1] - dailydata[i + 1]) as int;
      // int temp =
      //     ((dailydata[i - count + 1] - dailydata[i + 1]) / count).floor();
      // // arr.add([temp, usaveragestart]);
      // // arr.add([i - count + 1, i + 1]);
      // usaveragestart += temp;
      usaveragestart = (usaveragestartsum / count).floor();
      usaveragetList.insert(0, usaveragestart);
    }
    return usaveragetList;
  }

  static getdatafortable(data1, data2) {
    List smallList = [];
    Map smallobj = {};
    Map obj = {};
    for (var key in data1.keys) {
      smallobj = {};
      data1[key].forEach((x, value) {
        smallList = [];
        smallList = [...value, ...data2[key][x]];
        smallobj[x] = smallList;
      });
      obj[key] = smallobj;
    }
    return obj;
  }

  static getdataforchartusglobe(data1, data2) {
    List smallList = [];
    List biglist = [];
    for (var key in data1.keys) {
      smallList = [key, data1[key]["total"][0], data2[key]["total"][0]];
      biglist.add(smallList);
    }
    biglist.sort((a, b) {
      return b[1].compareTo(a[1]);
    });
    List a1 = biglist.sublist(0, 10);
    List a2 = biglist.sublist(10);
    int total1 = 0;
    int total2 = 0;
    for (var i = 0; i < a2.length; i++) {
      total1 += a2[i][1] as int;
      total2 += a2[i][2] as int;
    }
    a1.add(["others", total1, total2]);
    return a1;
  }

  static getdataforstatecountry(data1, data2, name) {
    List smallList = [];
    List biglist = [];
    for (var key in data1.keys) {
      if (key != "total") {
        if (key == "") {
          smallList = [name, data1[key][0], data2[key][0]];
        } else {
          smallList = [key, data1[key][0], data2[key][0]];
        }
        biglist.add(smallList);
      }
    }
    biglist.sort((a, b) {
      return b[1].compareTo(a[1]);
    });
    List a1 = [];
    List a2 = [];
    if (biglist.length > 10) {
      a1 = biglist.sublist(0, 10);
      a2 = biglist.sublist(10);
      int total1 = 0;
      int total2 = 0;
      for (var i = 0; i < a2.length; i++) {
        total1 += a2[i][1] as int;
        total2 += a2[i][2] as int;
      }
      a1.add(["others", total1, total2]);
    } else {
      a1 = biglist;
    }
    return a1;
  }

  static get_number_comma(String str) {
    String st = "";
    int len = str.length;
    String a = "";
    for (var i = 0; i < len; i = i + 3) {
      if (len - 3 - i > 0) {
        a = "," + str.substring(len - 3 - i, len - i);
      } else {
        a = str.substring(0, len - i);
      }
      st = a + st;
    }
    return st;
  }

  static getsublist(obj) {
    List arr = obj.keys.toList();
    arr.remove("total");
    return arr;
  }
  // static getusnumber(data) {
  //   print(data);
  //   Map ustotalobj = {};
  //   for (var key in data.keys) {
  //     int total = 0;
  //     int additiontotal = 0;
  //     if (data[key].runtimeType is Map) {
  //       Map countyobj = data[key];
  //       List arr = [];
  //       for (var county in countyobj.keys) {
  //         int len = countyobj[county].length;
  //         int preNum = int.parse(countyobj[county][len - 2]);
  //         int curNum = int.parse(countyobj[county][len - 1]);
  //         int newAddition = curNum - preNum;
  //         arr = [curNum, newAddition];
  //         total += curNum;
  //         additiontotal += newAddition;
  //         if (ustotalobj[key] == null) {
  //           ustotalobj[key] = {};
  //         }
  //         ustotalobj[key][county] = arr;
  //       }
  //       ustotalobj[key]["total"] = [total, additiontotal];
  //     } else {}
  //   }
  // print(ustotalobj);
}

// static Future getAuthorPoetries(
//     callback, dynasty, author, start, count) async {
//   try {
//     String url =
//         "${host}/api/getAuthorPoetriesF?dynasty=${dynasty}&author=${author}&start=${start}&count=${count}";

//     var res = await get(
//       Uri.parse(url),
//       headers: {"Accept": 'application/json'},
//     );

//     if (res.statusCode == 200) {
//       Map body = json.decode(res.body);
//       callback(body);
//     } else {
//       print("Failed ${res.statusCode}");
//     }
//   } catch (error) {
//     print(error);
//   }
// }

// static Future getSearchAuthorsF(callback, author, start, count) async {
//   try {
//     String url =
//         "${host}/api/getSearchAuthorsF?name=${author}&start=${start}&count=${count}";
//     var res = await get(
//       Uri.parse(url),
//       headers: {"Accept": 'application/json'},
//     ).timeout(Duration(seconds: 60));

//     if (res.statusCode == 200) {
//       Map body = json.decode(res.body);
//       callback(body);
//     } else {
//       print("Failed ${res.statusCode}");
//       callback(null);
//     }
//   } catch (error) {
//     print(error);
//     callback(null);
//   }
// }

// static void saveItem(key, value) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   if (value is Map) {
//     Map<String, dynamic> newV = {};
//     value.forEach((key, value) {
//       newV[key.toString()] = value;
//     });
//     prefs.setString(key, jsonEncode(newV));
//   }
//   if (value is int) {
//     prefs.setInt(key, value);
//   }
// }

// static List favoriteList = ["favoriteAuthor", "favoritePoetry"];
// static List settingList = ["背景", "字体大小"];
// static void getItem(keyList, callback) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   Map<String, dynamic> ret = {};
//   for (int i = 0; i < favoriteList.length; i++) {
//     if (keyList.any((item) => item == favoriteList[i])) {
//       Map v = {};
//       String? s = prefs.getString(favoriteList[i]);
//       if (s != null) {
//         v = jsonDecode(s);
//       }
//       ret[favoriteList[i]] = v;
//     }
//   }
//   for (int i = 0; i < settingList.length; i++) {
//     if (keyList.any((item) => item == settingList[i])) {
//       int? s = prefs.getInt(settingList[i]);
//       if (s != null) {
//         ret[settingList[i]] = s;
//       }
//     }
//   }
//   callback(ret);
// }
// }
