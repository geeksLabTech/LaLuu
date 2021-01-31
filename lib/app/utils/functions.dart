import 'package:apklis_api/apklis_api.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

import 'constants.dart';

List<double> electricityCost(double consumption) {
  //double cost = 0.0;
  List<double> slices = [];

  for (var i = 0; i < PRICES.length - 1; i++) {
    var limit = CONSUMPTIONRANGES[CONSUMPTIONRANGES.length - (i + 1)];
    if (consumption > limit) {
      // cost += (consumption - limit) * PRICES[PRICES.length - (i + 1)];
      slices.add((consumption - limit) * PRICES[PRICES.length - (i + 1)]);
      consumption -= (consumption - limit);
    }
  }

  if (consumption > 0) {
    // cost += consumption * PRICES[0];
    slices.add((consumption * PRICES[0]).toPrecision(2));
  }
  slices.sort();
  return slices;
}

Future<bool> isAppUpdateAvaliable() async {
  var apklisApi = ApklisApi(dioClient: Dio());
  var info = await apklisApi.get(['com.geeksLabTech.LaLuu']);
  var app = info.result.results[0];
  int lastVersionCode = app.lastRelease.versionCode;
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  int actualVersionCode = int.parse(packageInfo.buildNumber);
  print('$lastVersionCode' + 'y' + '$actualVersionCode');
}
