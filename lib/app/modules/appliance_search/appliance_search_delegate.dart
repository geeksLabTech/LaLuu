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
    return ApplianceSearchWidget();
  }
}
