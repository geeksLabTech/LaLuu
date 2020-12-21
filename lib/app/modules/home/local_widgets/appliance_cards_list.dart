import 'package:LaLu/app/data/models/user_appliance_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class ApplianceCardsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Obx(() => ListView(
        children: homeController.userAppliances.values
            .map((e) => InkWell(
                  onLongPress: () {
                    //TODO Remove Functionality
                  },
                  child: createCard(e),
                ))
            .toList()));
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
