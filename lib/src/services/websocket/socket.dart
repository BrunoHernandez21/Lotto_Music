import 'package:flutter/widgets.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../../cores/push_notification.dart';
import '../../helpers/globals/ruts_services.dart';

class SocketService {
  // Dart client
  static final io.Socket socket = io.io(
      URL.socket,
      io.OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .enableAutoConnect() // disable auto-connection
          .build());

  static intstate({required BuildContext context, required int userId}) async {
    socket.onConnect((data) {
      if (userId != 0) {
        socket.emit("onInitLoad", {"usuario_id": userId});
      }
    });

    socket.on('notificaciones', (data) {
      PushNotification.showNotification(
        body: data["descripcion"],
        title: data["titulo"],
        id: 0,
      );
    });

    socket.onDisconnect((_) {});
  }
}
