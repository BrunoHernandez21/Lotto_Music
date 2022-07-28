import 'package:flutter/material.dart';

class VerificaCompra extends StatelessWidget {
  static const String routName = "verificacompra";
  const VerificaCompra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("verifica compra"),
      ),
    );
  }
}
