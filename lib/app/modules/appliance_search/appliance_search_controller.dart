import 'package:LaLuu/app/data/models/appliance_model.dart';
import 'package:LaLuu/app/data/repositories/local/local_appliance_db_repository.dart';
import 'package:LaLuu/app/modules/appliance/appliance_controller.dart';
import 'package:get/get.dart';

class ApplianceSearchController extends GetxController {
  ApplianceController applianceController;
  LocalApplianceDbRepository _localApplianceDbRepository;
  List<ApplianceModel> allApplianceModels;
  RxList<ApplianceModel> searchedApplianceModelList;

  @override
  void onInit() {
    super.onInit();
    applianceController = Get.find<ApplianceController>();
    _localApplianceDbRepository = Get.find<LocalApplianceDbRepository>();
    allApplianceModels =
        _localApplianceDbRepository.localApplianceDb.getModels();
    searchedApplianceModelList = RxList<ApplianceModel>([]);
    searchedApplianceModelList.addAll(allApplianceModels);
  }

  void search(String query) {
    Iterable<ApplianceModel> appliances = allApplianceModels.where((appliance) {
      return appliance.name.toLowerCase().contains(query.toLowerCase()) ||
          appliance.category.toLowerCase().contains(query.toLowerCase());
    });
    searchedApplianceModelList = appliances.toList().obs;
  }
}
