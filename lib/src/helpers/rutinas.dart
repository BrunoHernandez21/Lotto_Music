String comprobador(DateTime? fevent) {
  if (fevent == null) {
    return "No data";
  }
  final ahora = DateTime.now();
  // TODO: compruebo la fecha o solo la hora?
  // if (fevent.isBefore(ahora)) {
  //   return "Expirado";
  // }
  if ((ahora.hour * 60 + ahora.minute) < (fevent.hour * 60 + fevent.minute)) {
    String hora = "";
    String minuto = "";
    int hr = fevent.hour - ahora.hour;
    int hm = fevent.minute - ahora.minute;
    if (hm < 0) {
      hr -= 1;
      hm = 60 + hm;
    }
    if (hr == 1) {
      hora = hr.toString() + " hora ";
    }
    if (hr > 1) {
      hora = hr.toString() + " horas ";
    }

    if (hm == 1) {
      minuto = hm.toString() + " minuto";
    }
    if (hm > 1) {
      minuto = hm.toString() + " minutos";
    }
    return "Falta " + hora + minuto;
  }
  return "Expirado";
}
