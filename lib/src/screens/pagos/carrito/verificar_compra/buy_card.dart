import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/bloc/dialogs_on_display/dialogs_on_display_bloc.dart';
import 'package:lotto_music/src/screens/pagos/carrito/verificar_compra/state_carrito.dart';

import '../../../../cores/orquestador/orquestador.dart';
import '../../../../helpers/globals/screen_size.dart';
import '../../../../widgets/botones.dart';
import '../../../../widgets/dialogs_alert.dart';
import '../../../../widgets/inputs_text.dart';
import '../../../../widgets/text.dart';

class AlertBuy extends StatelessWidget {
  final void Function() onchage;
  final TextEditingController controller;
  const AlertBuy({
    required this.onchage,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      alignment: Alignment.bottomCenter,
      child: FadeInUp(
        duration: const Duration(milliseconds: 300),
        child: Container(
          height: Medidas.size.height * .3,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: onchage,
                        icon: const Icon(
                          Icons.arrow_back,
                        )),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Textos.parrafoMAX(
                        texto: "Ingresa tu CCV",
                      )),
                ],
              ),
              SizedBox(
                width: Medidas.size.width * .3,
                child: InputsText.box(
                  textAlign: TextAlign.right,
                  controller: controller,
                  maxLength: 4,
                  hintText: "CCV",
                  inputsFormatter: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              SizedBox(
                width: Medidas.size.width * .4,
                child: Botones.degradedTextButton(
                  text: "Comprar",
                  colors: const [
                    Color.fromARGB(255, 0, 170, 156),
                    Color.fromARGB(255, 134, 251, 255),
                  ],
                  textColor: Colors.black,
                  onTap: () async {
                    if (controller.text.isEmpty) {
                      DialogAlert.ok(context: context, text: "Ingresa el CCV");
                      return;
                    }
                    SCL.tarjeta.cvc = controller.text;
                    final state =
                        BlocProvider.of<DialogsOnDisplayBloc>(context);
                    state.add(OnIsLoading(isLoading: true));
                    final result = await Orquestador.buy.onBuyCarrito(
                      context: context,
                      tarjeta: SCL.tarjeta,
                    );
                    state.add(OnIsLoading(isLoading: false));
                    // ignore: use_build_context_synchronously
                    Orquestador.shopingcar.onloadCarrito(context);
                    Orquestador.user.onLoadCartera(context: context);
                    DialogAlert.ok(
                      context: context,
                      text: result,
                    ).then((value) {
                      if (result == "Error de CCV") {
                        return;
                      }
                      Navigator.of(context).pop();
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
