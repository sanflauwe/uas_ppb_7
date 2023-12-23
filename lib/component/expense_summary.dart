import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas_ppb_7/bar%20graph/bar_graph.dart';
import 'package:uas_ppb_7/data/expense_data.dart';
import 'package:uas_ppb_7/datetime/date_time_helper.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;

  const ExpenseSummary({
    super.key,
    required this.startOfWeek,
  });

  double calcuteMax(
    ExpenseData value,
    String senin,
    String selasa,
    String rabu,
    String kamis,
    String jumat,
    String sabtu,
    String minggu,
  ) {
    double? max = 100;

    List<double> values = [
      value.menghitungPengeluaranHarian()[senin] ?? 0,
      value.menghitungPengeluaranHarian()[selasa] ?? 0,
      value.menghitungPengeluaranHarian()[rabu] ?? 0,
      value.menghitungPengeluaranHarian()[kamis] ?? 0,
      value.menghitungPengeluaranHarian()[jumat] ?? 0,
      value.menghitungPengeluaranHarian()[sabtu] ?? 0,
      value.menghitungPengeluaranHarian()[minggu] ?? 0,
    ];

    values.sort();
    max = values.last * 1.1;
    return max == 0 ? 100 : max;
  }

  //menghitung total mingguan
  String calculateWeekTotal(
    ExpenseData value,
    String senin,
    String selasa,
    String rabu,
    String kamis,
    String jumat,
    String sabtu,
    String minggu,
  ) {
    List<double> values = [
      value.menghitungPengeluaranHarian()[senin] ?? 0,
      value.menghitungPengeluaranHarian()[selasa] ?? 0,
      value.menghitungPengeluaranHarian()[rabu] ?? 0,
      value.menghitungPengeluaranHarian()[kamis] ?? 0,
      value.menghitungPengeluaranHarian()[jumat] ?? 0,
      value.menghitungPengeluaranHarian()[sabtu] ?? 0,
      value.menghitungPengeluaranHarian()[minggu] ?? 0,
    ];

    double total = 0;
    for (int i = 0; i < values.length; i++) {
      total += values[i];
    }
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    //get yyyymmdd untuk tiap hari dalam seminggu
    String senin =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 0)));
    String selasa =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 1)));
    String rabu =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 2)));
    String kamis =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 3)));
    String jumat =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 4)));
    String sabtu =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 5)));
    String minggu =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 6)));

    return Consumer<ExpenseData>(
      builder: (context, value, child) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                const Text('Total Minggu ini'),
                Text(
                  '\Rp${calculateWeekTotal(value, senin, selasa, rabu, kamis, jumat, sabtu, minggu)}',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: BarGraph(
              maxY: calcuteMax(
                value,
                senin,
                selasa,
                rabu,
                kamis,
                jumat,
                sabtu,
                minggu,
              ),
              jumlahSenin: value.menghitungPengeluaranHarian()[senin] ?? 0,
              jumlahSelasa: value.menghitungPengeluaranHarian()[selasa] ?? 0,
              jumlahRabu: value.menghitungPengeluaranHarian()[rabu] ?? 0,
              jumlahKamis: value.menghitungPengeluaranHarian()[kamis] ?? 0,
              jumlahJumat: value.menghitungPengeluaranHarian()[jumat] ?? 0,
              jumlahSabtu: value.menghitungPengeluaranHarian()[sabtu] ?? 0,
              jumlahMinggu: value.menghitungPengeluaranHarian()[minggu] ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
