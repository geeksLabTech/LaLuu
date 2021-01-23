import 'package:LaLuu/app/data/models/appliance_model.dart';
import 'package:LaLuu/app/data/providers/local/local_appliance_db.dart';
import 'package:get/get.dart';

class LocalApplianceDbRepository {
  LocalApplianceDb localApplianceDb;

  LocalApplianceDbRepository() {
    localApplianceDb = Get.find<LocalApplianceDb>();
  }
  List<ApplianceModel> getModels() {
    return localApplianceDb.getModels();
  }

  Future<void> updateModels(List<ApplianceModel> newModels) async {
    await localApplianceDb.updateModels(newModels);
  }

  Future<void> delete() async {
    await localApplianceDb.delete();
  }
}
