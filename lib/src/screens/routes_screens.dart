import 'package:flutter/cupertino.dart';
import 'package:lotto_music/src/screens/pagos/carrito/carrito.dart';
import 'package:lotto_music/src/screens/perfil/suscripcion.dart';
import 'package:lotto_music/src/screens/perfil/tarjetas/tarjetas_add.dart';
import 'package:lotto_music/src/screens/perfil/tarjetas/tarjetas_edit.dart';

import 'acount/login.dart';
import 'acount/recovery.dart';
import 'acount/register.dart';
import 'acount/register_confirm.dart';
import 'admin.dart';
import 'eventos/video/video_evento.dart';
import 'eventos/categorias/videos_categorias.dart';
import 'pagos/carrito/verificar_compra/verificar_compra.dart';
import 'perfil/editar_perfil/cartera.dart';
import 'perfil/editar_perfil/direcciones/direccion.dart';
import 'perfil/editar_perfil/direcciones/direcciones_add.dart';
import 'perfil/editar_perfil/direcciones/direcciones_edit.dart';
import 'perfil/editar_perfil/new_password.dart';
import 'perfil/editar_perfil/password_confirm.dart';
import 'provedores_video/youtube/search/search.dart';
import 'provedores_video/youtube/video/video.dart';
import 'eventos/eventos/clock.dart';
import 'eventos/eventos/history_event/historial_eventos.dart';
import 'utils/notify.dart';
import 'perfil/acerda_de.dart';
import 'perfil/ajustes/ajustes.dart';
import 'perfil/editar_perfil/ajustes_usuario.dart';
import 'perfil/editar_perfil.dart';
import 'perfil/historial_compras.dart';
import 'perfil/tarjetas/tarjetas.dart';
import 'utils/winner.dart';

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
    VerificarCompra.routeName: (_) => const VerificarCompra(),
    DireccionEdit.routeName: (_) => const DireccionEdit(),
    DireccionAdd.routeName: (_) => const DireccionAdd(),
    TarjetasEdit.routeName: (_) => const TarjetasEdit(),
    TarjetasADD.routeName: (_) => const TarjetasADD(),
    Cartera.routeName: (_) => const Cartera(),
    Carrito.routeName: (_) => const Carrito(),
    SuscribcionPage.routeName: (_) => const SuscribcionPage(),
  };

  static get rutas {
    return _rutas;
  }
}
