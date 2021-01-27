import 'package:LaLuu/app/utils/constants.dart';
import 'package:LaLuu/app/utils/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RelevantInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Información de Interés"),
        centerTitle: true,
      ),
      drawer: DrawerMenu(),
      body: ListView(
        padding: EdgeInsets.all(5),
        children: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Text(
              IMPORTANTTEXT,
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: IconButton(
              icon: Icon(
                Icons.launch,
                color: Colors.yellow,
              ),
              onPressed: () => _launchUrl(IMPORTANTURLS[0]),
            ),
            title: Text(IMPORTANTURLS[0]),
          ),
          Divider(),
          ListTile(
            leading: IconButton(
              icon: Icon(
                Icons.launch,
                color: Colors.yellow,
              ),
              onPressed: () => _launchUrl(IMPORTANTURLS[1]),
            ),
            title: Text(IMPORTANTURLS[1]),
          )
        ],
      ),
    );
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else
      print("could not launch $url");
  }
}
