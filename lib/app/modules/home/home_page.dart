import 'package:LaLu/app/modules/appliance/appliance_page.dart';
import 'package:LaLu/app/modules/home/home_controller.dart';
import 'package:LaLu/app/modules/home/local_widgets/appliance_cards_list.dart';
import 'package:LaLu/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('LaLu'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () async => await homeController.deleteDb(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.APPLIANCE),
        child: Icon(Icons.add),
      ),
      body: ApplianceCardsList(),
    );
  }
}
