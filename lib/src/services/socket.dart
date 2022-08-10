import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

enum ServerStatus {
  online,
  offline,
}

class SocketService {
  static ServerStatus serverStatus = ServerStatus.offline;
  static IOWebSocketChannel channel = IOWebSocketChannel.connect(
    Uri.parse(
      'ws://187.213.46.53:25567/v1/ws',
    ),
  );

  static Future<void> initSocket() async {
    channel.stream.handleError((a, b) async {
      print("se cayo");
      await reconect();
      await SocketService.initSocket();
    }).listen((message) {
      print(message.toString());
    });
  }

  static reconect() async {
    await Future.delayed(const Duration(seconds: 1));
    channel = IOWebSocketChannel.connect(
      Uri.parse(
        'ws://187.213.46.53:25567/v1/ws',
      ),
    );
  }

  static closeServer() {
    serverStatus = ServerStatus.offline;
    channel.sink.close(status.goingAway);
  }
}
