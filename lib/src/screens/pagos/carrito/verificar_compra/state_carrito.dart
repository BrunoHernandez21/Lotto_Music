import '../../../../models/user/tarjetas.dart';

class SCL {
  static int index = -1;
  static TarjetaModel tarjeta = TarjetaModel();

  static void clear() {
    tarjeta = TarjetaModel();
    index = -1;
  }
}
