import 'package:LaLu/app/data/models/appliance_model.dart';
import 'package:LaLu/app/data/providers/local/local_appliance_db.dart';
import 'package:get/get.dart';

class LocalApplianceDbRepository {
  LocalApplianceDb localApplianceDb;

  LocalApplianceDbRepository() {
    localApplianceDb = Get.find<LocalApplianceDb>();
    print("localAppliance db");
    print(localApplianceDb);
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
