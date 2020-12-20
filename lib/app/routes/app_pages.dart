import 'package:LaLu/app/modules/appliance/appliance_binding.dart';
import 'package:LaLu/app/modules/appliance/appliance_page.dart';
import 'package:LaLu/app/modules/home/home_controller.dart';
import 'package:LaLu/app/modules/home/home_page.dart';
import 'package:LaLu/app/routes/app_routes.dart';
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
        binding: ApplianceBinding())
  ];
}
