import 'package:LaLu/app/data/services/appliance_db_service.dart';
import 'package:LaLu/app/data/services/user_appliance_db_service.dart';
import 'package:LaLu/app/modules/home/home_controller.dart';
import 'package:LaLu/app/modules/home/home_page.dart';
import 'package:LaLu/app/routes/app_pages.dart';
import 'package:LaLu/app/utils/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  await initServices();
  runApp(MyApp());
}

Future<void> initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  DependencyInjection().init();
  await Get.putAsync(() => ApplianceDbService().init());
  await Get.putAsync(() => UserApplianceDbService().init());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialBinding:
          BindingsBuilder(() => {Get.lazyPut(() => HomeController())}),
      home: HomePage(),
      getPages: AppPages.pages,
      theme: ThemeData(
          canvasColor: Colors.grey,
          primaryColor: Colors.amber,
          accentColor: Colors.amber,
          textTheme: TextTheme(caption: TextStyle(color: Colors.white))),
    );
  }
}
