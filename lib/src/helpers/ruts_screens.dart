import 'package:flutter/cupertino.dart';
import 'package:lotto_music/src/screens/eventos/adivina/adivina.dart';

import '../screens/acount/login.dart';
import '../screens/acount/recovery.dart';
import '../screens/acount/register.dart';
import '../screens/acount/register_confirm.dart';
import '../screens/admin.dart';
import '../screens/eventos/estadisticas/estadisticas.dart';
import '../screens/eventos/video/video_evento.dart';
import '../screens/eventos/categorias/videos_categorias.dart';
import '../screens/pagos/carrito/verificar_compra.dart';
import '../screens/perfil/editar_perfil/direcciones/direccion.dart';
import '../screens/perfil/editar_perfil/direcciones/direcciones_add.dart';
import '../screens/perfil/editar_perfil/new_password.dart';
import '../screens/perfil/editar_perfil/password_confirm.dart';
import '../screens/provedores_video/search/search.dart';
import '../screens/provedores_video/video/video.dart';
import '../screens/utils/clock.dart';
import '../screens/utils/historial_eventos.dart';
import '../screens/utils/notify.dart';
import '../screens/perfil/acerda_de.dart';
import '../screens/perfil/ajustes/ajustes.dart';
import '../screens/perfil/editar_perfil/ajustes_usuario.dart';
import '../screens/perfil/editar_perfil.dart';
import '../screens/perfil/historial_compras.dart';
import '../screens/perfil/tarjetas/tarjetas.dart';
import '../screens/utils/winner.dart';

class Ruts {
  static final Map<String, WidgetBuilder> _rutas = {
    Login.routeName: (_) => Login(),
    Recovery.routeName: (_) => Recovery(),
    Register.routeName: (_) => Register(),
    Admin.routeName: (_) => const Admin(),
    NewPassword.routeName: (_) => const NewPassword(),
    RegisterConfirm.routeName: (_) => const RegisterConfirm(),
    PasswordConfirm.routeName: (_) => const PasswordConfirm(),
    AcercaDe.routeName: (_) => const AcercaDe(),
    Ajustes.routeName: (_) => const Ajustes(),
    EditarPerfil.routeName: (_) => const EditarPerfil(),
    HistorialCompras.routeName: (_) => const HistorialCompras(),
    Tarjetas.routeName: (_) => const Tarjetas(),
    Direccion.routeName: (_) => const Direccion(),
    Video.routeName: (_) => const Video(),
    Notify.routeName: (_) => const Notify(),
    SearchVideosYT.routeName: (_) => const SearchVideosYT(),
    Clock.routeName: (_) => const Clock(),
    AjustesUsuario.routeName: (_) => const AjustesUsuario(),
    Winner.routeName: (_) => const Winner(),
    HistorialEventos.routeName: (_) => const HistorialEventos(),
    VideosCategoria.routeName: (_) => const VideosCategoria(),
    VideoEvento.routeName: (_) => const VideoEvento(),
    Adivina.routeName: (_) => Adivina(),
    Estadisticas.routeName: (_) => const Estadisticas(),
    VerificarCompra.routeName: (_) => const VerificarCompra(),
    DireccionADD.routeName: (_) => const DireccionADD(),
  };

  static get rutas {
    return _rutas;
  }
}
