import '../models/evento_video.dart';

class Rutinas {
  static String comprobador(DateTime? fevent) {
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

  static ItemEvent? firstWhere(List<ItemEvent>? event) {
    final List<ItemEvent> evProx = [];
    final List<int> winMax = [];
    int absTemp = 100000;

    event?.forEach((item) {
      final fevent = item.evento.fechahoraapuesta;

      if (fevent != null) {
        final ahora = DateTime.now();
        final int absNow = ahora.hour * 60 + ahora.minute;
        final int absEv = fevent.hour * 60 + fevent.minute;

        if (absNow < absEv) {
          if (absEv < absTemp) {
            absTemp = absEv;

            evProx.clear();
            winMax.clear();
            evProx.add(item);
            winMax.add(item.evento.acumulado);
          }
          if (absEv == absTemp) {
            evProx.add(item);
            winMax.add(item.evento.acumulado);
          }
        }
      }
    });
    if (evProx.isEmpty) {
      return null;
    }
    winMax.sort();
    final exit = evProx.firstWhere((element) {
      return element.evento.acumulado == winMax.last;
    });
    return exit;
  }
}
