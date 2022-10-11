import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import '../../../../helpers/globals/screen_size.dart';
import '../../../../widgets/text.dart';

class AlertBuy extends StatelessWidget {
  final void Function() onchage;
  final List<PaymentItem> items;
  const AlertBuy({
    required this.onchage,
    required this.items,
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
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
