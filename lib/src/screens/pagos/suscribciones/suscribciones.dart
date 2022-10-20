import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/bloc/suscripciones/suscripciones_bloc.dart';
import 'package:lotto_music/src/bloc/usersus/usersus_bloc.dart';
import 'package:lotto_music/src/screens/pagos/carrito/verificar_compra/verificar_compra.dart';
import 'package:lotto_music/src/screens/pagos/suscribciones/update_suscription/update_suscription.dart';
import 'package:lotto_music/src/widgets/botones.dart';
import 'package:lotto_music/src/widgets/dialogs_alert.dart';
import 'package:lotto_music/src/widgets/text.dart';

import '../../../cores/orquestador/orquestador.dart';
import '../../../helpers/globals/screen_size.dart';
import '../../../models/plan/plan.dart';
import '../../../widgets/svg_nosignal.dart';
import '../../acount/login.dart';

class Suscripciones extends StatelessWidget {
  const Suscripciones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<SuscripcionesBloc>(context).state.planes == null) {
      Orquestador.plan.onLoadSuscripciones(context);
    }
    if (BlocProvider.of<UsersusBloc>(context).state.suscribcion == null) {
      Orquestador.user.onLoadSuscribcion(context: context);
    }
    return BlocBuilder<SuscripcionesBloc, SuscripcionesState>(
      builder: (context, state) {
        if (state.planes == null) {
          return RefreshIndicator(
              onRefresh: () async {
                Orquestador.plan.onLoadSuscripciones(context);
                Orquestador.user.onLoadSuscribcion(context: context);
              },
              child: const NoSignal());
        }
        return RefreshIndicator(
          onRefresh: () async {
            Orquestador.user.onLoadSuscribcion(context: context);
            Orquestador.plan.onLoadSuscripciones(context);
          },
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.planes?.length ?? 0,
              itemBuilder: (context, index) {
                return _TarjetaPlanes(plan: state.planes![index]);
              }),
        );
      },
    );
  }
}

class _TarjetaPlanes extends StatefulWidget {
  final PlanModel plan;
  const _TarjetaPlanes({Key? key, required this.plan}) : super(key: key);

  @override
  State<_TarjetaPlanes> createState() => __TarjetaPlanesState();
}

class __TarjetaPlanesState extends State<_TarjetaPlanes> {
  final styleBorder = const BorderSide(
    color: Color(0xffc4302b),
    style: BorderStyle.solid,
    width: 4,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
          horizontal: Medidas.size.width * .05, vertical: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border(
          bottom: styleBorder,
          left: styleBorder,
          right: styleBorder,
          top: styleBorder,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Textos.tituloMED(
              texto: widget.plan.titulo ?? "Sin Titulo",
              color: const Color(0xff1eae98),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Textos.tituloMIN(
            texto: "Puntos = ${widget.plan.puntos}",
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Textos.tituloMED(
              texto:
                  "\$ ${widget.plan.precio.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} MXN/mes",
              color: const Color(0xfffca51f),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          boton(),
        ],
      ),
    );
  }

  Widget boton() {
    return BlocBuilder<UsersusBloc, UsersusState>(
      builder: (context, state) {
        return Center(
          child: SizedBox(
            width: Medidas.size.width * .5,
            child: Botones.degradedTextButton(
              text: "Comprar suscripción",
              colors: const [Color(0xffff0000), Color(0xffff0000)],
              onTap: () async {
                final sta = state.suscribcion;

                if (sta == null) {
                  return;
                }
                if (sta.usuarioId == 0) {
                  await DialogAlert.ok(
                    context: context,
                    text: "No ha iniciado sesión",
                  );
                  return;
                }
                if ((state.suscribcion?.stripeSuscription ?? "") != "") {
                  final a = await DialogAlert.confirm(
                    context: context,
                    text: "Usted posee una suscripcion desea continuar?",
                  );
                  if (a != true) {
                    return;
                  }
                  final resp = await Orquestador.buy.craeteOrdenSuscripcion(
                    context: context,
                    planID: widget.plan.id,
                  );
                  if (resp == "Token invalido") {
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushNamed(Login.routeName);
                    return;
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushNamed(UpdateSucription.routeName);
                  return;
                }
                final resp = await Orquestador.buy.craeteOrdenSuscripcion(
                  context: context,
                  planID: widget.plan.id,
                );
                if (resp == "Token invalido") {
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushNamed(Login.routeName);
                  return;
                }
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushNamed(VerificarCompra.routeName);
              },
            ),
          ),
        );
      },
    );
  }
}
