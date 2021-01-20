import 'package:LaLu/app/utils/constants.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class UserApplianceDbService extends GetxService {
  Box _box;

  Future<UserApplianceDbService> init() async {
    //if (await Hive.boxExists(USERAPPLIANCEBOX))
    //  Hive.deleteBoxFromDisk(USERAPPLIANCEBOX);
    _box = await Hive.openBox(USERAPPLIANCEBOX);
    return this;
    //print('akiiii');
  }

  Box get box => _box;
}
