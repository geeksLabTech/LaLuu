import 'package:LaLuu/app/utils/constants.dart';
import 'package:LaLuu/app/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              SizedBox(
                height: 20,
              ),
              Text(
                "Escriba la cantidad de Kw consumidos",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                width: 150.0,
                child: TextField(
                  textAlign: TextAlign.center,
                  autofocus: true,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value) => consumption = double.tryParse(value),
                ),
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
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text(
                  "$cost CUP",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
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
      DataColumn(label: Center(child: Text("Rango"))),
      DataColumn(label: Center(child: Text("Precio"))),
      DataColumn(label: Center(child: Text("Costo")))
    ], rows: _getDataRows());
  }

  List<DataRow> _getDataRows() {
    print(costByRanges);
    List<DataRow> dataRows = [];
    for (int i = 0; i < costByRanges.length; i++) {
      dataRows.add(DataRow(cells: [
        DataCell(Center(child: Text(TARIFFRANGES[i]))),
        DataCell(Center(child: Text(PRICES[i].toPrecision(2).toString()))),
        DataCell(Center(child: Text(costByRanges[i].toPrecision(2).toString())))
      ]));
    }
    return dataRows;
  }
}
