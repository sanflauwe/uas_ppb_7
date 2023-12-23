import 'package:hive_flutter/hive_flutter.dart';
import 'package:uas_ppb_7/models/expense_item.dart';

class HiveDatabase {
  // reference our box
  final _myBox = Hive.box("expense_database");

  //write data
  void saveData(List<ExpenseItem> allExpenses) {
    List<List<dynamic>> allExpensesFormatted = [];

    for (var expense in allExpenses) {
      List<dynamic> expenseFormatted = [
        expense.nama,
        expense.jumlah,
        expense.tanggal,
      ];
      allExpensesFormatted.add(expenseFormatted);
    }

    _myBox.put("ALL_EXPENSES", allExpensesFormatted);
  }

  //read data
  List<ExpenseItem> readData() {
    List savedExpenses = _myBox.get("ALL_EXPENSES") ?? [];
    List<ExpenseItem> allExpenses = [];

    for (int i = 0; i < savedExpenses.length; i++) {
      String nama = savedExpenses[i][0];
      String jumlah = savedExpenses[i][1];
      DateTime tanggal = savedExpenses[i][2];

      //create expense item
      ExpenseItem expense = ExpenseItem(
        nama: nama,
        jumlah: jumlah,
        tanggal: tanggal,
      );

      allExpenses.add(expense);
    }
    return allExpenses;
  }
}
