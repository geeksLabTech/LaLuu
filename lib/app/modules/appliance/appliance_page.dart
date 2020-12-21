// import 'dart:html';
import 'package:LaLu/app/modules/appliance/appliance_controller.dart';
import 'package:LaLu/app/modules/appliance_search/appliance_search_delegate.dart';
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
                    applianceController.applianceName.value = value;
                  },
                ),
                TextFormField(
                  enabled: true,
                  decoration: InputDecoration(
                      labelText: 'Etiqueta',
                      hintText: 'Ejemplo: TV de la sala'),
                  initialValue: applianceController.applianceTag.value,
                  onChanged: (value) {
                    applianceController.applianceTag.value = value;
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
                    applianceController.applianceConsumption.value =
                        double.parse(value);
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
                    applianceController.applianceStandbyConsumption.value =
                        double.parse(value);
                  },
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  child: Text(
                    "Cantidad de Horas por dia de la semana",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
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
                ),
                Row(
                  children: [
                    Checkbox(
                        value: getStandbyValue(applianceController),
                        onChanged: (bool value) {
                          setState(() {
                            applianceController.applianceStandby.value =
                                !applianceController.applianceStandby.value;
                          });
                        }),
                    Text("Se queda en Standby cuando no se usa"),
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
    return Container(
      width: MediaQuery.of(context).size.width / 7 - 10,
      margin: EdgeInsets.only(bottom: 2, top: 2, left: 3, right: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 10,
          ),
          Text(day),
          TextFormField(
            enabled: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: '',
            ),
            initialValue: getUsageValue(applianceController, day),
            onChanged: (value) {
              applianceController.applianceUsage[day] = double.parse(value);
            },
          ),
        ],
      ),
    );
  }

  getStandbyValue(ApplianceController applianceController) {
    if (applianceController.applianceStandby.value == null) {
      applianceController.applianceStandby.value = false;
    }
    return applianceController.applianceStandby.value;
  }

  getUsageValue(ApplianceController applianceController, String day) {
    print(applianceController.applianceStandby);
    if (applianceController.applianceUsage[day] == null) {
      applianceController.applianceUsage[day] = 0.0;
    }
    return applianceController.applianceUsage[day].toString();
  }
}
