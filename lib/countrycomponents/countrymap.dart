import 'package:flutter/material.dart';
import '../data.dart';

class countrymap extends StatefulWidget {
  @override
  // final List pieces;
  // chart(this.pieces);

  _countrymapState createState() => _countrymapState();
}

class _countrymapState extends State<countrymap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Column(
      //     children: widget.pieces
      //         .map((x) => Padding(
      //             padding: EdgeInsets.symmetric(horizontal: 16),
      //             child: Text(
      //               x,
      //               style: TextStyle(
      //                 color: Data.famousColor[Data.backgroundIndex.value],
      //                 height: 2,
      //                 fontSize: Data.fontSize[Data.fontIndex.value],
      //                 fontWeight: FontWeight.bold,
      //                 fontFamily: "font1",
      //               ),
            
      //             )))
      //         .toList()
      //         .cast<Widget>()),
    );
  }
}
