import 'dart:io';

import 'package:grizzly_io/grizzly_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:LaLuu/app/data/models/user_appliance_model.dart';
import 'package:LaLuu/app/data/repositories/local/user_db_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  UserDbRepository _userDbRepository;
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

  Future<File> exportToCsv() async {
    final directory = await getExternalStorageDirectory();
    final data = getUserApplianceCsvList(
        userAppliances.map((e) => e.userApplianceModel));
    final file = File('${directory.path}/mis_equipos.csv');
    return file.writeAsString('${encodeCsv(data)}');
  }

  List<List<String>> getUserApplianceCsvList(
      Iterable<UserApplianceModel> models) {
    List<List<String>> data = new List();
    data.add([
      'Nombre',
      'Etiqueta',
      'Consumo',
      'Consumo en Standby',
      'Categoría',
      'Lunes',
      'Martes',
      'Miércoles',
      'Jueves',
      'Viernes',
      'Sábado',
      'Domingo'
    ]);

    models.forEach((model) {
      data.add([
        model.applianceModel.name,
        model.tag,
        model.applianceModel.consumption.toString(),
        model.applianceModel.standbyConsumption.toString(),
        model.applianceModel.category,
        model.usage['Lunes'].toString(),
        model.usage['Martes'].toString(),
        model.usage['Miércoles'].toString(),
        model.usage['Jueves'].toString(),
        model.usage['Viernes'].toString(),
        model.usage['Sábado'].toString(),
        model.usage['Domingo'].toString(),
      ]);
    });

    return data;
  }
}

class LoadedUserAppliance {
  int key;
  UserApplianceModel userApplianceModel;
  LoadedUserAppliance({this.key, this.userApplianceModel});
}
