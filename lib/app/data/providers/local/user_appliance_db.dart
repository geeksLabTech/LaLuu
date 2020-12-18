import 'package:LaLu/app/data/models/user_appliance_model.dart';
import 'package:LaLu/app/data/services/user_appliance_db_service.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class UserApplianceDb {
  Box<Map<String, dynamic>> _box;

  UserApplianceDb() {
    var userApplianceDbService = Get.find<UserApplianceDbService>();
    _box = userApplianceDbService.box;
    //_box = Get.find<UserApplianceDbService>().box;
    print(_box);
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

  Map<dynamic, UserApplianceModel> getAllModels() {
    var boxToMap = _box.toMap();
    Map<dynamic, UserApplianceModel> allModels;
    boxToMap.forEach((key, value) {
      allModels[key] = UserApplianceModel.fromJson(value);
    });
    return allModels;
  }

  bool isEmpty() => _box.isEmpty;

  Future<void> delete() async {
    await _box.deleteFromDisk();
  }
}
