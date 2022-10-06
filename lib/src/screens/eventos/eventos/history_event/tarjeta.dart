import 'package:flutter/material.dart';

import '../../../../helpers/globals/screen_size.dart';
import '../../../../models/event/historial_event_user.dart';
import '../../../../widgets/text.dart';

class TarjetaHistory extends StatelessWidget {
  final HistorialModel evento;
  const TarjetaHistory({Key? key, required this.evento}) : super(key: key);

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
                renglones: 2,
                align: TextAlign.left,
                texto:
                    "ID ${evento.id}\nFecha ${(evento.fecha?.toString() ?? "")}",
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
