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
