import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/models/user/users.dart';
import 'package:lotto_music/src/widgets/botones.dart';
import 'package:lotto_music/src/widgets/inputs_text.dart';
import 'package:lotto_music/src/widgets/text.dart';
import 'package:flutter/material.dart';

import '../../bloc/user/user_bloc.dart';
import '../../cores/orquestador/orquestador.dart';
import '../../helpers/globals/screen_size.dart';

class EditarPerfil extends StatefulWidget {
  static const String routeName = 'editarPerfil';

  const EditarPerfil({Key? key}) : super(key: key);

  @override
  State<EditarPerfil> createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  final controlNombre = TextEditingController();
  final controlNumero = TextEditingController();
  final controlApellidoM = TextEditingController();
  final controlApellidoP = TextEditingController();
  final controlFecha = TextEditingController();
  DateTime? nacimiento;

  @override
  void initState() {
    final UserModel? user = BlocProvider.of<UserBloc>(context).state.user;
    nacimiento = user?.fechaNacimiento;

    controlNombre.text = user?.nombre ?? "";
    controlNumero.text = user?.telefono ?? "";
    controlApellidoM.text = user?.apellidom ?? "";
    controlApellidoP.text = user?.apellidop ?? "";
    controlFecha.text = nacimiento?.toIso8601String().substring(0, 10) ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
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
                      Textos.tituloMAX(texto: "Actalice sus datos"),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Textos.parrafoMAX(texto: "Nombre"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: InputsText.classic(
                          controller: controlNombre,
                          hintText: 'Nombre',
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Textos.parrafoMAX(texto: "Telefono"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: InputsText.classic(
                          controller: controlNumero,
                          textType: TextInputType.number,
                          hintText: 'Telefono',
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Textos.parrafoMAX(texto: "Apellido Paterno"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: InputsText.classic(
                          controller: controlApellidoP,
                          hintText: 'Apellido Paterno',
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Textos.parrafoMAX(texto: "Apellido Materno"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: InputsText.classic(
                          controller: controlApellidoM,
                          hintText: 'Apellido Materno',
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Textos.parrafoMAX(texto: "Fecha"),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          right: Medidas.size.width * .45,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: TextField(
                          controller: controlFecha,
                          enableInteractiveSelection: false,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 85, 82, 82),
                            fontSize: 17,
                          ),
                          decoration: const InputDecoration(
                            hintText: "Fecha",
                            suffixIcon: Icon(
                              Icons.calendar_month,
                              color: Colors.blue,
                            ),
                          ),
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            _selectDate(context);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Botones.degradedTextButtonOrange(
                          text: 'Guardar Cambios',
                          onTap: () {
                            UserModel temp = state.user ?? UserModel();
                            temp.nombre = controlNombre.text;
                            temp.apellidom = controlApellidoM.text;
                            temp.apellidop = controlApellidoP.text;
                            temp.telefono = controlNumero.text;
                            temp.fechaNacimiento = nacimiento;
                            Orquestador.user.onUpdateUser(
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

  _selectDate(
    BuildContext context,
  ) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now().add(const Duration(days: -6570)),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (picked != null) {
      nacimiento = picked;
      controlFecha.text = nacimiento?.toIso8601String().substring(0, 10) ?? "";
      setState(() {});
    }
  }
}
