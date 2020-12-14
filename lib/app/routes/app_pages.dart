import 'package:LaLu/app/modules/home/home_page.dart';
import 'package:LaLu/app/routes/app_routes.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.HOME, page: () => HomePage())
  ];
}
