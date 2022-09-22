import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/bloc/carrito/carrito_bloc.dart';
import 'package:lotto_music/src/bloc/cartera/cartera_bloc.dart';
import 'package:lotto_music/src/bloc/shaderPreferences/shaderpreferences_bloc.dart';
import 'package:lotto_music/src/bloc/suscripciones/suscripciones_bloc.dart';
import 'package:lotto_music/src/bloc/tarjetas/tarjetas_bloc.dart';
import 'package:lotto_music/src/bloc/user/user_bloc.dart';
import 'package:lotto_music/src/bloc/video_event/video_event_bloc.dart';
import 'package:lotto_music/src/bloc/youtube/youtube_bloc.dart';
import 'package:lotto_music/src/bloc/videos_categoria/videos_categoria_bloc.dart';
import 'package:lotto_music/src/models/event/userevent.dart';
import 'package:lotto_music/src/models/auth/login_response.dart';
import 'package:lotto_music/src/models/user/cartera.dart';
import 'package:lotto_music/src/models/user/tarjetas.dart';
import 'package:lotto_music/src/models/user/tarjetas_response.dart';
import 'package:lotto_music/src/models/youtube/youtube.dart';
import 'package:lotto_music/src/services/server/shoppingcar.dart';
import 'package:lotto_music/src/services/server/user.dart';
import 'package:lotto_music/src/services/server/utility.dart';
import 'package:lotto_music/src/services/youtube/yt.dart';

import '../../bloc/acount/acount_bloc.dart';
import '../../bloc/direcciones/direcciones_bloc.dart';
import '../../bloc/planes/planes_bloc.dart';
import '../../bloc/stadistics/estadisticas_bloc.dart';
import '../../bloc/youtube_video/video_bloc.dart';
import '../../bloc/videos_event/videos_event_bloc.dart';
import '../../helpers/globals/local_storage.dart';
import '../../models/carrito/carrito.dart';
import '../../models/carrito/carrito_response.dart';
import '../../models/user/direcciones.dart';
import '../../models/user/direcciones_response.dart';
import '../../models/video/evento_video.dart';
import '../../models/event/ganador_response.dart';
import '../../models/video/grupos.dart';
import '../../models/buy/historial_compra.dart';
import '../../models/event/historial_event_user.dart';
import '../../models/video/stadistics_response.dart';
import '../../models/user/users.dart';
import '../../services/server/auth.dart';
import '../../services/server/buy.dart';
import '../../services/server/plan.dart';
import '../../services/server/user_event.dart';
import '../../services/server/videos.dart';
import '../../widgets/dialogs_alert.dart';
import '../localStorage/local_storage.dart';

part 'buy.dart';
part 'auth.dart';
part 'plan.dart';
part 'shoppingcar.dart';
part 'user_event.dart';
part 'user.dart';
part 'utils.dart';
part 'videos.dart';
part 'sistem.dart';
part 'youtube.dart';

class Orquestador {
  // ignore: library_private_types_in_public_api
  static _Auth get auth {
    return _Auth();
  }

  // ignore: library_private_types_in_public_api
  static _Buy get buy {
    return _Buy();
  }

  // ignore: library_private_types_in_public_api
  static _Planes get plan {
    return _Planes();
  }

  // ignore: library_private_types_in_public_api
  static _Shopingcar get shopingcar {
    return _Shopingcar();
  }

  // ignore: library_private_types_in_public_api
  static _Sistem get sistem {
    return _Sistem();
  }

  // ignore: library_private_types_in_public_api
  static _UserEvent get userEvent {
    return _UserEvent();
  }

  // ignore: library_private_types_in_public_api
  static _User get user {
    return _User();
  }

  // ignore: library_private_types_in_public_api
  static _Utils get utils {
    return _Utils();
  }

  // ignore: library_private_types_in_public_api
  static _Videos get video {
    return _Videos();
  }

  // ignore: library_private_types_in_public_api
  static _Youtube get youtube {
    return _Youtube();
  }
}
