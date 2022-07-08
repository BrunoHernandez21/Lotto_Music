import 'package:lotto_music/src/widgets/botones.dart';
import 'package:lotto_music/src/widgets/inputs_text.dart';
import 'package:lotto_music/src/widgets/text.dart';
import 'package:flutter/material.dart';

class EditarPerfil extends StatelessWidget {
  static const String routeName = 'editarPerfil';
  const EditarPerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          foregroundColor: Colors.black,
          centerTitle: true,
          title: Textos.tituloMIN(texto: 'Editar Perfil'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: InputsText.classic(
                      hintText: 'Nombre y Apellido',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: InputsText.classic(
                      hintText: 'Fecha de Nacimiento',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: InputsText.classic(
                      hintText: 'Correo Electronico',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: InputsText.classic(
                      hintText: 'Teléfono',
                    ),
                  ),
                  Botones.degradedTextButtonOrange(
                      text: 'Guardar Cambios', onTap: () {}),
                ],
              ),
            ),
          ),
        ));
  }
}
