import 'package:LaLu/app/data/models/appliance_model.dart';
import 'package:LaLu/app/utils/constants.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ApplianceDbService extends GetxService {
  Box<Map<String, dynamic>> _box;

  @override
  void onInit() async {
    super.onInit();
    _box = await Hive.openBox(APPLIANCEBOX);
  }

  Box<Map<String, dynamic>> get box => _box;
}
