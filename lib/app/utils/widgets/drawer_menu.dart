import 'package:LaLuu/app/routes/app_routes.dart';
import 'package:LaLuu/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(DRAWERIMAGEDIRECTORY),
                    fit: BoxFit.cover)),
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
              title: Text("Información de Interés"),
              onTap: () => Get.offNamed(AppRoutes.RELEVANTINFO)),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.github,
              color: Colors.yellow,
            ),
            title: Text("Repositorio de Github"),
            onTap: () => _launchUrl(SOCIALLINKS["github"]),
          ),
          // onTap: () => Get.offNamed(AppRoutes.RELEVANTINFO)),
          // Divider(),
          // Container(
          //   child: Column(
          //     children: [
          //       Container(
          //         padding: EdgeInsets.all(10.0),
          //         child: Align(
          //           child: Text(
          //             "Acerca de Nosotros:",
          //             style: TextStyle(fontWeight: FontWeight.bold),
          //             textAlign: TextAlign.left,
          //           ),
          //           alignment: Alignment.topLeft,
          //         ),
          //       ),
          //       _generateContributor("Javier A. Oramas López", "Developer"),
          //       _generateContributor("Daniel A. Cardenas Cabrera", "Developer"),
          //       _generateContributor("Isabel Alvarez Gonzalez", "Diseñadora"),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  // _generateContributor(String name, String ocupation) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  //     child: Align(
  //       alignment: Alignment.topLeft,
  //       child: Column(
  //         children: [
  //           Text(name),
  //           Text(
  //             ocupation,
  //             style: TextStyle(fontSize: 12.0),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else
      print("could not launch $url");
  }
}
