import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:lotto_music/src/cores/compositor.dart';
import 'package:lotto_music/src/helpers/variables_globales.dart';
import 'package:lotto_music/src/models/tarjetas.dart';
import 'package:lotto_music/src/widgets/inputs_text.dart';

import '../../../bloc/tarjetas/tarjetas_bloc.dart';
import '../../../widgets/chec_box.dart';
import '../../../widgets/drop_list.dart';
import '../../../widgets/text.dart';

class TarjetasEdit extends StatefulWidget {
  static const String routeName = 'tarjetasedit';
  const TarjetasEdit({Key? key}) : super(key: key);

  @override
  State<TarjetasEdit> createState() => _TarjetasEditState();
}

class _TarjetasEditState extends State<TarjetasEdit> {
  @override
  void initState() {
    final tarjeta = BlocProvider.of<TarjetasBloc>(context).state.selected;
    cardNumber.text = tarjeta?.cardNumber ?? "";
    numberscardString = cardNumber.text.replaceAllMapped(
        RegExp(r'(\d{1,4})(?=(\d{4})+(?!\d))'), (Match m) => '${m[1]} ');
    expiryDate = "${tarjeta?.expiryMonth ?? ""}/${tarjeta?.expiryYear ?? ""}";
    expirymounth.text = (tarjeta?.expiryMonth ?? "").toString();
    expiryyear.text = (tarjeta?.expiryYear ?? "").toString();
    cvvCode.text = tarjeta?.cvc.toString() ?? "";
    cardHolderName.text = tarjeta?.holderName ?? "";
    selectedTipe = tarjeta?.type ?? "";
    isDefaul = tarjeta?.defaultPayment ?? false;
    id = tarjeta?.id ?? 0;
    super.initState();
  }

  //Cart Dates
  final TextEditingController cardNumber = TextEditingController();
  final TextEditingController expirymounth = TextEditingController();
  final TextEditingController expiryyear = TextEditingController();
  final TextEditingController cardHolderName = TextEditingController();
  final TextEditingController cvvCode = TextEditingController();
  String expiryDate = '';
  String numberscardString = '';
  String selectedTipe = '';
  int id = 0;
  bool isDefaul = false;
  //Flow control
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
          children: [
            CreditCardWidget(
              glassmorphismConfig:
                  null, //false ? Glassmorphism.defaultConfig() : null,
              cardNumber: numberscardString,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName.text,
              cvvCode: cvvCode.text,
              showBackView: false,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: Colors.blue,
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Textos.tituloMAX(texto: "Editar Tarjeta"),
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
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Textos.parrafoMAX(texto: "Number Card"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: InputsText.box(
                            maxLines: 1,
                            maxLength: 16,
                            controller: cardNumber,
                            hintText: "Number Card",
                            textType: TextInputType.number,
                            onChanged: (a) {
                              onChanged();
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Textos.parrafoMAX(texto: "Expired\nmounth"),
                                SizedBox(
                                    width: Medidas.size.width * .2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: InputsText.box(
                                        maxLines: 1,
                                        maxLength: 2,
                                        controller: expirymounth,
                                        hintText: "Expired Date",
                                        onChanged: (a) {
                                          onChanged();
                                        },
                                      ),
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                Textos.parrafoMAX(texto: "Expired\nyear"),
                                SizedBox(
                                    width: Medidas.size.width * .26,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: InputsText.box(
                                        maxLines: 1,
                                        maxLength: 4,
                                        controller: expiryyear,
                                        hintText: "Expired Date",
                                        onChanged: (a) {
                                          onChanged();
                                        },
                                      ),
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                Textos.parrafoMAX(texto: "cvv\nCode"),
                                SizedBox(
                                    width: Medidas.size.width * .36,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: InputsText.box(
                                        maxLength: 4,
                                        maxLines: 1,
                                        obscure: true,
                                        controller: cvvCode,
                                        hintText: "cvv Code",
                                        onChanged: (a) {
                                          onChanged();
                                        },
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Textos.parrafoMAX(texto: "Card Holder"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: InputsText.box(
                            maxLines: 1,
                            controller: cardHolderName,
                            hintText: "CardHolder",
                            onChanged: (a) {
                              onChanged();
                            },
                          ),
                        ),
                      ],
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
                          'Actualizar',
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
                          id: id,
                          activo: true,
                          cardNumber: cardNumber.text,
                          expiryMonth: int.tryParse(expirymounth.text) ?? 0,
                          expiryYear: int.tryParse(expiryyear.text) ?? 0,
                          holderName: cardHolderName.text,
                          cvc: int.tryParse(cvvCode.text) ?? 0,
                          type: selectedTipe,
                          defaultPayment: isDefaul,
                        );
                        if (await Compositor.onUpdateTarjetas(
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

  onChanged() {
    expiryDate = "${expirymounth.text}/${expiryyear.text}";
    numberscardString = cardNumber.text.replaceAllMapped(
        RegExp(r'(\d{1,4})(?=(\d{4})+(?!\d))'), (Match m) => '${m[1]} ');
    setState(() {});
  }
}
