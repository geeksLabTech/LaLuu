// import 'dart:html';
import 'package:LaLu/app/modules/appliance/appliance_controller.dart';
import 'package:LaLu/app/modules/appliance_search/appliance_search_delegate.dart';
import 'package:LaLu/app/modules/appliance_search/local_widgets/appliance_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import "package:velocity_x/velocity_x.dart";

class AppliancePage extends StatefulWidget {
  @override
  _AppliancePageState createState() => _AppliancePageState();
}

class _AppliancePageState extends State<AppliancePage> {
  @override
  Widget build(BuildContext context) {
    final applianceController = Get.find<ApplianceController>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Seleccion de Equipo'),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () => showSearch(
                    context: context, delegate: ApplianceSearchDelegate()))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            applianceController.saveUserAppliance();
            navigator.pop(context);
          },
          child: Icon(Icons.save),
        ),
        body: Obx(() => ListView(
              children: [
                TextFormField(
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                  ),
                  initialValue: applianceController.applianceName.value,
                  onChanged: (value) {
                    //applianceController.applianceTag.value = value;
                  },
                ),
                TextFormField(
                  enabled: true,
                  decoration: InputDecoration(
                      labelText: 'Etiqueta',
                      hintText: 'Ejemplo: TV de la sala'),
                  initialValue: applianceController.applianceTag.value,
                  onChanged: (value) {
                    //applianceController.applianceTag.value = value;
                  },
                ),
                TextFormField(
                  enabled: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Consumo (W/h)',
                  ),
                  initialValue:
                      applianceController.applianceConsumption.value.toString(),
                  onChanged: (value) {
                    //applianceController.applianceTag.value = value;
                  },
                ),
                TextFormField(
                  enabled: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Consumo en Standby (W/h)',
                  ),
                  initialValue: applianceController
                      .applianceStandbyConsumption.value
                      .toString(),
                  onChanged: (value) {
                    //applianceController.applianceTag.value = value;
                  },
                ),
                Row(
                  children: [
                    generateDaysInputs(applianceController, "Lun"),
                    generateDaysInputs(applianceController, "Mar"),
                    generateDaysInputs(applianceController, "Mie"),
                    generateDaysInputs(applianceController, "Jue"),
                    generateDaysInputs(applianceController, "Vie"),
                    generateDaysInputs(applianceController, "Sab"),
                    generateDaysInputs(applianceController, "Dom"),
                  ],
                )
              ],
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            )));
  }

  setStandby(String day) {
    print(day);
  }

  generateDaysInputs(ApplianceController applianceController, String day) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 10,
        ),
        Text(day),
        // TextFormField(
        //   enabled: true,
        //   keyboardType: TextInputType.number,
        //   decoration: InputDecoration(
        //     labelText: '',
        //   ),
        //   initialValue: applianceController.applianceUsage[day].toString(),
        //   onChanged: (value) {
        //     //applianceController.applianceTag.value = value;
        //   },
        // ),
        Checkbox(
            value: getStandbyValue(applianceController, day),
            onChanged: (bool value) {
              setState(() {
                applianceController.applianceStandby[day] =
                    !applianceController.applianceStandby[day];
              });
            })
      ],
    );
  }

  getStandbyValue(ApplianceController applianceController, String day) {
    if (applianceController.applianceStandby[day] == null) {
      applianceController.applianceStandby[day] = false;
    }
    return applianceController.applianceStandby[day];
  }
}
