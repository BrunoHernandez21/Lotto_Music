import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/ve_page_controller/videos_event_controller_bloc.dart';
import '../../../helpers/globals/assets.dart';
import '../../../widgets/text.dart';

class AppbarVideosEvento extends StatelessWidget {
  const AppbarVideosEvento({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                BlocProvider.of<VEPageControllerBloc>(context).add(
                  OnSelectPapge(page: 1),
                );
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 18,
              )),
          const SizedBox(
            width: 15,
          ),
          Image.asset(Assets.logo, height: 30),
          const SizedBox(
            width: 5,
          ),
          Textos.parrafoMED(texto: "Lotto Music"),
          const Expanded(child: SizedBox()),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
