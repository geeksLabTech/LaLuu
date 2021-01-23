import 'package:LaLuu/app/modules/appliance/appliance_controller.dart';
import 'package:LaLuu/app/modules/appliance_search/appliance_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppliancePage extends StatefulWidget {
  @override
  _AppliancePageState createState() => _AppliancePageState();
}

class _AppliancePageState extends State<AppliancePage> {
  ApplianceController applianceController;

  @override
  Widget build(BuildContext context) {
    applianceController = Get.find<ApplianceController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccion de Equipo'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                var selectedAppliance = await showSearch(
                    context: context, delegate: ApplianceSearchDelegate());
                if (selectedAppliance != null)
                  _loadSelectedAppliance(selectedAppliance);
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          applianceController.saveUserAppliance();
          //navigator.pop(context);
        },
        child: Icon(Icons.save),
      ),
      body: ListView(
        children: [
          TextField(
            enabled: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Nombre',
            ),
            controller: TextEditingController()
              ..text = applianceController.applianceName.value,
            onChanged: (value) {
              applianceController.applianceName.value = value;
            },
          ),
          TextField(
            enabled: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                labelText: 'Etiqueta', hintText: 'Ejemplo: TV de la sala'),
            controller: TextEditingController()
              ..text = applianceController.applianceTag.value,
            onChanged: (value) {
              applianceController.applianceTag.value = value;
            },
          ),
          TextField(
            enabled: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Consumo (W/h)',
            ),
            controller: TextEditingController()
              ..text =
                  applianceController.applianceConsumption.value.toString(),
            onChanged: (value) {
              applianceController.applianceConsumption.value =
                  double.parse(value);
            },
          ),
          TextField(
            enabled: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Consumo en Standby (W/h)',
            ),
            controller: TextEditingController()
              ..text = applianceController.applianceStandbyConsumption.value
                  .toString(),
            onChanged: (value) {
              applianceController.applianceStandbyConsumption.value =
                  double.parse(value);
            },
          ),
          Container(
            margin: EdgeInsets.all(2),
            child: Text(
              "Cantidad de Horas por día de la semana",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Row(
            children: [
              generateDaysInputs(applianceController, "Lun", context),
              generateDaysInputs(applianceController, "Mar", context),
              generateDaysInputs(applianceController, "Mie", context),
              generateDaysInputs(applianceController, "Jue", context),
              generateDaysInputs(applianceController, "Vie", context),
              generateDaysInputs(applianceController, "Sab", context),
              generateDaysInputs(applianceController, "Dom", context),
            ],
          ),
          Row(
            children: [
              Checkbox(
                  value: getStandbyValue(applianceController),
                  onChanged: (bool value) {
                    applianceController.applianceStandby.value =
                        !applianceController.applianceStandby.value;
                    this.setState(() {});
                  }),
              Text("Se queda en Standby cuando no se usa"),
            ],
          )
        ],
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      ),
    );
  }

  Widget generateDaysInputs(ApplianceController applianceController, String day,
      BuildContext context) {
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
    if (applianceController.applianceUsage[day] == null) {
      applianceController.applianceUsage[day] = 0.0;
    }
    return applianceController.applianceUsage[day].toString();
  }

  void _loadSelectedAppliance(selectedAppliance) {
    setState(() {
      applianceController.loadSelectedAppliance(selectedAppliance);
    });
  }
}
