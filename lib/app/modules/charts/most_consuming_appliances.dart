import 'package:LaLu/app/modules/home/home_controller.dart';
import 'package:get/get.dart';

generateMostConsumingAppliances() {
  final homeController = Get.find<HomeController>();
  homeController.userAppliances.sort((a, b) => (a
      .userApplianceModel.consumptionTotal
      .compareTo(b.userApplianceModel.consumptionTotal)));
}
