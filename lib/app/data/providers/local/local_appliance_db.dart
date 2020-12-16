import 'package:LaLu/app/data/models/appliance_model.dart';
import 'package:LaLu/app/data/services/appliance_db_service.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LocalApplianceDb {
  Box<Map<String, dynamic>> _box = Get.find<ApplianceDbService>().box;

  Future<void> _addNewModel(ApplianceModel newModel) async {
    await _box.add(newModel.toJson());
  }

  List<ApplianceModel> getModels() {
    return _box.values.map((e) => ApplianceModel.fromJson(e)).toList();
  }

  Future<void> updateModels(List<ApplianceModel> newModels) async {
    await _box.clear();
    newModels.forEach((model) {
      _addNewModel(model);
    });
  }
}