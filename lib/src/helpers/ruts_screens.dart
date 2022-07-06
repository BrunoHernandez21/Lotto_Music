import 'package:flutter/cupertino.dart';

import '../screens/acount/login.dart';
import '../screens/acount/recovery.dart';
import '../screens/acount/recovery_verificacion.dart';
import '../screens/acount/register.dart';
import '../screens/acount/register_confirm.dart';
import '../screens/acount/root.dart';
import '../screens/admin.dart';
import '../screens/clock/clock.dart';
import '../screens/notify/notify.dart';
import '../screens/perfil/acerdade.dart';
import '../screens/perfil/ajustes/ajustes.dart';
import '../screens/perfil/ajustes/ajustes_usuario.dart';
import '../screens/perfil/ajustes/billetera.dart';
import '../screens/perfil/ajustes/direccion.dart';
import '../screens/perfil/ajustes/new_password.dart';
import '../screens/perfil/ajustes/password_confirm.dart';
import '../screens/perfil/editar_perfil.dart';
import '../screens/perfil/historial_compras.dart';
import '../screens/perfil/tarjetas.dart';
import '../screens/search/search.dart';
import '../screens/videos/video.dart';
import '../screens/videos/videos.dart';

class Ruts {
  static final Map<String, WidgetBuilder> _rutas = {
    RootPage.routeName: (_) => const RootPage(),
    Login.routeName: (_) => Login(),
    Recovery.routeName: (_) => const Recovery(),
    RecoveryVerificacion.routeName: (_) => const RecoveryVerificacion(),
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
    Billetera.routeName: (_) => const Billetera(),
    Videos.routeName: (_) => const Videos(),
    Video.routeName: (_) => const Video(),
    Notify.routeName: (_) => const Notify(),
    SearchVideos.routeName: (_) => const SearchVideos(),
    Clock.routeName: (_) => const Clock(),
    AjustesUsuario.routeName: (_) => const AjustesUsuario(),
  };

  static get rutas {
    return _rutas;
  }
}
