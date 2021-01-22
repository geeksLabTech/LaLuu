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
  List<double> costByRanges = [];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: 200.0,
          child: Column(
            children: [
              TextField(
                textAlign: TextAlign.center,
                autofocus: true,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) => consumption = double.tryParse(value),
              ),
              Divider(),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(Icons.calculate),
                  onPressed: () {
                    setState(() {
                      double sum = 0;
                      costByRanges = electricityCost(consumption);
                      costByRanges.forEach((element) => sum += element);
                      cost = sum;
                    });
                  }),
              Text("$cost"),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(child: _buildTableRows()),
        SizedBox(
          height: 30,
        )
      ],
    );
  }

  Widget _buildTableRows() {
    if (costByRanges.isEmpty) return Container();
    return DataTable(columns: [
      DataColumn(label: Text("Rango")),
      DataColumn(label: Text("Precio")),
      DataColumn(label: Text("Costo"))
    ], rows: _getDataRows());
  }

  List<DataRow> _getDataRows() {
    print(costByRanges);
    List<DataRow> dataRows = [];
    for (int i = 0; i < costByRanges.length; i++) {
      dataRows.add(DataRow(cells: [
        DataCell(Center(child: Text(TARIFFRANGES[i]))),
        DataCell(Center(child: Text(PRICES[i].toString()))),
        DataCell(Center(child: Text(costByRanges[i].toString())))
      ]));
    }
    return dataRows;
  }
}
