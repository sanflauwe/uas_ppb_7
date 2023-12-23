import 'package:flutter/material.dart';
import 'package:uas_ppb_7/data/hive_database.dart';
import 'package:uas_ppb_7/datetime/date_time_helper.dart';
import 'package:uas_ppb_7/models/expense_item.dart';

class ExpenseData extends ChangeNotifier {
  //list dari pengeluaran
  List<ExpenseItem> semuaPengeluaranList = [];

  //get list pengeluaran
  List<ExpenseItem> getSemuaPengeluaranList() {
    return semuaPengeluaranList;
  }

  //data yang ditampilkan
  final db = HiveDatabase();
  void prepareData() {
    if (db.readData().isNotEmpty) {
      semuaPengeluaranList = db.readData();
    }
  }

  //menambahkan pengeluaran
  void addNewExpense(ExpenseItem newExpense) {
    semuaPengeluaranList.add(newExpense);

    notifyListeners();
    db.saveData(semuaPengeluaranList);
  }

  //menghapus pengeluaran
  void deleteExpense(ExpenseItem expense) {
    semuaPengeluaranList.remove(expense);

    notifyListeners();
    db.saveData(semuaPengeluaranList);
  }

  //mengambil data mingguan
  String getDayName(DateTime tanggal) {
    switch (tanggal.weekday) {
      case 1:
        return 'Senin';
      case 2:
        return 'Selasa';
      case 3:
        return 'Rabu';
      case 4:
        return 'Kamis';
      case 5:
        return 'Jumat';
      case 6:
        return 'Sabtu';
      case 7:
        return 'Minggu';
      default:
        return '';
    }
  }

  //get tanggal dari awal minggu (Senin)
  DateTime startOfWeekDate() {
    DateTime? startOfWeek;

    //get tanggal hari ini
    DateTime today = DateTime.now();

    //menemukan hari Senin kembali
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Senin') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }

  Map<String, double> menghitungPengeluaranHarian() {
    Map<String, double> pengeluaranHarian = {
      //date (yyyymmdd) : jumlahTotalHarian
    };

    for (var expense in semuaPengeluaranList) {
      String tanggal = convertDateTimeToString(expense.tanggal);
      double jumlah = double.parse(expense.jumlah);

      if (pengeluaranHarian.containsKey(tanggal)) {
        double jumlahSekarang = pengeluaranHarian[tanggal]!;
        jumlahSekarang += jumlah;
        pengeluaranHarian[tanggal] = jumlahSekarang;
      } else {
        pengeluaranHarian.addAll({tanggal: jumlah});
      }
    }

    return pengeluaranHarian;
  }
}
