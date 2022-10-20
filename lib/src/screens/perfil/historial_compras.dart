import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../cores/orquestador/orquestador.dart';
import '../../helpers/globals/assets.dart';
import '../../helpers/globals/screen_size.dart';
import '../../models/buy/compra.dart';
import '../../models/buy/historial_compra.dart';
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
    Orquestador.buy.onIinitHistorialCompra(context).then((value) {
      estado = value;
      isLoad = false;
      setState(() {});
    });
    controller.addListener(
      () async {
        if (estado == null) {
          isLoad = false;
          return;
        }
        if (controller.position.pixels >
            controller.position.maxScrollExtent * .8) {
          if (!isLoad) {
            isLoad = true;
            if ((estado?.pag ?? 0) >= (estado?.pags ?? 0)) {
              isLoad = false;
              return;
            }

            final temp = await Orquestador.buy.onLoadHistorialCompra(
              context: context,
              pag: (estado?.pag ?? 0) + 1,
            );

            if (temp?.compras != null) {
              estado?.compras?.addAll(temp?.compras ?? []);
              estado?.pag = (estado?.pag ?? 0) + 1;
              setState(() {});
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
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          isLoad = true;
          Orquestador.buy.onIinitHistorialCompra(context).then((value) {
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
    } else {
      lista.add(
        SizedBox(
          height: Medidas.size.height * .6,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.svgEmptycart,
                height: Medidas.size.width * .3,
                width: Medidas.size.width * .3,
              ),
              const SizedBox(
                height: 30,
              ),
              Textos.parrafoMED(texto: "Deslice para actualizar"),
            ],
          ),
        ),
      );
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
      height: Medidas.size.height * .19,
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
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Textos.tituloMAX(texto: "Compra"),
                compra.status == "pagado"
                    ? const Icon(
                        Icons.verified,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
              ],
            ),
          ),
          if ((compra.precioTotal ?? 0) != 0)
            Textos.tituloMIN(
              texto:
                  "Precio total:  \$${(compra.precioTotal ?? 0).toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} MXN",
            ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 5),
              child: Textos.tituloMIN(
                texto: "Orden ${compra.id} \n${compra.fechaPagado}",
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
