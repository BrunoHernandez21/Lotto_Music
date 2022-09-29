import 'package:flutter/material.dart';
import 'package:lotto_music/src/screens/eventos/eventos/history_event/tarjeta.dart';

import '../../../../cores/orquestador/orquestador.dart';
import '../../../../helpers/globals/screen_size.dart';
import '../../../../models/event/historial_event_user.dart';

class HistorialActive extends StatefulWidget {
  const HistorialActive({Key? key}) : super(key: key);

  @override
  State<HistorialActive> createState() => _HistorialActiveState();
}

class _HistorialActiveState extends State<HistorialActive> {
  final ScrollController controller = ScrollController();
  HistorialEventoUsuario? estado;
  bool isLoad = false;
  @override
  void initState() {
    isLoad = true;

    Orquestador.userEvent.onIinitHistorialActivos(context).then((value) {
      estado = value;
      isLoad = false;
      setState(() {});
    });
    controller.addListener(
      () async {
        final copy = estado;
        if (controller.position.pixels >
            controller.position.maxScrollExtent * .8) {
          if (!isLoad) {
            isLoad = true;
            if (copy == null) {
              isLoad = false;
              return;
            }
            if (copy.pag >= copy.pags) {
              isLoad = false;
              return;
            }
            final temp = await Orquestador.userEvent.onLoadHistorialActivos(
              context: context,
              pag: copy.pag + 1,
            );
            if (temp != null) {
              estado = temp;
            }
            isLoad = false;
          }
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        isLoad = true;
        Orquestador.userEvent.onIinitHistorialActivos(context).then((value) {
          estado = value;
          isLoad = false;
          setState(() {});
        });
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        controller: controller,
        child: Column(
          children: listaWidgets(),
        ),
      ),
    );
  }

  List<Widget> listaWidgets() {
    List<Widget> lista = [];
    if (estado?.userEvent?.isNotEmpty ?? false) {
      estado?.userEvent?.forEach((element) {
        lista.add(TarjetaHistory(evento: element));
      });
    }
    if ((estado?.userEvent?.length ?? 0) < 2) {
      lista.add(SizedBox(
        height: Medidas.size.height * .25,
      ));
    }
    return lista;
  }
}
