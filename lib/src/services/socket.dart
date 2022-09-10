import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/cores/compositor.dart';
import 'package:lotto_music/src/models/stadistics_response.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../bloc/stadistics/estadisticas_bloc.dart';
import '../helpers/variables_globales.dart';

enum ServerStatus {
  online,
  offline,
}

class SocketService {
  static intstate(BuildContext context) async {
    final blocSt = BlocProvider.of<EstadisticasBloc>(context);
    Compositor.onLoadStadistic(context: context);

    // Dart client
    io.Socket socket = io.io(
        URL.socket,
        io.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .enableAutoConnect() // disable auto-connection
            .build());
    socket.onConnect((data) {
      socket.emit("onInitLoad", {"usuario_id": 2});
    });
    socket.on('estadisticas', (data) {
      final a = StadisticsResponse.fromMap(data);
      blocSt.add(OnUpdateStadistics(response: a));
    });

    socket.onDisconnect((_) {});
  }
}
