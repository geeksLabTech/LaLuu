import 'dart:convert';

import 'package:LaLu/app/data/models/appliance_model.dart';
import 'package:LaLu/app/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ApplianceDbService extends GetxService {
  Box<Map<String, dynamic>> _box;

  Future<ApplianceDbService> init() async {
    if (await Hive.boxExists(APPLIANCEBOX))
      Hive.deleteBoxFromDisk(APPLIANCEBOX);
    _box = await Hive.openBox(APPLIANCEBOX);
    if (_box.isEmpty) {
      List<dynamic> db =
          json.decode(await rootBundle.loadString(JSONDBTESTDIRECTORY));
      print('MODEL!!');
      print(ApplianceModel.fromJson(db[1] as Map<String, dynamic>));
      db.forEach((element) async {
        var model = ApplianceModel.fromJson(element as Map<String, dynamic>);
        await _box.add(model.toJson());
      });
      //print(_box.values);
    }
    return this;
  }

  Box<Map<String, dynamic>> get box => _box;
}
