import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/carrito/carrito_bloc.dart';
import '../../helpers/globals/assets.dart';
import '../../widgets/text.dart';
import 'carrito/carrito.dart';

class AppbarCarrito extends StatelessWidget {
  const AppbarCarrito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 15,
          ),
          Image.asset(Assets.pngLogo, height: 30),
          const SizedBox(
            width: 5,
          ),
          Textos.parrafoMED(texto: "Lotto Music"),
          const Expanded(child: SizedBox()),
          BlocBuilder<CarritoBloc, CarritoState>(
            builder: (context, state) {
              final num = state.itemsCarrito?.length ?? 0;
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Carrito.routeName);
                },
                child: SizedBox(
                  child: Stack(
                    children: [
                      const SizedBox(
                        height: 40,
                        width: 50,
                        child: Icon(Icons.shopping_cart_checkout),
                      ),
                      Visibility(
                        visible: num > 0,
                        child: SizedBox(
                          height: 40,
                          width: 50,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                num.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
