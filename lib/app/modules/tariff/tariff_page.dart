<<<<<<< HEAD
=======
import 'dart:math';

import 'package:LaLu/app/utils/constants.dart';
>>>>>>> parent of c935439... Merge branch 'UI' into table
import 'package:LaLu/app/utils/functions.dart';
import 'package:flutter/material.dart';

class TariffPage extends StatefulWidget {
  @override
  _TariffPageState createState() => _TariffPageState();
}

class _TariffPageState extends State<TariffPage> {
  double consumption = 0;
  double cost = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200.0,
          child: TextField(
            textAlign: TextAlign.center,
            autofocus: true,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onChanged: (value) => consumption = double.tryParse(value),
          ),
        ),
        Divider(),
        RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.calculate),
            onPressed: () {
              setState(() {
                cost = electricityCost(consumption);
              });
            }),
        Text("$cost")
      ],
    );
  }
}
