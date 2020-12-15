import 'package:LaLu/app/data/providers/local/local_appliance_db.dart';
import 'package:LaLu/app/data/providers/local/user_appliance_db.dart';
import 'package:LaLu/app/data/repositories/local/user_db_repository.dart';
import 'package:get/get.dart';

class DependencyInjection {
  void init() {
    Get.lazyPut(() => LocalApplianceDb());
    Get.lazyPut(() => UserApplianceDb());
    Get.lazyPut(() => UserDbRepository());
  }
}
