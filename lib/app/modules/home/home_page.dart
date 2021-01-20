import 'package:LaLu/app/modules/charts/charts_page.dart';
import 'package:LaLu/app/modules/home/home_controller.dart';
import 'package:LaLu/app/modules/home/local_widgets/appliance_cards_list.dart';
import 'package:LaLu/app/modules/home/local_widgets/stats_list.dart';
import 'package:LaLu/app/modules/tariff/tariff_page.dart';
import 'package:LaLu/app/routes/app_routes.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 1;

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Scaffold(
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
      ),
      body: _showSelectedPage(),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.electrical_services),
          TabItem(icon: Icons.home),
          TabItem(icon: Icons.bar_chart_sharp)
        ],
        initialActiveIndex: activeIndex,
        onTap: (int value) {
          setState(() {
            activeIndex = value;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.toNamed(AppRoutes.APPLIANCE, arguments: null);
          this.setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _showSelectedPage() {
    switch (activeIndex) {
      case 0:
        return TariffPage();
        break;
      case 1:
        return ApplianceCardsList();
        break;
      case 2:
        return ChartsPage();
        break;
    }
  }
}
