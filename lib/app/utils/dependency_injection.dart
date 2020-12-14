import 'package:LaLu/app/data/providers/local/local_appliance_db.dart';
import 'package:LaLu/app/data/providers/local/user_appliance_db.dart';
import 'package:get/get.dart';

class DependencyInjection {
  void init() {
    Get.lazyPut(() => LocalApplianceDb());
    Get.lazyPut(() => UserApplianceDb());
  }
}
