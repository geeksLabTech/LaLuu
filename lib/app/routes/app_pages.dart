import 'package:LaLuu/app/modules/appliance/appliance_controller.dart';
import 'package:LaLuu/app/modules/appliance/appliance_page.dart';
import 'package:LaLuu/app/modules/home/home_controller.dart';
import 'package:LaLuu/app/modules/home/home_page.dart';
import 'package:LaLuu/app/modules/relevant_info/relevant_info_page.dart';
import 'package:LaLuu/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.HOME,
        page: () => HomePage(),
        binding: BindingsBuilder(() => {Get.lazyPut(() => HomeController())})),
    GetPage(
        name: AppRoutes.APPLIANCE,
        page: () => AppliancePage(),
        binding:
            BindingsBuilder(() => {Get.lazyPut(() => ApplianceController())})),
    GetPage(name: AppRoutes.RELEVANTINFO, page: () => RelevantInfo()),
  ];
}
