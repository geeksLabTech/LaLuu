import 'package:LaLu/app/modules/home/home_controller.dart';
import 'package:LaLu/app/modules/home/local_widgets/bar_chart.dart';
import 'package:LaLu/app/modules/home/local_widgets/pie_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget statsList() {
  return ListView(
    children: [
      Card(
        child: generatePieStandbyON(),
      ),
      Card(
        child: generateBarON(),
      )
    ],
  );
}

generatePieStandbyON() {
  double onValue = 0.0;
  double standbyValue = 0.0;
  double totalValue = 0.0;

  final homeController = Get.find<HomeController>();
  for (var i in homeController.userAppliances) {
    onValue += i.userApplianceModel.consumptionOn;
    standbyValue += i.userApplianceModel.consumptionStandby;
    totalValue += i.userApplianceModel.consumptionTotal;
  }
  onValue *= 4;
  standbyValue *= 4;
  totalValue *= 4;

  onValue = totalValue == 0 ? 0 : (onValue / totalValue * 100).toPrecision(2);
  standbyValue =
      totalValue == 0 ? 0 : (standbyValue / totalValue * 100).toPrecision(2);

  return Card(
    child: Column(
      children: [
        Text(
          "% del Consumo Total",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        PieChart(
          PieChartData(
              borderData: FlBorderData(
                show: false,
              ),
              startDegreeOffset: 0,
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: showingSections(onValue, standbyValue)),
        ),
      ],
    ),
  );
}

generateBarON() {
  Map<String, double> days = Map();
  Map<String, double> daysStandby = Map();
  List<String> daysKeys = [
    "Lun",
    "Mar",
    "Mie",
    "Jue",
    "Vie",
    "Sab",
    "Dom",
  ];

  for (var i in daysKeys) {
    days[i] = 0;
    daysStandby[i] = 0;
  }

  final homeController = Get.find<HomeController>();
  for (var i in homeController.userAppliances) {
    for (var j in i.userApplianceModel.usage.keys) {
      // if (i.usage[j] == null) {
      //   i.usage[j] = 0.0;
      // }
      days[j] == null
          ? days[j] = (i.userApplianceModel.usage[j] *
                  i.userApplianceModel.consumptionOn)
              .toPrecision(2)
          : days[j] += (i.userApplianceModel.usage[j] *
                  i.userApplianceModel.consumptionOn)
              .toPrecision(2);
      daysStandby[j] == null
          ? daysStandby[j] = ((24 - i.userApplianceModel.usage[j]) *
                  i.userApplianceModel.consumptionStandby)
              .toPrecision(2)
          : daysStandby[j] += ((24 - i.userApplianceModel.usage[j]) *
                  i.userApplianceModel.consumptionStandby)
              .toPrecision(2);
    }
  }

  return Card(
    child: Column(
      children: [
        BarChartSample1(
          days: days,
          details: 'Encendido',
        ),
        BarChartSample1(
          days: daysStandby,
          details: 'Standby',
        ),
      ],
    ),
  );
}
