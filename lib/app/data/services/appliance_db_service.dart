import 'dart:convert';

import 'package:LaLuu/app/data/models/appliance_model.dart';
import 'package:LaLuu/app/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ApplianceDbService extends GetxService {
  Box<Map<String, dynamic>> _box;

  Future<ApplianceDbService> init() async {
    // this sometimes returns null if commented the following 2 lines
    if (await Hive.boxExists(APPLIANCEBOX))
      Hive.deleteBoxFromDisk(APPLIANCEBOX);
    _box = await Hive.openBox(APPLIANCEBOX);
    if (_box.isEmpty) {
      List<dynamic> db =
          json.decode(await rootBundle.loadString(JSONDBDIRECTORY));
      print('MODEL!!');
      print(ApplianceModel.fromJson(db[1] as Map<String, dynamic>));
      db.forEach((element) async {
        var model = ApplianceModel.fromJson(element as Map<String, dynamic>);
        await _box.add(model.toJson());
      });
    }
    return this;
  }

  Box<Map<String, dynamic>> get box => _box;
}
