import 'package:LaLuu/app/data/providers/local/local_appliance_db.dart';
import 'package:LaLuu/app/data/providers/local/user_appliance_db.dart';
import 'package:LaLuu/app/data/repositories/local/local_appliance_db_repository.dart';
import 'package:LaLuu/app/data/repositories/local/user_db_repository.dart';
import 'package:LaLuu/app/modules/appliance_search/appliance_search_controller.dart';
import 'package:get/get.dart';

class DependencyInjection {
  void init() {
    Get.lazyPut(() => LocalApplianceDb());
    Get.lazyPut(() => UserApplianceDb());
    Get.lazyPut(() => LocalApplianceDbRepository());
    Get.lazyPut(() => UserDbRepository());
    Get.lazyPut(() => ApplianceSearchController());
  }
}
