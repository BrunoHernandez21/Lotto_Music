import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/bloc/shaderPreferences/shaderpreferences_bloc.dart';

import '../../cores/orquestador/orquestador.dart';
import '../../widgets/text.dart';

class TemeApp extends StatefulWidget {
  const TemeApp({Key? key}) : super(key: key);

  @override
  State<TemeApp> createState() => _TemeAppState();
}

class _TemeAppState extends State<TemeApp> {
  @override
  Widget build(BuildContext context) {
    final blocShader = BlocProvider.of<ShaderpreferencesBloc>(context);

    return ListTile(
      title: Textos.tituloMIN(texto: "Dark Theme"),
      leading: const Icon(Icons.color_lens),
      trailing: Switch(
        value: blocShader.state.isDarkTheme,
        onChanged: (a) {
          Orquestador.sistem.onChagengeTheme(context);
          setState(() {});
        },
      ),
    );
  }
}
