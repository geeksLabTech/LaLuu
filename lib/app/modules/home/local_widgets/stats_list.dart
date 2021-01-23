import 'package:LaLuu/app/modules/charts/bars_standby_on.dart';
// import 'package:LaLu/app/modules/charts/most_consuming_appliances.dart';
import 'package:LaLuu/app/modules/charts/pie_standby_on.dart';
import 'package:flutter/material.dart';

Widget statsList() {
  return ListView(
    children: [
      generatePieStandbyON(),
      generateBarON(),
      // generateMostConsumingAppliances(),
    ],
  );
}
