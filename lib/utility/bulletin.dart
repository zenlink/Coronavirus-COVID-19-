import 'package:flutter/material.dart';
import "../data.dart";

class bulletin extends StatefulWidget {
  @override
  final int confirm;
  final int newconfirm;
  final int fatal;
  final int newfatal;
  final String name;
  bulletin(
    this.confirm,
    this.newconfirm,
    this.fatal,
    this.newfatal,
    this.name
  );

  _bulletinState createState() => _bulletinState();
}

class _bulletinState extends State<bulletin> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 4),
          child:Container(
          // margin: EdgeInsets.symmetric(horizontal: 16),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            decoration: BoxDecoration(
                color: data.bulletinbackground[data.mainindex],
                // border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Text("${widget.name} ${data.usconfirm[4][data.usconfirm[4].length-1]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      height: 1.5,
                      decoration: TextDecoration.underline,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                      children: [
                        Text("Confirmed",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              height: 1.5,
                            )),
                        Text("${data.get_number_comma(widget.confirm.toString())}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              height: 1.5,
                            )),
                      ],
                    ),
                     Column(
                      children: [
                        Text("New",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              height: 1.5,
                            )),
                    
                        Text("+${data.get_number_comma(widget.newconfirm.toString())}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              height: 1.5,
                            ))
                      ],
                 
                    ),
                  
                    Column(
                      children: [
                        Text("Death",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              height: 1.5,
                            )),
                        Text("${data.get_number_comma(widget.fatal.toString())}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              height: 1.5,
                            )),
                      ],
                    ),
                     Column(
                      children: [
                        Text("New",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              height: 1.5,
                            )),
                        // Text("${data.get_number_comma(widget.fatal.toString())}",
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 16,
                        //       height: 1.5,
                        //     )),
                        Text("+${data.get_number_comma(widget.newfatal.toString())}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              height: 1.5,
                            ))
                      ],
                    )
                  ],
                )
              ],
            ))));
  }
}
