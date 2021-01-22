import 'package:LaLu/app/modules/home/local_widgets/indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartSample2 extends StatefulWidget {
  final double stadbyValue;
  final double onValue;
  PieChartSample2({Key key, this.onValue, this.stadbyValue}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      PieChart2State(onValue: this.onValue, standbyValue: this.stadbyValue);
}

class PieChart2State extends State {
  int touchedIndex;
  double onValue;
  double standbyValue;

  PieChart2State({this.onValue, this.standbyValue});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Container(
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      pieTouchData:
                          PieTouchData(touchCallback: (pieTouchResponse) {
                        setState(() {
                          if (pieTouchResponse.touchInput is FlLongPressEnd ||
                              pieTouchResponse.touchInput is FlPanEnd) {
                            touchedIndex = -1;
                          } else {
                            touchedIndex = pieTouchResponse.touchedSectionIndex;
                          }
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections(onValue, standbyValue)),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Colors.yellow,
                  text: 'ON',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.orangeAccent,
                  text: 'Standby',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(
      double onValue, double standbyValue) {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.yellow,
            value: onValue,
            // title: 'ON ' + onValue.toString() + '%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.orangeAccent,
            value: standbyValue,
            // title: 'Standby ' + standbyValue.toString() + '%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          );
        default:
          return null;
      }
    });
  }
}
