import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:lotto_music/src/cores/compositor.dart';
import 'package:lotto_music/src/models/tarjetas.dart';
import 'package:lotto_music/src/widgets/text.dart';

import '../../../helpers/variables_globales.dart';
import '../../../widgets/chec_box.dart';
import '../../../widgets/drop_list.dart';

class TarjetasADD extends StatefulWidget {
  static const String routeName = 'tarjetasadd';
  const TarjetasADD({Key? key}) : super(key: key);

  @override
  State<TarjetasADD> createState() => _TarjetasState();
}

class _TarjetasState extends State<TarjetasADD> {
  //Cart Dates
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  String selectedTipe = '';
  bool isDefaul = false;
  //flowcontrol
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CreditCardWidget(
              glassmorphismConfig:
                  useGlassMorphism ? Glassmorphism.defaultConfig() : null,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: Colors.red,
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Textos.tituloMAX(texto: "Agrega una Tarjetas"),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: Medidas.size.width * .4,
                          child: Column(
                            children: [
                              MyCheckBoxTitle(
                                value: isDefaul,
                                title:
                                    Textos.parrafoMED(texto: "Predetarminada"),
                                onChnange: (a) {
                                  isDefaul = a;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Medidas.size.width * .4,
                          child: Column(
                            children: [
                              Textos.tituloMIN(texto: "Tipo"),
                              DropListButton(
                                init: Variables.estadosTarjeta.first,
                                items: Variables.estadosTarjeta,
                                onChange: (sel) {
                                  selectedTipe = sel ?? '';
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      themeColor: Colors.blue,
                      textColor: Colors.white,
                      cardNumberDecoration: InputDecoration(
                        labelText: 'Numero',
                        hintText: 'XXXX XXXX XXXX XXXX',
                        hintStyle: const TextStyle(color: Colors.white),
                        labelStyle: const TextStyle(color: Colors.white),
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                      expiryDateDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.white),
                        labelStyle: const TextStyle(color: Colors.white),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Fecha de expiracion',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.white),
                        labelStyle: const TextStyle(color: Colors.white),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.white),
                        labelStyle: const TextStyle(color: Colors.white),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Nombre del Propietario',
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: const Color(0xff1b447b),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        child: const Text(
                          'Guardar',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'halter',
                            fontSize: 14,
                            package: 'flutter_credit_card',
                          ),
                        ),
                      ),
                      onPressed: () async {
                        final tarjeta = TarjetaModel(
                          activo: true,
                          cvc: int.tryParse(cvvCode) ?? 0,
                          expiryMonth:
                              int.tryParse(expiryDate.substring(0, 2)) ?? 0,
                          expiryYear:
                              int.tryParse(expiryDate.substring(3, 5)) ?? 0,
                          cardNumber: cardNumber,
                          holderName: cardHolderName,
                          defaultPayment: isDefaul,
                          type: selectedTipe,
                        );

                        if (await Compositor.onCreateTarjetas(
                          context: context,
                          tarjeta: tarjeta,
                        )) {
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}

// final a = [
//   {"id": 1, "name": "Views"},
//   {"id": 2, "name": "Like"},
//   {"id": 3, "name": "comments"},
//   {"id": 4, "name": "Dislikes"},
//   {"id": 5, "name": "Saved"},
//   {"id": 6, "name": "Shared"}
// ];
