import 'package:LaLu/app/modules/home/home_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget statsList() {
  return ListView(
    children: [
      Card(
        child: generatePieStandbyON(),
      )
    ],
  );
}

generatePieStandbyON() {
  double onValue = 0.0;
  double standbyValue = 0.0;
  double totalValue = 0.0;

  final homeController = Get.find<HomeController>();
  for (var i in homeController.userAppliances.values) {
    onValue += i.consumptionOn;
    standbyValue += i.consumptionStandby;
    totalValue += i.consumptionTotal;
  }
  onValue *= 4;
  standbyValue *= 4;
  totalValue *= 4;

  onValue = onValue / totalValue * 100;
  standbyValue = standbyValue / totalValue * 100;

  return Card(
    child: PieChart(
      PieChartData(
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 0,
          centerSpaceRadius: 40,
          sections: showingSections(onValue, standbyValue)),
    ),
  );
}

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
