import 'package:flutter/material.dart';
import "package:flutter_spinkit/flutter_spinkit.dart";

class loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitCircle(
      color: Colors.green[800],
      size: 50.0,
    ));
  }
}