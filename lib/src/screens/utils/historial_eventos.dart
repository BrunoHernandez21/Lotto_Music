import 'package:flutter/material.dart';

import '../../cores/orquestador/orquestador.dart';
import '../../helpers/globals/screen_size.dart';
import '../../models/event/historial_event_user.dart';
import '../../widgets/text.dart';

class HistorialEventos extends StatefulWidget {
  static const routeName = 'historialEventos';
  const HistorialEventos({Key? key}) : super(key: key);

  @override
  State<HistorialEventos> createState() => _HistorialEventosState();
}

class _HistorialEventosState extends State<HistorialEventos> {
  final ScrollController controller = ScrollController();
  HistorialEventoUsuario? estado;
  bool isLoad = false;
  @override
  void initState() {
    isLoad = true;
    Orquestador.userEvent.onIinitHistorialEventos(context).then((value) {
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
            final temp = await Orquestador.userEvent.onLoadHistorialEventos(
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          isLoad = true;
          Orquestador.userEvent.onIinitHistorialEventos(context).then((value) {
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
      ),
    );
  }

  List<Widget> listaWidgets() {
    List<Widget> lista = [];
    if (estado?.userEvent?.isNotEmpty ?? false) {
      estado?.userEvent?.forEach((element) {
        lista.add(_Tarjeta(evento: element));
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

class _Tarjeta extends StatelessWidget {
  final HistorialModel evento;
  const _Tarjeta({Key? key, required this.evento}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const styleBorder = BorderSide(
      color: Color(0xff591da9),
      style: BorderStyle.solid,
      width: 4,
    );
    return Container(
      height: Medidas.size.height * .3,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: const Border(
          bottom: styleBorder,
          left: styleBorder,
          right: styleBorder,
          top: styleBorder,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          evento.activo
              ? Textos.tituloMAX(texto: "Apuesta Activa")
              : Textos.tituloMAX(texto: "Apuesta inactiva"),
          Textos.tituloMIN(
            texto: "Tipo de apuesta",
          ),
          if (evento.likeCount != null)
            espace(
              Textos.tituloMIN(
                texto: "likes: ${evento.likeCount}",
              ),
            ),
          if (evento.commentsCount != null)
            espace(
              Textos.tituloMIN(
                texto: "Comentarios: ${evento.commentsCount}",
              ),
            ),
          if (evento.viewsCount != null)
            espace(
              Textos.tituloMIN(
                texto: "Vistas: ${evento.viewsCount}",
              ),
            ),
          if (evento.sharedCount != null)
            espace(
              Textos.tituloMIN(
                texto: "Compartidas: ${evento.sharedCount}",
              ),
            ),
          if (evento.savedCount != null)
            espace(
              Textos.tituloMIN(
                texto: "Guardadas: ${evento.savedCount}",
              ),
            ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Textos.tituloMIN(
                texto:
                    "ID ${evento.id} Fecha ${(evento.fecha?.toString() ?? "")}",
              ),
            ),
          ),
        ],
      ),
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
