import 'package:flutter/material.dart';

import '../../cores/orquestador/orquestador.dart';

class MyInitState {
  static Future<void> onInitState(BuildContext context) async {
    Orquestador.auth.checkToken(context);
    Orquestador.video.onLoadStadistic(context: context);
    await Orquestador.user.onLoadCartera(context: context);
    await Orquestador.user.onLoadSuscribcion(context: context);
  }
}
