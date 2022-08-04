import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/models/tarjetas.dart';
import 'package:lotto_music/src/models/tarjetas_response.dart';
import 'package:lotto_music/src/screens/perfil/tarjetas/tarjetas_add.dart';
import 'package:lotto_music/src/screens/perfil/tarjetas/tarjetas_edit.dart';

import '../../../bloc/tarjetas/tarjetas_bloc.dart';
import '../../../cores/compositor.dart';
import '../../../helpers/variables_globales.dart';
import '../../../widgets/text.dart';

class Tarjetas extends StatefulWidget {
  static const String routeName = 'tarjetas';
  const Tarjetas({Key? key}) : super(key: key);

  @override
  State<Tarjetas> createState() => _TarjetasState();
}

class _TarjetasState extends State<Tarjetas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<TarjetasBloc, TarjetasState>(
        builder: (context, state) {
          if (state.tarjetas == null) {
            Compositor.onLoadTarjetas(context);
          }
          return Column(
            children: [
              const Cabezera(),
              RefreshIndicator(
                onRefresh: () async {
                  Compositor.onLoadTarjetas(context);
                },
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  child: Column(
                    children: listaWidgets(state.tarjetas),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<Widget> listaWidgets(TarjetasResponse? estado) {
    List<Widget> lista = [];

    estado?.tarjetas?.forEach((element) {
      lista.add(_Tarjeta(evento: element));
    });

    if ((estado?.tarjetas?.length ?? 0) < 2) {
      lista.add(SizedBox(
        height: Medidas.size.height * .25,
      ));
    }
    return lista;
  }
}

class _Tarjeta extends StatelessWidget {
  final TarjetaModel evento;
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
          Compositor.onDeleteTarjetas(
            context: context,
            id: evento.id,
          );
        },
      ),
      trailing: const Icon(Icons.arrow_forward),
      title: Textos.parrafoMAX(texto: evento.cardNumber),
      subtitle: Textos.parrafoMED(texto: evento.holderName),
      onTap: () {
        final tarjetasB = BlocProvider.of<TarjetasBloc>(context);
        tarjetasB.add(OnSelectTarjetas(selected: evento));
        Navigator.pushNamed(context, TarjetasEdit.routeName);
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
        Textos.tituloMAX(texto: "Tarjetas"),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: TextButton(
                child: Textos.tituloMIN(
                    texto: "Agrega mas", color: Colors.blueAccent),
                onPressed: () {
                  Navigator.pushNamed(context, TarjetasADD.routeName);
                },
              ),
            )
          ],
        )
      ],
    );
  }
}


// final a = [
//   {"id": 1, "name": "Views"},
//   {"id": 2, "name": "Like"},
//   {"id": 3, "name": "comments"},
//   {"id": 4, "name": "Dislikes"},
//   {"id": 5, "name": "Saved"},
//   {"id": 6, "name": "Shared"}
// ];
