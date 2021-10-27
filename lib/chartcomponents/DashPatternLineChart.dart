// ignore: file_names
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashPatternLineChart extends StatelessWidget {
  final List list1;
  final List list2;

  DashPatternLineChart(this.list1, this.list2);

  List<charts.Series<dynamic, DateTime>> createSampleData() {
    final List<TimeSeriesSales> data = [];
    DateFormat format = DateFormat("MM/dd/yy");
    for (var i = 0; i < list1.length; i++) {
      data.add(new TimeSeriesSales(format.parse(list2[i]), list1[i]));
    }


    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: '20-d average new c',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new charts.TimeSeriesChart(
      createSampleData(),
      animate: false,
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      dateTimeFactory: const charts.LocalDateTimeFactory(),
      //  behaviors: [new charts.SeriesLegend(
      //      outsideJustification: charts.OutsideJustification.endDrawArea,
      //       // horizontalFirst: false,
      //   desiredMaxColumns: 2)],
    );
  }

  /// Create one series with sample hard coded data.
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
