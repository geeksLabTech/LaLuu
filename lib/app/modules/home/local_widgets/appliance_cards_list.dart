import 'dart:math';

import 'package:LaLu/app/data/models/user_appliance_model.dart';
import 'package:LaLu/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class ApplianceCardsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Obx(
      () => ListView(
        children: homeController.userAppliances.values
            .map((e) => InkWell(
                  onLongPress: () {
                    //TODO Remove Functionality
                  },
                  child: createCard(e),
                ))
            .toList(),
      ),
      // createSummary(),
      // ],
    );
  }

  createCard(UserApplianceModel e) {
    return Card(
      color: Colors.white70,
      elevation: 6.0,
      margin: EdgeInsets.all(6),
      child: Container(
        padding: EdgeInsets.all(4),
        child: Column(
          children: [
            Row(
              children: [
                Spacer(),
                Text(
                  "Equipo: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(e.applianceModel.name),
                Spacer()
              ],
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  "Etiqueta: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(e.tag),
                Spacer(),
              ],
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  "Consumo Encendido: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(e.applianceModel.consumption.toString() + ' W/h'),
                Spacer(),
              ],
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  "Consumo en Standby: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(e.applianceModel.standbyConsumption.toString() + ' W/h'),
                Spacer(),
              ],
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  "ON: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(e.consumptionOn.toString() + " W"),
                Spacer(flex: 3),
                Text(
                  "Standby: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(e.consumptionStandby.toString() + " W"),
                Spacer(flex: 3),
                Text(
                  "Total: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(e.consumptionTotal.toString() + " W"),
                Spacer()
              ],
            ),
            Row(
              children: [
                Spacer(),
                generateDays(e),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  generateDays(UserApplianceModel e) {
    List<Widget> children = [];

    for (var i in e.usage.keys) {
      children.add(Container(
        margin: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
        child: Column(
          children: [
            Text(
              i,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(e.usage[i].toString() + ' h'),
          ],
        ),
      ));
    }

    return Container(
      child: Row(
        children: children,
      ),
    );
  }
}

Widget createSummary() {
  return Card(
    child: Row(
      children: [
        Text(getTotalConsumption().toString() + ' kW'),
        Spacer(),
        Text(getTotalCost().toString() + ' CUP'),
      ],
    ),
  );
}

double getTotalConsumption() {
  double consumption = 0.0;
  final homeController = Get.find<HomeController>();
  for (var i in homeController.userAppliances.values) {
    for (var j in i.usage.keys) {
      consumption += 4 * i.usage[j] * i.consumptionOn;
      consumption += 4 * (24 - i.usage[j]) * i.consumptionStandby;
    }
  }
  return consumption / 1000;
}

double getTotalCost() {
  double consumption = getTotalConsumption();
  double cost = 0.0;

  // for (var i = 0;i < PRICES.length; i++){
  //   var limit = CONSUMPTIONRANGES[CONSUMPTIONRANGES.length-(i+1)];
  //   if (consumption > limit){
  //     cost += consumption-limit*PRICES[]
  //   }
  // }

  if (consumption > 5000) {
    cost += consumption - 5000 * PRICES[9];
    consumption -= consumption - 5000;
  }
  if (consumption > 1000) {
    cost += consumption - 1000 * PRICES[8];
    consumption -= consumption - 1000;
  }
  if (consumption > 500) {
    cost += consumption - 500 * PRICES[7];
    consumption -= consumption - 500;
  }
  if (consumption > 350) {
    cost += consumption - 350 * PRICES[6];
    consumption -= consumption - 350;
  }
  if (consumption > 300) {
    cost += consumption - 300 * PRICES[5];
    consumption -= consumption - 300;
  }
  if (consumption > 250) {
    cost += consumption - 250 * PRICES[4];
    consumption -= consumption - 250;
  }
  if (consumption > 200) {
    cost += consumption - 200 * PRICES[3];
    consumption -= consumption - 200;
  }
  if (consumption > 150) {
    cost += consumption - 150 * PRICES[2];
    consumption -= consumption - 150;
  }
  if (consumption > 100) {
    cost += consumption - 100 * PRICES[1];
    consumption -= consumption - 100;
  }
  if (consumption > 0) {
    cost += consumption * PRICES[0];
  }
  return cost;
}
