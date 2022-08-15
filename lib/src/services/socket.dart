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

    socket.on('videos', (data) {
      VideoEventModel.fromMap(data);
      //TODO logic socket
    });

    socket.onDisconnect((_) {});
  }
}
