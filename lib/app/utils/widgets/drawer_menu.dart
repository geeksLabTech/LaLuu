import 'package:LaLuu/app/routes/app_routes.dart';
import 'package:LaLuu/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(LOGODIRECTORY), fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.yellow,
            ),
            title: Text('Página Principal'),
            onTap: () => Get.offNamed(AppRoutes.HOME),
          ),
          ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.yellow,
              ),
              title: Text("Información de interes"),
              onTap: () => Get.offNamed(AppRoutes.RELEVANTINFO))
        ],
      ),
    );
  }
}
