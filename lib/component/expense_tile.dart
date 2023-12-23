import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ExpenseTile extends StatelessWidget {
  final String nama;
  final String jumlah;
  final DateTime tanggal;
  void Function(BuildContext)? deleteTapped;

  ExpenseTile({
    super.key,
    required this.nama,
    required this.jumlah,
    required this.tanggal,
    required this.deleteTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteTapped,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(5),
          )
        ],
      ),
      child: ListTile(
        title: Text(nama),
        subtitle: Text('${tanggal.day} / ${tanggal.month} / ${tanggal.year}'),
        trailing: Text('Rp$jumlah'),
      ),
    );
  }
}
