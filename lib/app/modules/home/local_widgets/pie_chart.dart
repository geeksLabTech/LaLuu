import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<PieChartSectionData> showingSections(double onValue, double standbyValue) {
  int touchedIndex;

  return List.generate(2, (i) {
    final isTouched = i == touchedIndex;
    final double fontSize = isTouched ? 25 : 16;
    final double radius = isTouched ? 60 : 50;
    switch (i) {
      case 0:
        return PieChartSectionData(
          color: Colors.yellow,
          value: onValue,
          title: 'ON ' + onValue.toString() + '%',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black54),
        );
      case 1:
        return PieChartSectionData(
          color: Colors.orangeAccent,
          value: standbyValue,
          title: 'Standby ' + standbyValue.toString() + '%',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black54),
        );
      default:
        return null;
    }
  });
}
