import 'package:LaLu/app/data/models/user_appliance_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class ApplianceCardsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    print(homeController.userAppliances);
    //final userAppliances = homeController.getUserAppliancesValues();
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
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Equipo: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(e.applianceModel.name),
              Text(
                " Etiqueta: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(e.tag),
            ],
          ),
          Row(
            children: [
              Text(
                "Consumo Encendido: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(e.applianceModel.consumption.toString() + 'W/h'),
              Text(
                " Consumo en Standby: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(e.applianceModel.standbyConsumption.toString() + 'W/h'),
            ],
          ),
          Row(
            children: [
              generateDays(e),
            ],
          ),
        ],
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
