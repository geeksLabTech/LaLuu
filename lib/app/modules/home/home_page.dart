import 'package:LaLu/app/modules/home/home_controller.dart';
import 'package:LaLu/app/modules/home/local_widgets/appliance_cards_list.dart';
import 'package:LaLu/app/modules/home/local_widgets/stats_list.dart';
import 'package:LaLu/app/routes/app_routes.dart';
import 'package:LaLu/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('LaLu'),
            centerTitle: true,
            actions: [
              // TODO pass this to the card
              IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: () async => await homeController.deleteDb(),
              )
            ],
            bottom: TabBar(tabs: [
              Tab(
                text: "Equipos",
              ),
              Tab(
                text: "Estadisticas",
              )
            ]),
          ),
          body: TabBarView(
            children: [ApplianceCardsList(), statsList()],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Get.toNamed(AppRoutes.APPLIANCE),
            child: Icon(Icons.add),
          ),
        ));
  }
}
