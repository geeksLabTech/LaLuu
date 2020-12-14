import 'package:LaLu/app/data/models/appliance_model.dart';
import 'package:LaLu/app/data/providers/local/local_appliance_db.dart';
import 'package:get/get.dart';

class LocalApplianceDbRepository {
  final localApplianceDb = Get.find<LocalApplianceDb>();

  List<ApplianceModel> getModels() {
    return localApplianceDb.getModels();
  }

  Future<void> updateModels(List<ApplianceModel> newModels) async {
    await localApplianceDb.updateModels(newModels);
  }
}
