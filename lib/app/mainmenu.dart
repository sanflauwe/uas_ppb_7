import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas_ppb_7/component/expense_summary.dart';
import 'package:uas_ppb_7/component/expense_tile.dart';
import 'package:uas_ppb_7/data/expense_data.dart';
import 'package:uas_ppb_7/models/expense_item.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  //text controller
  final newNamaPengeluaranController = TextEditingController();
  final newJumlahPengeluaranController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Provider.of<ExpenseData>(context, listen: false).prepareData();
  }

  //menambahkan pengeluaran
  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tambah Pengeluaran'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //nama pengeluaran
            TextField(
              controller: newNamaPengeluaranController,
              decoration: const InputDecoration(
                hintText: "Nama Pengeluaran",
              ),
            ),

            //jumlah pengeluaran
            TextField(
              controller: newJumlahPengeluaranController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Jumlah Pengeluaran",
              ),
            ),
          ],
        ),
        actions: [
          //tombol save
          MaterialButton(
            onPressed: save,
            child: const Text('Simpan'),
          ),
          //tombol cancel
          MaterialButton(
            onPressed: cancel,
            child: const Text('Batal'),
          ),
        ],
      ),
    );
  }

  //delete
  void deleteExpense(ExpenseItem expense) {
    Provider.of<ExpenseData>(context, listen: false).deleteExpense(expense);
  }

  //save
  void save() {
    if (newNamaPengeluaranController.text.isNotEmpty &&
        newJumlahPengeluaranController.text.isNotEmpty) {}
    //create expanse item
    ExpenseItem newExpense = ExpenseItem(
      nama: newNamaPengeluaranController.text,
      jumlah: newJumlahPengeluaranController.text,
      tanggal: DateTime.now(),
    );
    //add new expense
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);

    Navigator.pop(context);
    clear();
  }

  //cancel
  void cancel() {
    Navigator.pop(context);
    clear();
  }

  //clear controllers
  void clear() {
    newNamaPengeluaranController.clear();
    newNamaPengeluaranController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.grey[400],
          floatingActionButton: FloatingActionButton(
            onPressed: addNewExpense,
            backgroundColor: Colors.black,
            child: const Icon(Icons.add),
          ),
          body: ListView(
            children: [
              //rangkuman mingguan
              ExpenseSummary(startOfWeek: value.startOfWeekDate()),

              const SizedBox(height: 20),

              //list pengeluaran
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.getSemuaPengeluaranList().length,
                itemBuilder: (context, index) => ExpenseTile(
                  nama: value.getSemuaPengeluaranList()[index].nama,
                  jumlah: value.getSemuaPengeluaranList()[index].jumlah,
                  tanggal: value.getSemuaPengeluaranList()[index].tanggal,
                  deleteTapped: (p0) =>
                      deleteExpense(value.getSemuaPengeluaranList()[index]),
                ),
              ),
            ],
          )),
    );
  }
}
