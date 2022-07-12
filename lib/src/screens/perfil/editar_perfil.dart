import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/cores/compositor.dart';
import 'package:lotto_music/src/models/users.dart';
import 'package:lotto_music/src/widgets/botones.dart';
import 'package:lotto_music/src/widgets/inputs_text.dart';
import 'package:lotto_music/src/widgets/text.dart';
import 'package:flutter/material.dart';

import '../../bloc/user/user_bloc.dart';

class EditarPerfil extends StatefulWidget {
  static const String routeName = 'editarPerfil';

  const EditarPerfil({Key? key}) : super(key: key);

  @override
  State<EditarPerfil> createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  final TextEditingController controlNombre = TextEditingController();
  final TextEditingController controlNumero = TextEditingController();
  final TextEditingController controlApellidoM = TextEditingController();
  final TextEditingController controlApellidoP = TextEditingController();
  final TextEditingController controlFecha = TextEditingController();

  @override
  void initState() {
    final estado = BlocProvider.of<UserBloc>(context).state;

    controlNombre.text = estado.user?.nombre ?? "";
    controlNumero.text = estado.user?.telefono ?? "";
    controlApellidoM.text = estado.user?.apellidom ?? "";
    controlApellidoP.text = estado.user?.apellidop ?? "";
    controlFecha.text =
        estado.user?.fechaNacimiento?.toIso8601String().substring(0, 10) ?? "";

    super.initState();
  }

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
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: InputsText.classic(
                          controller: controlNombre,
                          hintText: 'Nombre',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: InputsText.classic(
                          controller: controlNumero,
                          hintText: 'Telefono',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: InputsText.classic(
                          controller: controlApellidoP,
                          hintText: 'Apellido Paterno',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: InputsText.classic(
                          controller: controlApellidoM,
                          hintText: 'Apellido Materno',
                        ),
                      ),
                      /*//TODO: DATAPIKER
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: InputsText.classic(
                          controller: controlFecha,
                          hintText: 'Fecha de Nacimiento',
                        ),
                      ),*/
                      Botones.degradedTextButtonOrange(
                          text: 'Guardar Cambios',
                          onTap: () {
                            UserModel temp = state.user ?? UserModel();
                            temp.nombre = controlNombre.text;
                            temp.apellidom = controlApellidoM.text;
                            temp.apellidop = controlApellidoP.text;
                            temp.telefono = controlNumero.text;
                            Compositor.onUpdateUser(
                              context: context,
                              user: temp,
                            );
                          }),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
