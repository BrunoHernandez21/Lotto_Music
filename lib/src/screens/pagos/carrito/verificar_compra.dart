import 'package:flutter/material.dart';

import '../../../cores/compositor.dart';
import '../../../helpers/variables_globales.dart';
import '../../../widgets/botones.dart';

class VerificarCompra extends StatelessWidget {
  static const routeName = "verificarCompra";
  const VerificarCompra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: Medidas.size.width * .5,
              child: Botones.degradedTextButton(
                text: "Comprar",
                colors: const [Color(0xffea8d8d), Color(0xffa890fe)],
                onTap: () async {
                  await Compositor.onBuyCarrito(
                    context: context,
                  );
                  Compositor.onloadCarrito(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
