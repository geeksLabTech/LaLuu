import 'package:LaLu/app/data/models/appliance_model.dart';
import 'package:LaLu/app/data/repositories/local/local_appliance_db_repository.dart';
import 'package:LaLu/app/modules/appliance/appliance_controller.dart';
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
    allApplianceModels =
        _localApplianceDbRepository.localApplianceDb.getModels();
    searchedApplianceModelList = [].obs;
    searchedApplianceModelList.addAll(allApplianceModels);
  }

  void search(String query) {
    Iterable<ApplianceModel> appliances =
        searchedApplianceModelList.where((appliance) {
      return appliance.name.toLowerCase().contains(query.toLowerCase());
    });
    searchedApplianceModelList = appliances.toList();
  }
}
