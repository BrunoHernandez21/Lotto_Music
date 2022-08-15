import 'dart:convert';

import 'package:socket_io_client/socket_io_client.dart' as io;

import '../models/evento_video.dart';

enum ServerStatus {
  online,
  offline,
}

class SocketService {
  static intstate() async {
    // Dart client
    io.Socket socket = io.io(
        'http://187.213.134.47:25567',
        io.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .enableAutoConnect() // disable auto-connection
            .build());

    socket.on('mensaje', (data) {
      final a = VideoEventModel.fromMap(data);
      print(a);
    });

    socket.onDisconnect((_) {
      print('disconnect');
    });
    socket.on('fromServer', (_) => print(_));
  }
}
