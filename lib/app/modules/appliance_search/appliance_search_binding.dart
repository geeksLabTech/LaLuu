import 'package:LaLu/app/modules/appliance_search/appliance_search_controller.dart';
import 'package:get/get.dart';

class ApplianceSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplianceSearchController());
  }
}
