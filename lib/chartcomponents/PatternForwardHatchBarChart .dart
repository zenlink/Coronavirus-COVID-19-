
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PatternForwardHatchBarChart extends StatelessWidget {
    static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';
  final bool animate = false;
  final List recentdata;

  PatternForwardHatchBarChart(this.recentdata);

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      _constructData(),
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
      behaviors: [new charts.SeriesLegend(desiredMaxColumns: 2)],
       domainAxis: charts.OrdinalAxisSpec(
              renderSpec: charts.SmallTickRendererSpec(labelRotation: 60),)
      
    );
  }

  /// Create series list with multiple series
  List<charts.Series<StructuredData, String>> _constructData() {
    List<StructuredData> dataSeries1 = [];
    List<StructuredData> dataSeries2 = [];

    for (var i = 0; i < recentdata.length; i++) {
      dataSeries1
          .add(new StructuredData(recentdata[i][0], recentdata[i][1]));
      dataSeries2.add(new StructuredData(recentdata[i][0], recentdata[i][2]));
    }

    return [
      new charts.Series<StructuredData, String>(
        id: 'Confirmed cases',
        domainFn: (StructuredData values, _) => values.year,
        measureFn: (StructuredData values, _) => values.data,
        data: dataSeries1,
      ),
      new charts.Series<StructuredData, String>(
        id: 'Fatal cases',
        domainFn: (StructuredData values, _) => values.year,
        measureFn: (StructuredData values, _) => values.data,
        data: dataSeries2,
        fillPatternFn: (StructuredData values, _) =>
            charts.FillPatternType.forwardHatch,
      )..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
    ];
  }
}

/// Sample ordinal data type.
class StructuredData {
  final String year;
  final int data;

  StructuredData(this.year, this.data);
}
