// ignore: file_names
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MultipLineChart extends StatelessWidget {
  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';
  final List list1;
  final List list2;
  final List list3;
  final RangeValues rangevalue;
  final String maincase;
  final String newcase;
  final int count;

  MultipLineChart(this.list1, this.list2, this.list3, this.rangevalue,
      this.maincase, this.newcase, this.count);

  List<charts.Series<dynamic, DateTime>> createSampleData() {
    final List<TimeSeriesSales> data = [];
    final List<TimeSeriesSales> data1 = [];

    DateFormat format = DateFormat("MM/dd/yy");
     for (var i = rangevalue.start.floor()+count; i < rangevalue.end.floor(); i++) {
      data.add(new TimeSeriesSales(format.parse(list1[i]), list2[i-count]));
    }

    for (var i = rangevalue.start.floor(); i < rangevalue.end.floor(); i++) {
      data1.add(new TimeSeriesSales(format.parse(list1[i]), list3[i]));
    }
  
    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: newcase,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      ),
      new charts.Series<TimeSeriesSales, DateTime>(
        id: maincase,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data1,
      )..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new charts.TimeSeriesChart(
      createSampleData(),
      animate: false,
      primaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec:
              new charts.BasicNumericTickProviderSpec(desiredTickCount: 3)),
      secondaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec:
              new charts.BasicNumericTickProviderSpec(desiredTickCount: 3)),

      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      dateTimeFactory: const charts.LocalDateTimeFactory(),
      behaviors: [new charts.SeriesLegend(
          position: charts.BehaviorPosition.top,
           outsideJustification: charts.OutsideJustification.endDrawArea,
            horizontalFirst: false,
        desiredMaxColumns: 2)],
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
