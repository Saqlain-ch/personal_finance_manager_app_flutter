//UI of bar graph
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2821659466.
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:myapp/bar%20graph/bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final double? maxY;
  // amouts of recents days of week
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;

  const MyBarGraph(
      {super.key,
      required this.maxY,
      required this.sunAmount,
      required this.monAmount,
      required this.tueAmount,
      required this.wedAmount,
      required this.thuAmount,
      required this.friAmount,
      required this.satAmount});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        sunAmount: sunAmount,
        monAmount: monAmount,
        tueAmount: tueAmount,
        wedAmount: wedAmount,
        thuAmount: thuAmount,
        friAmount: friAmount,
        satAmount: satAmount);
    myBarData.initializeBarData();
    return BarChart(BarChartData(
      maxY: maxY,
      minY: 0,
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
          show: true,
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1024035910.
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: ChartBotomTitles,
          ))),
      barGroups: myBarData.barData
          .map((data) => BarChartGroupData(x: data.x, barRods: [
                BarChartRodData(
                    toY: data.y,
                    color: Colors.grey[800],
                    width: 25,
                    borderRadius: BorderRadius.circular(4),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      color: Colors.white,
                      toY: maxY,
                    ))
              ]))
          .toList(),
    ));
  }
}

Widget ChartBotomTitles(double value, TitleMeta meta) {
  const style = TextStyle(color: Colors.grey, fontSize: 14);
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('Sun', style: style);
      break;
    case 1:
      text = const Text('Mon', style: style);
      break;
    case 2:
      text = const Text("Tue", style: style);
      break;
    case 3:
      text = const Text("Wed", style: style);
      break;
    case 4:
      text = const Text("Thu", style: style);
      break;
    case 5:
      text = const Text("Fri", style: style);
      break;
    case 6:
      text = const Text("Sat", style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
