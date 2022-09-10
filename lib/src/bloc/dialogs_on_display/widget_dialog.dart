import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/widgets/text.dart';

import '../../../generated/l10n.dart';
import '../../helpers/variables_globales.dart';
import 'dialogs_on_display_bloc.dart';

class DialogOnDisplayWidget extends StatelessWidget {
  final Widget child;
  const DialogOnDisplayWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: BlocBuilder<DialogsOnDisplayBloc, DialogsOnDisplayState>(
        builder: (context, state) {
          return Stack(
            children: [
              child,
              state.isLoading ? loading(context) : const SizedBox(),
            ],
          );
        },
      ),
    );
  }

  Widget loading(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 60),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(10)),
              child: Textos.tituloMED(
                texto: AppLocalisations.of(context).sinc,
              )),
          SizedBox(
            height: Medidas.size.height * .01,
          ),
          Image(
            image: const AssetImage('assets/appUtils/loading2.jpg'),
            height: Medidas.size.height * .05,
          ),
        ],
      ),
    );
  }
}
