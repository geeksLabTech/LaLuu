import 'package:LaLu/app/data/models/user_appliance_model.dart';
import 'package:LaLu/app/routes/app_routes.dart';
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
                    int key = homeController.getModelKey(e);
                    homeController.removeAppliance(key);
                  },
                  onTap: () {
                    int key = homeController.getModelKey(e);

                    Get.put<int>(key, tag: APPLIANCESELECTEDKEY);
                    print(Get.isRegistered(tag: APPLIANCESELECTEDKEY));
                    Get.toNamed(AppRoutes.APPLIANCE);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 2.5,
                    child: Column(
                      children: [
                        Text(e.tag == "" ? e.applianceModel.name : e.tag),
                        Text(
                          "Consumo: ${e.applianceModel.consumption}",
                          textAlign: TextAlign.left,
                        ),
                        Text("Estimado Mensual: "),
                        Text("IMPLEMENTAR"),
                      ],
                    ),
                  ),
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

  for (var i = 0; i < PRICES.length; i++) {
    var limit = CONSUMPTIONRANGES[CONSUMPTIONRANGES.length - (i + 1)];
    if (consumption > limit) {
      cost += consumption - limit * PRICES[i];
    }
  }

  if (consumption > 0) {
    cost += consumption * PRICES[0];
  }

  return cost;
}
