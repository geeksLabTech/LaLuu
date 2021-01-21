import 'package:LaLu/app/modules/appliance_search/appliance_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplianceSearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final applianceSearchController = Get.find<ApplianceSearchController>();
    return Obx(() => ListView.builder(
        itemCount: applianceSearchController.searchedApplianceModelList.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(
                applianceSearchController
                    .searchedApplianceModelList[index].name,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                  applianceSearchController
                      .searchedApplianceModelList[index].category,
                  style: TextStyle(
                    color: Colors.black,
                  )),
              onTap: () {
                applianceSearchController.applianceController
                    .loadSelectedAppliance(applianceSearchController
                        .searchedApplianceModelList[index]);
                Get.back();
              },
            )));
  }
}
