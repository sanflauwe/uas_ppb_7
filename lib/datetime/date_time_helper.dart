//convert DateTime objek menjadi String yyyymmdd
String convertDateTimeToString(DateTime tanggal) {
  //tahun dengan format yyyy
  String year = tanggal.year.toString();

  //bulan dengan format mm
  String month = tanggal.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }

  //tanggal dengan format dd
  String day = tanggal.day.toString();
  if (day.length == 1) {
    day = '0$month';
  }

  //format akhir = yyyymmdd
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}
