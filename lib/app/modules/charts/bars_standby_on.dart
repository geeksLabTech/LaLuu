import 'package:LaLu/app/modules/home/home_controller.dart';
import 'package:LaLu/app/modules/home/local_widgets/bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  return Column(
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
  );
}
