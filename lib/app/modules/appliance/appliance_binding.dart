import 'package:LaLu/app/modules/appliance/appliance_controller.dart';
import 'package:get/get.dart';

class ApplianceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplianceController());
  }
}
