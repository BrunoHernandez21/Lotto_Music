class Rutinas {
  static String comprobador(DateTime? fevent) {
    if (fevent == null) {
      return "No data";
    }
    final ahora = DateTime.now();
    final a = fevent.difference(ahora);
    final minu = a.inMinutes;

    if (minu < 0) {
      return "Expirado";
    }
    final hour = minu ~/ 60;
    final minuto = minu % 60;
    String textminute = '';
    String texthour = '';
    if (minuto < 10) {
      textminute = '0$minuto';
    } else {
      textminute = minuto.toString();
    }
    if (hour < 10) {
      texthour = '0$hour';
    } else {
      texthour = hour.toString();
    }
    return "Falta $texthour:$textminute";
  }
}
