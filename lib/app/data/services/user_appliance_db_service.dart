import 'package:LaLu/app/data/models/user_appliance_model.dart';
import 'package:LaLu/app/utils/constants.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class UserApplianceDbService extends GetxService {
  Box<Map<String, dynamic>> _box;

  @override
  void onInit() async {
    super.onInit();
    _box = await Hive.openBox(USERAPPLIANCEBOX);
  }

  Future<int> addModel(UserApplianceModel model) async {
    await _box.add(model.toJson());
    return _box.keyAt(_box.length - 1);
  }

  Future<void> removeModel(int key) async {
    await _box.delete(key);
  }

  Future<void> editModel(int key, UserApplianceModel newModel) async {
    await _box.put(key, newModel.toJson());
  }

  UserApplianceModel getModel(int key) {
    return UserApplianceModel.fromJson(_box.get(key));
  }
}
