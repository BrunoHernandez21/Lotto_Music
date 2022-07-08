import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/bloc/acount/acount_bloc.dart';
import 'package:lotto_music/src/bloc/carrito/carrito_bloc.dart';
import 'package:lotto_music/src/bloc/planes/planes_bloc.dart';
import 'package:lotto_music/src/bloc/shaderPreferences/shaderpreferences_bloc.dart';
import 'package:lotto_music/src/bloc/videos/videos_bloc.dart';
import 'package:lotto_music/src/bloc/videos_event/videos_event_bloc.dart';
import 'package:lotto_music/src/cores/acount.dart';
import 'package:lotto_music/src/cores/preferences_app.dart';
import 'package:lotto_music/src/helpers/ruts_screens.dart';
import 'package:lotto_music/src/models/login_response.dart';
import 'package:lotto_music/src/screens/admin.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //PushNotification.initializeApp();
  //CheckPermissos.checkAll();

  final theme = await PreferencesApp.theme;
  final locale = await PreferencesApp.locale;
  final acount = await AcountLocalSave.loadLoginResponse();
  final isLogin = await AcountLocalSave.isLogin;

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(Appstate(
      acount: acount,
      locale: locale,
      theme: theme,
      isLogin: isLogin,
    ));
  });
}

class Appstate extends StatelessWidget {
  final Locale locale;
  final ThemeData theme;
  final LoginResponse acount;
  final bool isLogin;

  const Appstate(
      {Key? key,
      required this.locale,
      required this.theme,
      required this.acount,
      required this.isLogin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AcountBloc(
            acount: acount,
            isLogin: isLogin,
          ),
        ),
        BlocProvider(
          create: (_) => ShaderpreferencesBloc(
            locale: locale,
            theme: theme,
          ),
        ),
        BlocProvider(create: (context) => CarritoBloc()),
        BlocProvider(create: (context) => PlanesBloc()),
        BlocProvider(create: (context) => VideosBloc()),
        BlocProvider(create: (context) => VideosEventBloc()),
      ],
      child: BlocBuilder<ShaderpreferencesBloc, ShaderpreferencesState>(
        builder: (context, state) {
          return MyApp(
            locale: state.idioma,
            theme: state.themeData,
          );
        },
      ),
    );
  }
}

// asdas
class MyApp extends StatelessWidget {
  final ThemeData theme;
  final Locale locale;

  const MyApp({
    Key? key,
    required this.theme,
    required this.locale,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lotto Music',
      debugShowCheckedModeBanner: false,
      theme: theme,
      locale: locale,
      routes: Ruts.rutas,
      initialRoute: Admin.routeName,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalisations.delegate
      ],
      supportedLocales: AppLocalisations.delegate.supportedLocales,
    );
  }
}
