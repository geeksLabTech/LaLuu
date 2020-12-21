import 'package:LaLu/app/data/models/user_appliance_model.dart';
import 'package:LaLu/app/data/repositories/local/user_db_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  UserDbRepository _userDbRepository;
  // The int represents the db key
  RxMap<dynamic, UserApplianceModel> userAppliances;

  @override
  void onInit() {
    super.onInit();
    _userDbRepository = Get.find<UserDbRepository>();

    if (_userDbRepository.isEmpty()) {
      userAppliances = RxMap<dynamic, UserApplianceModel>({});
    } else {
      // userAppliances = _userDbRepository.getAllModels();
      updateAppliacesList();
    }
  }

  void updateAppliacesList() {
    _userDbRepository = Get.find<UserDbRepository>();

    userAppliances = _userDbRepository.getAllModels().obs;
  }

  int getUserAppliancesLenght() => userAppliances.values.length;

  List<UserApplianceModel> getUserAppliancesValues() =>
      userAppliances.values.toList();

  Future<void> removeAppliance(int key) async {
    await _userDbRepository.removeModel(key);
    userAppliances.remove(key);
  }

  Future<void> deleteDb() async {
    _userDbRepository.delete();
  }
}
