import 'package:LaLu/app/data/services/appliance_db_service.dart';
import 'package:LaLu/app/data/services/user_appliance_db_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  await initServices();
  runApp(MyApp());
}

Future<void> initServices() async {
  final directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Get.put(ApplianceDbService());
  Get.put(UserApplianceDbService());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
