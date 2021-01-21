import 'dart:math';

import 'package:LaLu/app/utils/constants.dart';
import 'package:LaLu/app/utils/functions.dart';
import 'package:flutter/material.dart';

class TariffPage extends StatefulWidget {
  @override
  _TariffPageState createState() => _TariffPageState();
}

class _TariffPageState extends State<TariffPage> {
  double consumption = 0;
  double cost = 0;
  List<double> list = [];
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
                double sum = 0;
                list = electricityCost(consumption);
                list.forEach((element) => sum += element);
                cost = sum;
              });
            }),
        Text("$cost"),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildTableRows(list),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildTableRows(List values) {
    List<Widget> rows = [];
    for (int i = 0; i < CONSUMPTIONRANGES.length; i++) {
      rows.add(Row(children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            CONSUMPTIONRANGES[i].toString(),
            style: TextStyle(fontSize: 20.0),
          ),
          padding: EdgeInsets.all(1.0),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            PRICES[i].toString(),
            style: TextStyle(fontSize: 20.0),
          ),
          padding: EdgeInsets.all(1.0),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            values is Null || values.length > 0
                ? values[i] == Null
                    ? '0'
                    : values[i].toString()
                : "0",
            style: TextStyle(fontSize: 20.0),
          ),
          padding: EdgeInsets.all(1.0),
        ),
      ]));
    }

    rows.add(Row(children: [
      Container(
        alignment: Alignment.center,
        child: Text(
          CONSUMPTIONRANGES[CONSUMPTIONRANGES.length - 1].toString() + "+",
          style: TextStyle(fontSize: 20.0),
        ),
        padding: EdgeInsets.all(1.0),
      ),
      Container(
        alignment: Alignment.center,
        child: Text(
          PRICES[PRICES.length - 1].toString(),
          style: TextStyle(fontSize: 20.0),
        ),
        padding: EdgeInsets.all(1.0),
      ),
      Container(
        alignment: Alignment.center,
        child: Text(
          values is Null || values.length > 0
              ? values[values.length - 1] == Null
                  ? "0"
                  : values[values.length - 1].toString()
              : "0",
          style: TextStyle(fontSize: 20.0),
        ),
        padding: EdgeInsets.all(1.0),
      ),
    ]));
    return rows;
  }
}
