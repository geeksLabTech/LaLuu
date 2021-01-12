import 'package:LaLu/app/data/models/appliance_model.dart';
import 'package:LaLu/app/modules/appliance_search/appliance_search_controller.dart';
import 'package:LaLu/app/modules/appliance_search/local_widgets/appliance_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplianceSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ApplianceSearchWidget();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final applianceSearchController = Get.find<ApplianceSearchController>();
    applianceSearchController.search(query);
    //applianceSearchController.closeSearchFunction = close;
    return Obx(() => ListView.builder(
        itemCount: applianceSearchController.searchedApplianceModelList.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(applianceSearchController
                  .searchedApplianceModelList[index].name),
              subtitle: Text(applianceSearchController
                  .searchedApplianceModelList[index].category),
              trailing: Text(applianceSearchController
                  .searchedApplianceModelList[index].consumption
                  .toString()),
              onTap: () {
                ApplianceModel selectedAppliance =
                    applianceSearchController.searchedApplianceModelList[index];
                close(context, selectedAppliance);
              },
            )));
  }
}
