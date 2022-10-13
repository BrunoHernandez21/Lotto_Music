import 'dart:io';

import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/bloc/acount/acount_bloc.dart';
import 'package:lotto_music/src/bloc/buy/buy_bloc.dart';
import 'package:lotto_music/src/bloc/carrito/carrito_bloc.dart';
import 'package:lotto_music/src/bloc/cartera/cartera_bloc.dart';
import 'package:lotto_music/src/bloc/dialogs_on_display/dialogs_on_display_bloc.dart';
import 'package:lotto_music/src/bloc/direcciones/direcciones_bloc.dart';
import 'package:lotto_music/src/bloc/planes/planes_bloc.dart';
import 'package:lotto_music/src/bloc/shaderPreferences/shaderpreferences_bloc.dart';
import 'package:lotto_music/src/bloc/stadistics/estadisticas_bloc.dart';
import 'package:lotto_music/src/bloc/suscripciones/suscripciones_bloc.dart';
import 'package:lotto_music/src/bloc/tarjetas/tarjetas_bloc.dart';
import 'package:lotto_music/src/bloc/user/user_bloc.dart';
import 'package:lotto_music/src/bloc/video_event/video_event_bloc.dart';
import 'package:lotto_music/src/bloc/youtube/youtube_bloc.dart';
import 'package:lotto_music/src/bloc/videos_event/videos_event_bloc.dart';
import 'package:lotto_music/src/cores/orquestador/orquestador.dart';
import 'package:lotto_music/src/cores/push_notification.dart';
import 'package:lotto_music/src/cores/webDart/webcontroller.dart';
import 'package:lotto_music/src/helpers/globals/const.dart';
import 'package:lotto_music/src/screens/routes_screens.dart';
import 'package:lotto_music/src/screens/admin.dart';
import 'package:lotto_music/src/services/stripe/stripe_api.dart';
import 'package:lotto_music/src/services/websocket/socket.dart';

import 'generated/l10n.dart';
import 'src/bloc/youtube_video/video_bloc.dart';
import 'src/bloc/videos_categoria/videos_categoria_bloc.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  StripeApi().initState();

  await PushNotification.initState();
  //CheckPermissos.checkAll();
  final stateShader = await Orquestador.sistem.loadShaderLocale();
  final authState = await Orquestador.sistem.loadAuthLocale();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(Appstate(
      sAuth: authState,
      sState: stateShader,
    ));
  });
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive).then((value) {});
}

class Appstate extends StatelessWidget {
  final ShaderpreferencesState sState;
  final AcountState sAuth;

  const Appstate({
    Key? key,
    required this.sState,
    required this.sAuth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AcountBloc(acountState: sAuth)),
        BlocProvider(create: (_) => UserBloc()),
        BlocProvider(create: (_) => ShaderpreferencesBloc(shaderState: sState)),
        BlocProvider(create: (_) => CarritoBloc()),
        BlocProvider(create: (_) => PlanesBloc()),
        BlocProvider(create: (_) => SuscripcionesBloc()),
        BlocProvider(create: (_) => VideosCategoriaBloc()),
        BlocProvider(create: (_) => VideosEventBloc()),
        BlocProvider(create: (_) => VideoEventBloc()),
        BlocProvider(create: (_) => YoutubeBloc()),
        BlocProvider(create: (_) => YTVideoBloc()),
        BlocProvider(create: (_) => TarjetasBloc()),
        BlocProvider(create: (_) => DireccionesBloc()),
        BlocProvider(create: (_) => EstadisticasBloc()),
        BlocProvider(create: (_) => CarteraBloc()),
        BlocProvider(create: (_) => DialogsOnDisplayBloc()),
        BlocProvider(create: (_) => BuyBloc()),
      ],
      child: BlocBuilder<ShaderpreferencesBloc, ShaderpreferencesState>(
        builder: (context, state) {
          DartWeb.context = context;
          SocketService.intstate(
            context: context,
            userId: sAuth.acount.userId,
          );
          return MyApp(
            locale: state.idioma,
            theme: AppThemeData.getTheme(state.isDarkTheme),
          );
        },
      ),
    );
  }
}

// asdas
class MyApp extends StatelessWidget {
  final ThemeData theme;
  final String locale;

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
      locale: Locale(locale),
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

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
