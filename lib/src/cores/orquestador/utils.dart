part of 'orquestador.dart';

class _Utils {
  Future<DateTime> horaServidor() async {
    final a = UtilityService.hora();
    return a;
  }
}
