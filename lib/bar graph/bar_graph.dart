import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:uas_ppb_7/bar%20graph/bar_data.dart';

class BarGraph extends StatelessWidget {
  final double? maxY;
  final double jumlahSenin;
  final double jumlahSelasa;
  final double jumlahRabu;
  final double jumlahKamis;
  final double jumlahJumat;
  final double jumlahSabtu;
  final double jumlahMinggu;

  const BarGraph({
    super.key,
    required this.maxY,
    required this.jumlahSenin,
    required this.jumlahSelasa,
    required this.jumlahRabu,
    required this.jumlahKamis,
    required this.jumlahJumat,
    required this.jumlahSabtu,
    required this.jumlahMinggu,
  });

  @override
  Widget build(BuildContext context) {
    //initialize the bar data
    BarData barData = BarData(
      jumlahSenin: jumlahSenin,
      jumlahSelasa: jumlahSelasa,
      jumlahRabu: jumlahRabu,
      jumlahKamis: jumlahKamis,
      jumlahJumat: jumlahJumat,
      jumlahSabtu: jumlahSabtu,
      jumlahMinggu: jumlahMinggu,
    );
    barData.initializeBarData();

    return BarChart(
      BarChartData(
        maxY: maxY,
        minY: 0,
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles,
            ),
          ),
        ),
        gridData: FlGridData(show: false),
        barGroups: barData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                    color: Colors.red,
                    width: 20,
                    borderRadius: BorderRadius.circular(5),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: maxY,
                      color: Colors.amber[200],
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('S', style: style);
      break;
    case 1:
      text = const Text('S', style: style);
      break;
    case 2:
      text = const Text('R', style: style);
      break;
    case 3:
      text = const Text('K', style: style);
      break;
    case 4:
      text = const Text('J', style: style);
      break;
    case 5:
      text = const Text('S', style: style);
      break;
    case 6:
      text = const Text('M', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}
