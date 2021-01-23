import 'package:LaLuu/app/data/models/user_appliance_model.dart';
import 'package:LaLuu/app/modules/home/local_widgets/summary_widget.dart';
import 'package:LaLuu/app/routes/app_routes.dart';
import 'package:LaLuu/app/utils/constants.dart';
import 'package:LaLuu/app/utils/functions.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class ApplianceCardsList extends StatefulWidget {
  @override
  _ApplianceCardsListState createState() => _ApplianceCardsListState();
}

class _ApplianceCardsListState extends State<ApplianceCardsList> {
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    var cards =
        homeController.userAppliances.map((e) => createCard(e)).toList();

    // cards.insert(0, generateSummaryWidget());

    return Column(
      children: [
        generateSummaryWidget(),
        Expanded(
          child: ListView(
            children: cards,
          ),
        ),
      ],
    );
    // createSummary(),
    // ],
  }

  Widget createCard(LoadedUserAppliance e) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 2.5,
      child: Column(
        children: [
          Text(
            e.userApplianceModel.tag == ""
                ? e.userApplianceModel.applianceModel.name
                : e.userApplianceModel.tag,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Estimado mensual:",
                    ),
                    margin: EdgeInsets.all(5.0),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Costo estimado:",
                    ),
                    margin: EdgeInsets.all(5.0),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                      getApplianceConsumption(e.userApplianceModel)
                              .toPrecision(2)
                              .toString() +
                          "KW/h",
                      textAlign: TextAlign.end,
                    ),
                    margin: EdgeInsets.all(5.0),
                  ),
                  Container(
                    child: Text(
                        getTotalCost(e.userApplianceModel).toString() + "CUP"),
                    margin: EdgeInsets.all(5.0),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            thickness: 2.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () async {
                  await Get.toNamed(AppRoutes.APPLIANCE,
                      arguments: {e.key: e.userApplianceModel});
                  setState(() {});
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  showRemoveDialog(context, e);
                },
              )
            ],
          )
        ],
      ),
    );
  }

  showRemoveDialog(BuildContext context, LoadedUserAppliance e) {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.WARNING,
        animType: AnimType.BOTTOMSLIDE,
        dismissOnTouchOutside: false,
        body: Center(
          child: Text('¿Está seguro que desea eliminar este Equipo?'),
        ),
        btnCancelOnPress: () {},
        btnOkOnPress: () async {
          await homeController.removeAppliance(e.key);
          setState(() {});
        })
      ..show();
  }

  generateDays(UserApplianceModel e) {
    List<Widget> children = [];

    for (var i in e.usage.keys) {
      children.add(Container(
        margin: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
        child: Column(
          children: [
            Text(
              i,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(e.usage[i].toString() + ' h'),
          ],
        ),
      ));
    }

    return Container(
      child: Row(
        children: children,
      ),
    );
  }
}

// Widget createSummary() {
//   return Card(
//     child: Row(
//       children: [
//         Text(getTotalConsumption().toString() + ' kW'),
//         Spacer(),
//         Text(getTotalCost().toString() + ' CUP'),
//       ],
//     ),
//   );
// }

double getTotalConsumption() {
  double consumption = 0.0;
  final homeController = Get.find<HomeController>();
  for (var i in homeController.userAppliances) {
    consumption += 4 * i.userApplianceModel.consumptionOn;
    consumption += 4 * i.userApplianceModel.consumptionStandby;
  }
  return (consumption / 1000).toPrecision(2);
}

// double getTotalCost(UserApplianceModel userApplianceModel) {
//   double consumption = getApplianceConsumption(userApplianceModel);
//   return electricityCost(consumption).toPrecision(2);
// }

double getTotalCost(UserApplianceModel userApplianceModel) {
  double consumption = getApplianceConsumption(userApplianceModel);
  double totalCost = 0.0;
  electricityCost(consumption).forEach((element) {
    totalCost += element;
  });
  return (totalCost).toPrecision(2);
}

double getApplianceConsumption(UserApplianceModel userApplianceModel) {
  double consumption = 0.0;
  consumption += 4 * userApplianceModel.consumptionOn;
  consumption += 4 * userApplianceModel.consumptionStandby;
  return consumption / 1000;
}
