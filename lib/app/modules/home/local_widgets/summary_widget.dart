import 'package:LaLu/app/modules/home/local_widgets/appliance_cards_list.dart';
import 'package:LaLu/app/utils/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget generateSummaryWidget() {
  double sum = 0;
  var costByRanges = electricityCost(getTotalConsumption());
  costByRanges.forEach((element) => sum = (sum + element).toPrecision(2));

  var style = TextStyle(fontSize: 15.0);
  return Card(
    clipBehavior: Clip.hardEdge,
    margin: EdgeInsets.all(10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    elevation: 2.5,
    child: Center(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Spacer(),
            Text(
              "Consumo Total: " + getTotalConsumption().toString() + ' KW',
              style: style,
            ),
            // Divider(),
            Text(
              "Total a Pagar: " + sum.toString() + " CUP",
              style: style,
            ),
            // Spacer(),
          ],
        ),
      ),
    ),
  );
}
