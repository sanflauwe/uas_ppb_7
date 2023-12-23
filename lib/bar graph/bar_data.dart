import 'package:uas_ppb_7/bar%20graph/individual_bar.dart';

class BarData {
  final double jumlahSenin;
  final double jumlahSelasa;
  final double jumlahRabu;
  final double jumlahKamis;
  final double jumlahJumat;
  final double jumlahSabtu;
  final double jumlahMinggu;

  BarData({
    required this.jumlahSenin,
    required this.jumlahSelasa,
    required this.jumlahRabu,
    required this.jumlahKamis,
    required this.jumlahJumat,
    required this.jumlahSabtu,
    required this.jumlahMinggu,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      //senin
      IndividualBar(x: 0, y: jumlahSenin),
      //selasa
      IndividualBar(x: 1, y: jumlahSelasa),
      //rabu
      IndividualBar(x: 2, y: jumlahRabu),
      //kamis
      IndividualBar(x: 3, y: jumlahKamis),
      //jumat
      IndividualBar(x: 4, y: jumlahJumat),
      //sabtu
      IndividualBar(x: 5, y: jumlahSabtu),
      //minggu
      IndividualBar(x: 6, y: jumlahMinggu),
    ];
  }
}
