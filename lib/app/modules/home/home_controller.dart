import 'package:LaLu/app/data/models/user_appliance_model.dart';
import 'package:LaLu/app/data/repositories/local/user_db_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  UserDbRepository _userDbRepository;
  RxMap<int, UserApplianceModel> _userAppliances;

  @override
  void onInit() {
    super.onInit();
    _userDbRepository = Get.find<UserDbRepository>();

    if (_userDbRepository.isEmpty()) {
      _userAppliances = RxMap<int, UserApplianceModel>({});
    } else {
      _userAppliances = _userDbRepository.getAllModels();
    }
  }

  int getUserAppliancesLenght() => _userAppliances.values.length;

  List<UserApplianceModel> getUserAppliancesValues() =>
      _userAppliances.values.toList();

  Future<void> addAppliance(UserApplianceModel applianceModel) async {
    var key = await _userDbRepository.addModel(applianceModel);
    _userAppliances[key] = applianceModel;
  }

  Future<void> editAppliance(
      int key, UserApplianceModel newApplianceModel) async {
    await _userDbRepository.editModel(key, newApplianceModel);
    _userAppliances[key] = newApplianceModel;
  }

  Future<void> removeAppliance(int key) async {
    await _userDbRepository.removeModel(key);
    _userAppliances.remove(key);
  }
}
