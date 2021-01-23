import 'package:LaLuu/app/modules/charts/charts_page.dart';
import 'package:LaLuu/app/modules/home/local_widgets/appliance_cards_list.dart';
import 'package:LaLuu/app/modules/tariff/tariff_page.dart';
import 'package:LaLuu/app/routes/app_routes.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 1;
  bool isAddBtnVisible = true;

  @override
  Widget build(BuildContext context) {
    // final homeController = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LaLuu',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _showSelectedPage(),
      bottomNavigationBar: ConvexAppBar(
        color: Colors.white,
        items: [
          TabItem(icon: Icons.electrical_services),
          TabItem(
              activeIcon: Container(
                  padding: EdgeInsets.all(10.0),
                  child: new Image.asset(
                    "assets/logo.png",
                  )),
              icon: Icons.home),
          TabItem(icon: Icons.bar_chart_sharp)
        ],
        initialActiveIndex: activeIndex,
        backgroundColor: Theme.of(context).primaryColor,
        onTap: (int value) {
          setState(() {
            activeIndex = value;
          });
        },
      ),
      floatingActionButton: Visibility(
        visible: this.isAddBtnVisible,
        child: FloatingActionButton(
          onPressed: () async {
            await Get.toNamed(AppRoutes.APPLIANCE, arguments: null);
            this.setState(() {});
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _showSelectedPage() {
    switch (activeIndex) {
      case 0:
        this.isAddBtnVisible = false;
        this.setState(() {});
        return TariffPage();
        break;
      case 1:
        this.isAddBtnVisible = true;
        this.setState(() {});
        return ApplianceCardsList();
        break;
      case 2:
        this.isAddBtnVisible = false;
        this.setState(() {});
        return ChartsPage();
        break;
    }
  }
}
