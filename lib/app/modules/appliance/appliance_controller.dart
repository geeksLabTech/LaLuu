import 'package:LaLu/app/data/models/appliance_model.dart';
import 'package:LaLu/app/data/models/user_appliance_model.dart';
import 'package:LaLu/app/data/repositories/local/local_appliance_db_repository.dart';
import 'package:LaLu/app/data/repositories/local/user_db_repository.dart';
import 'package:LaLu/app/utils/constants.dart';
import 'package:get/get.dart';

class ApplianceController extends GetxController {
  //LocalApplianceDbRepository _localApplianceDbRepository;
  UserDbRepository _userDbRepository;
  int _applianceSelectedKey;
  //int _selectedSearchKey;
  UserApplianceModel _userApplianceModel;
  RxString applianceCategorie;
  RxString applianceName;
  RxDouble applianceConsumption;
  RxString applianceTag;
  RxMap<String, double> applianceUsage;
  RxBool isEditing;

  @override
  void onInit() {
    //_localApplianceDbRepository = Get.find<LocalApplianceDbRepository>();
    super.onInit();
    _userDbRepository = Get.find<UserDbRepository>();

    if (!Get.isRegistered<int>(tag: APPLIANCESELECTEDKEY)) {
      isEditing = false.obs;
      applianceName = ''.obs;
      applianceConsumption = 0.0.obs;
      applianceTag = ''.obs;
    } else {
      isEditing = true.obs;
      _applianceSelectedKey = Get.find(tag: APPLIANCESELECTEDKEY);
      _loadUserAppliance(_applianceSelectedKey);
    }
  }

  void loadSelectedAppliance(ApplianceModel applianceModel) {
    applianceName.value = applianceModel.name;
    applianceConsumption.value = applianceModel.consumption;
  }

  Future<void> saveUserAppliance() async {
    _createUserApplianceModel();
    if (isEditing.value)
      _editAppliance();
    else {
      _addAppliance();
    }
    Get.delete<int>(tag: APPLIANCESELECTEDKEY);
    Get.back();
  }

  Future<void> _addAppliance() async {
    await _userDbRepository.addModel(this._userApplianceModel);
    //_userAppliances[key] = applianceModel;
  }

  Future<void> _editAppliance() async {
    await _userDbRepository.editModel(
        this._applianceSelectedKey, this._userApplianceModel);
    //_userAppliances[key] = newApplianceModel;
  }

  void _loadUserAppliance(int key) {
    _userApplianceModel = _userDbRepository.getModel(key);
    applianceName = _userApplianceModel.applianceModel.name.obs;
    applianceConsumption = _userApplianceModel.applianceModel.consumption.obs;
    applianceTag = _userApplianceModel.tag.obs;
  }

  void _createUserApplianceModel() {
    this._userApplianceModel = UserApplianceModel(
        applianceModel: ApplianceModel(
            name: this.applianceName.value,
            consumption: this.applianceConsumption.value,
            category: this.applianceCategorie.value,
            standbyConsumption: 0.0),
        usage: this.applianceUsage,
        tag: this.applianceTag.value);
  }
}
