import '../models/video/evento_video.dart';

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

  static ItemEvent? firstWhere(List<ItemEvent>? event) {
    final List<ItemEvent> evProx = [];
    final List<int> winMax = [];
    int absTemp = 100000;

    event?.forEach((item) {
      final fevent = item.fechahoraEvento;

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
            winMax.add(item.acumulado ?? 0);
          }
          if (absEv == absTemp) {
            evProx.add(item);
            winMax.add(item.acumulado ?? 0);
          }
        }
      }
    });
    if (evProx.isEmpty) {
      return null;
    }
    winMax.sort();
    try {
      final exit = evProx.firstWhere((element) {
        return element.acumulado == winMax.last;
      });
      return exit;
    } catch (e) {
      return null;
    }
  }
}
