import 'package:flutter/cupertino.dart';
import 'package:lotto_music/src/screens/admin/clock/clock.dart';
import 'package:lotto_music/src/screens/admin/videos/video.dart';
import 'package:lotto_music/src/screens/admin/videos/videos.dart';

import '../screens/acount/login.dart';
import '../screens/acount/recovery_verificacion.dart';
import '../screens/admin/admin.dart';
import '../screens/admin/notify/notify.dart';
import '../screens/admin/perfil/acerdade.dart';
import '../screens/admin/perfil/ajustes/ajustes.dart';
import '../screens/admin/perfil/ajustes/billetera.dart';
import '../screens/admin/perfil/ajustes/direccion.dart';
import '../screens/admin/perfil/ajustes/new_password.dart';
import '../screens/admin/perfil/ajustes/password_confirm.dart';
import '../screens/acount/recovery.dart';
import '../screens/acount/register.dart';
import '../screens/acount/register_confirm.dart';
import '../screens/acount/root.dart';
import '../screens/admin/perfil/ayuda.dart';
import '../screens/admin/perfil/editar_perfil.dart';
import '../screens/admin/perfil/informacionlegal.dart';
import '../screens/admin/search/search.dart';

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
    Ayuda.routeName: (_) => const Ayuda(),
    InformacionLegal.routeName: (_) => const InformacionLegal(),
    Direccion.routeName: (_) => const Direccion(),
    Billetera.routeName: (_) => const Billetera(),
    Videos.routeName: (_) => const Videos(),
    Video.routeName: (_) => const Video(),
    Notify.routeName: (_) => const Notify(),
    SearchVideos.routeName: (_) => const SearchVideos(),
    Clock.routeName: (_) => const Clock(),
  };

  static get rutas {
    return _rutas;
  }
}
