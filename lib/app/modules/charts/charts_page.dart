import 'package:LaLu/app/modules/home/home_controller.dart';
import 'package:LaLu/app/modules/home/local_widgets/stats_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    if (homeController.userAppliances.isNotEmpty)
      return Container(
        child: statsList(),
      );
    return Center(
      child: Text(
        "No hay datos para mostrar",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
