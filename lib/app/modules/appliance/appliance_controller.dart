import 'package:LaLu/app/data/models/appliance_model.dart';
import 'package:LaLu/app/data/models/user_appliance_model.dart';
import 'package:LaLu/app/data/repositories/local/user_db_repository.dart';
import 'package:LaLu/app/modules/home/home_controller.dart';
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
  RxDouble applianceStandbyConsumption;
  RxString applianceTag;
  RxMap<String, double> applianceUsage;
  RxBool applianceStandby;
  RxBool isEditing;

  @override
  void onInit() {
    //_localApplianceDbRepository = Get.find<LocalApplianceDbRepository>();
    super.onInit();
    _userDbRepository = Get.find<UserDbRepository>();
    try {
      _applianceSelectedKey = Get.find<int>(tag: APPLIANCESELECTEDKEY);
      isEditing = true.obs;
      _loadUserAppliance(_applianceSelectedKey);
    } catch (e) {
      print("AKIII, $e");
      isEditing = false.obs;
      applianceName = ''.obs;
      applianceConsumption = 0.0.obs;
      applianceStandbyConsumption = 0.0.obs;
      applianceTag = ''.obs;
      applianceCategorie = ''.obs;
      applianceStandby = false.obs;
    }
    applianceUsage = RxMap<String, double>();
    /*
    if (!Get.isRegistered(tag: APPLIANCESELECTEDKEY)) {
      isEditing = false.obs;
      applianceName = ''.obs;
      applianceConsumption = 0.0.obs;
      applianceStandbyConsumption = 0.0.obs;
      applianceTag = ''.obs;
      applianceCategorie = ''.obs;
      applianceStandby = false.obs;
      applianceUsage = RxMap<String, double>();
    } else {
      print('HOLLAA');
      isEditing = true.obs;
      _applianceSelectedKey = Get.find(tag: APPLIANCESELECTEDKEY);
      _loadUserAppliance(_applianceSelectedKey);
    }
    */
  }

  get name => applianceName.value;

  void loadSelectedAppliance(ApplianceModel applianceModel) {
    applianceName = applianceModel.name.obs;
    applianceConsumption = applianceModel.consumption.obs;
    applianceStandbyConsumption = applianceModel.standbyConsumption.obs;
  }

  Future<void> saveUserAppliance() async {
    _createUserApplianceModel();
    if (isEditing.value)
      await _editAppliance();
    else {
      await _addAppliance();
    }
    var homeController = Get.find<HomeController>();
    homeController.onInit();
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
    applianceStandbyConsumption =
        _userApplianceModel.applianceModel.standbyConsumption.obs;
    applianceTag = _userApplianceModel.tag.obs;
    // Campo probablemente innecesario
    applianceStandby = false.obs;
    applianceCategorie = _userApplianceModel.applianceModel.category.obs;
  }

  void _createUserApplianceModel() {
    this._userApplianceModel = UserApplianceModel(
      applianceModel: ApplianceModel(
          name: this.applianceName.value,
          consumption: this.applianceConsumption.value,
          category: this.applianceCategorie.value,
          standbyConsumption: this.applianceStandbyConsumption.value),
      usage: this.applianceUsage,
      tag: this.applianceTag.value,

      //  this returning null idk
      consumptionOn: getOnConsumpiton(this),
      consumptionStandby: getStandbyConsumption(this),
      consumptionTotal: getOnConsumpiton(this) + getStandbyConsumption(this),
    );
  }

  double getOnConsumpiton(ApplianceController applianceController) {
    double applianceConsumption = 0.0;

    for (var i in applianceController.applianceUsage.keys) {
      applianceConsumption += applianceController.applianceUsage[i] *
          applianceController.applianceConsumption.value;
    }

    return double.parse(applianceConsumption.toStringAsFixed(3));
  }

  double getStandbyConsumption(ApplianceController applianceController) {
    double applianceConsumption = 0.0;

    if (!applianceController.applianceStandby.value)
      return applianceConsumption;

    for (var i in applianceController.applianceUsage.keys) {
      applianceConsumption += (24 - applianceController.applianceUsage[i]) *
          applianceController.applianceStandbyConsumption.value;
    }

    return double.parse(applianceConsumption.toStringAsFixed(3));
  }
}
