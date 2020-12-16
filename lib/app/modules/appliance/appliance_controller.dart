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
  RxMap<String, bool> applianceCategories;
  RxString applianceName;
  RxDouble applianceConsumption;
  RxString applianceTag;
  RxMap<String, double> applianceUsage;
  bool isEditing;

  @override
  void onInit() {
    //_localApplianceDbRepository = Get.find<LocalApplianceDbRepository>();
    super.onInit();
    _userDbRepository = Get.find<UserDbRepository>();
    _applianceSelectedKey = Get.find<int>(tag: APPLIANCESELECTEDKEY);
    if (_applianceSelectedKey == null) {
      isEditing = false;
      applianceName = ''.obs;
      applianceConsumption = 0.0.obs;
      applianceTag = ''.obs;
    } else {
      isEditing = true;
      _loadUserAppliance(_applianceSelectedKey);
    }
  }

  void loadSelectedAppliance(ApplianceModel applianceModel) {
    applianceName.value = applianceModel.name;
    applianceConsumption.value = applianceModel.consumption;
  }

  Future<void> saveUserAppliance() async {
    _createUserApplianceModel();
    if (isEditing)
      _editAppliance();
    else {
      _addAppliance();
    }
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
            consumption: this.applianceConsumption.value),
        usage: this.applianceUsage);
  }
}
