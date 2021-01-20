import 'package:LaLu/app/data/models/user_appliance_model.dart';
import 'package:LaLu/app/data/repositories/local/user_db_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  UserDbRepository _userDbRepository;
  // The int represents the db key
  RxList<LoadedUserAppliance> userAppliances;

  @override
  void onInit() {
    super.onInit();
    _userDbRepository = Get.find<UserDbRepository>();
    userAppliances = RxList([]);
    if (!_userDbRepository.isEmpty()) {
      _userDbRepository.getAllModels().forEach((key, value) {
        userAppliances
            .add(LoadedUserAppliance(key: key, userApplianceModel: value));
      });
      print(userAppliances);
    }
  }

  //int getUserAppliancesLenght() => userAppliances.values.length;
  /*
  dynamic getModelKey(UserApplianceModel model) {
    dynamic modelKey = 0;
    userAppliances.forEach((key, value) {
      if (value == model) return key;
    });
    return modelKey;
  }

  List<UserApplianceModel> getUserAppliancesValues() =>
      userAppliances.values.toList();
*/
  Future<void> removeAppliance(int key) async {
    await _userDbRepository.removeModel(key);
    for (int i = 0; i < userAppliances.length; i++) {
      if (userAppliances[i].key == key) {
        userAppliances.removeAt(i);
        break;
      }
    }
  }

  Future<void> deleteDb() async {
    _userDbRepository.delete();
  }
}

class LoadedUserAppliance {
  int key;
  UserApplianceModel userApplianceModel;
  LoadedUserAppliance({this.key, this.userApplianceModel});
}
