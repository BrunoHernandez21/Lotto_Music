import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/bloc/direcciones/direcciones_bloc.dart';
import 'package:lotto_music/src/models/user/direcciones.dart';
import '../../../../cores/orquestador/orquestador.dart';
import '../../../../helpers/variables_globales.dart';
import '../../../../models/user/direcciones_response.dart';
import '../../../../widgets/text.dart';
import 'direcciones_add.dart';
import 'direcciones_edit.dart';

class Direccion extends StatelessWidget {
  static const routeName = "direccion";

  const Direccion({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<DireccionesBloc, DireccionesState>(
        builder: (context, state) {
          if (state.direcciones == null) {
            Orquestador.user.onLoadDirecciones(context);
          }
          return Column(
            children: [
              const Cabezera(),
              RefreshIndicator(
                onRefresh: () async {
                  Orquestador.user.onLoadDirecciones(context);
                },
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  child: Column(
                    children: listaWidgets(state.direcciones),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<Widget> listaWidgets(DireccionesResponse? estado) {
    List<Widget> lista = [];

    estado?.direcciones?.forEach((element) {
      lista.add(_Tarjeta(evento: element));
    });

    if ((estado?.direcciones?.length ?? 0) < 2) {
      lista.add(SizedBox(
        height: Medidas.size.height * .25,
      ));
    }
    return lista;
  }
}

class _Tarjeta extends StatelessWidget {
  final DireccionesModel evento;
  const _Tarjeta({Key? key, required this.evento}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: const Icon(
          Icons.remove_circle,
          color: Colors.red,
        ),
        onPressed: () {
          Orquestador.user.onDeleteDirecciones(
            context: context,
            id: evento.id,
          );
        },
      ),
      trailing: const Icon(Icons.arrow_forward),
      title: Textos.parrafoMAX(
        texto: (evento.calle ?? "") +
            (evento.numero == null ? "" : " ${evento.numero ?? ""}") +
            (evento.ciudad == null ? "" : ", ${evento.ciudad ?? ""}") +
            (evento.pais == null ? "" : ", ${evento.pais ?? ""}"),
        renglones: 2,
      ),
      subtitle: Textos.parrafoMED(texto: evento.tipo ?? ""),
      onTap: () {
        final direccionesB = BlocProvider.of<DireccionesBloc>(context);
        direccionesB.add(OnSelectDireccion(selected: evento));
        Navigator.pushNamed(context, DireccionEdit.routeName);
      },
    );
  }

  Widget espace(Widget child) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: Medidas.size.width * .15),
        child: child,
      ),
    );
  }
}

class Cabezera extends StatelessWidget {
  const Cabezera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Textos.tituloMAX(texto: "Direcciones"),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: TextButton(
                child: Textos.tituloMIN(
                    texto: "Agrega mas", color: Colors.blueAccent),
                onPressed: () {
                  Navigator.pushNamed(context, DireccionAdd.routeName);
                },
              ),
            )
          ],
        )
      ],
    );
  }
}
