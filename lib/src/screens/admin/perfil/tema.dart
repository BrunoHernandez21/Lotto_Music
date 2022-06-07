import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/bloc/shaderPreferences/shaderpreferences_bloc.dart';
import 'package:lotto_music/src/cores/compositor.dart';

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
      title: Text("Dark Theme"),
      leading: Icon(Icons.color_lens),
      trailing: Switch(
        value: blocShader.state.themeData.backgroundColor ==
            ThemeData.dark().backgroundColor,
        onChanged: (a) {
          Compositor.onChagengeTheme(context);
          setState(() {});
        },
      ),
    );
  }
}
