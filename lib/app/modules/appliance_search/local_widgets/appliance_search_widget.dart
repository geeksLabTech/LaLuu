import 'package:LaLu/app/modules/appliance_search/appliance_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplianceSearchWidget extends StatelessWidget {
  final applianceSearchController = Get.find<ApplianceSearchController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        itemCount: applianceSearchController.searchedApplianceModelList.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(applianceSearchController
                  .searchedApplianceModelList[index].name),
              subtitle: Text(applianceSearchController
                  .searchedApplianceModelList[index].category),
              onTap: () {
                applianceSearchController.applianceController
                    .loadSelectedAppliance(applianceSearchController
                        .searchedApplianceModelList[index]);
                Get.back();
              },
            )));
  }
}
