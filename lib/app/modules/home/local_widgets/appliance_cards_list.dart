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
                  child: Container(
                    child: Row(
                      children: [
                        Text(e.applianceModel.name),
                        Text(e.tag),
                        Text(e.applianceModel.consumption.toString()),
                      ],
                    ),
                  ),
                ))
            .toList()));
  }
}
