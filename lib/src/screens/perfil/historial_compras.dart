import 'package:flutter/material.dart';

import '../../cores/compositor.dart';
import '../../helpers/variables_globales.dart';
import '../../models/compra.dart';
import '../../models/historial_compra.dart';
import '../../widgets/text.dart';

class HistorialCompras extends StatefulWidget {
  static const routeName = 'historialcompras';
  const HistorialCompras({Key? key}) : super(key: key);

  @override
  State<HistorialCompras> createState() => _HistorialComprasState();
}

class _HistorialComprasState extends State<HistorialCompras> {
  final ScrollController controller = ScrollController();
  HistorialCompraModel? estado;
  bool isLoad = false;
  @override
  void initState() {
    isLoad = true;
    Compositor.onIinitHistorialCompra(context).then((value) {
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
            final temp = await Compositor.onLoadHistorialCompra(
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
          Compositor.onIinitHistorialCompra(context).then((value) {
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
    if (estado?.compras?.isNotEmpty ?? false) {
      estado?.compras?.forEach((element) {
        lista.add(_Tarjeta(compra: element));
      });
    }
    if ((estado?.compras?.length ?? 0) < 2) {
      lista.add(SizedBox(
        height: Medidas.size.height * .25,
      ));
    }
    return lista;
  }
}

class _Tarjeta extends StatelessWidget {
  final CompraModel compra;
  const _Tarjeta({Key? key, required this.compra}) : super(key: key);

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
          Textos.tituloMAX(texto: "Compra"),
          if (compra.fechaCompra != null)
            espace(
              Textos.tituloMIN(
                texto: "likes: " +
                    (compra.fechaCompra?.toString().substring(0, 24) ?? ""),
              ),
            ),
          if (compra.cantidad != 0)
            Textos.tituloMIN(
              texto: "Cantidad: " + compra.cantidad.toString(),
            ),
          if (compra.amount != 0)
            Textos.tituloMIN(
              texto: "Precio total: " + compra.amount.toString() + "\$Mx",
            ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Textos.tituloMIN(
                texto: "ID " + compra.id.toString(),
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
