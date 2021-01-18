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
          color: const Color(0xff0293ee),
          value: onValue,
          title: 'ON ' + onValue.toString() + '%',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        );
      case 1:
        return PieChartSectionData(
          color: const Color(0xfff8b250),
          value: standbyValue,
          title: 'Standby ' + standbyValue.toString() + '%',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        );
      default:
        return null;
    }
  });
}
