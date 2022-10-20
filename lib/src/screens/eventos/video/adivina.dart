import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lotto_music/src/widgets/botones.dart';
import 'package:lotto_music/src/widgets/dialogs_alert.dart';
import 'package:lotto_music/src/widgets/inputs_text.dart';

import '../../../bloc/cartera/cartera_bloc.dart';
import '../../../bloc/stadistics/estadisticas_bloc.dart';
import '../../../bloc/video_event/video_event_bloc.dart';
import '../../../cores/orquestador/orquestador.dart';
import '../../../helpers/globals/assets.dart';
import '../../../helpers/globals/screen_size.dart';
import '../../../helpers/rutinas.dart';
import '../../../models/event/userevent.dart';
import '../../../models/video/evento_video.dart';
import '../../../models/video/stadistics_model.dart';
import '../../../widgets/digital_clock.dart';
import '../../../widgets/text.dart';

class Adivina extends StatefulWidget {
  final void Function() onBack;
  const Adivina({
    Key? key,
    required this.onBack,
  }) : super(key: key);

  @override
  State<Adivina> createState() => _AdivinaState();
}

class _AdivinaState extends State<Adivina> {
  final controllerV = TextEditingController();
  final controllerL = TextEditingController();
  final controllerC = TextEditingController();
  final controllerG = TextEditingController();
  final controllerS = TextEditingController();

  bool controlV = false;
  bool controlL = false;
  bool controlC = false;
  bool controlG = false;
  bool controlS = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoEventBloc, VideoEventState>(
      builder: (context, state) {
        final pstate = BlocProvider.of<EstadisticasBloc>(context).state;
        StadisticModel st = StadisticModel();
        final List<StadisticModel> estadisticas = [];
        pstate.allStadistics?.stadisticModel?.forEach(
          ((element) {
            if (element.videoId == state.eventoVideo.vidId) {
              estadisticas.add(element);
            }
          }),
        );
        estadisticas.sort(
          (a, b) {
            return (a.fecha ?? DateTime(2000))
                .compareTo(b.fecha ?? DateTime(2000));
          },
        );
        if (estadisticas.isNotEmpty) {
          st = estadisticas.last;
        }
        return FadeIn(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              _CardVideo(
                v: state.eventoVideo,
                onBack: widget.onBack,
              ),
              apuesta(evento: state.eventoVideo, st: st),
            ],
          ),
        );
      },
    );
  }

  Widget apuesta({
    required ItemEvent evento,
    required StadisticModel st,
  }) {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          height: 10,
        ),
        Textos.tituloMAX(texto: "Participa y Gana"),
        const SizedBox(
          height: 10,
        ),
        evento.premioOtros != null
            ? Textos.tituloMED(
                texto: evento.premioOtros ?? "",
              )
            : Textos.tituloMED(
                texto:
                    "\$ ${(evento.acumulado ?? evento.premioCash).toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}MXN"),
        const SizedBox(
          height: 10,
        ),
        Textos.tituloMIN(
          texto: "Costo por participar ${evento.costo ?? 0}",
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: BlocBuilder<CarteraBloc, CarteraState>(
            builder: (context, state) {
              return Center(
                child: Textos.tituloMED(
                  texto: "Tus Puntos = ${state.cartera.puntos}",
                  color: Colors.yellow,
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        isGoing(
          count: st.viewCount ?? 0,
          hintText: "0",
          isVisible: (st.viewCount ?? 0) != 0,
          labelText: "Vistas",
          controller: controllerV,
          isTaping: controlV,
          onPressed: () {
            if (mounted) {
              setState(() {
                controllerV.text = st.viewCount.toString();
                controlV = true;
              });
            }
          },
          onchage: (a) {
            if (!controlV && a.isNotEmpty) {
              controlV = true;
              setState(() {});
            }
            if (controlV && a.isEmpty) {
              controlV = false;
              setState(() {});
            }
          },
          onTaping: (s) {
            if (s != null) {
              controlV = s;
              setState(() {});
            }
          },
        ),
        isGoing(
          count: st.likeCount ?? 0,
          hintText: "0",
          isVisible: (st.likeCount ?? 0) != 0,
          labelText: "Me gusta",
          controller: controllerL,
          isTaping: controlL,
          onPressed: () {
            if (mounted) {
              setState(() {
                controllerL.text = st.likeCount.toString();
                controlL = true;
              });
            }
          },
          onchage: (a) {
            if (!controlL && a.isNotEmpty) {
              controlL = true;
              setState(() {});
            }
            if (controlL && a.isEmpty) {
              controlL = false;
              setState(() {});
            }
          },
          onTaping: (s) {
            if (s != null) {
              controlL = s;
              setState(() {});
            }
          },
        ),
        isGoing(
          count: st.commentsCount ?? 0,
          hintText: "0",
          isVisible: (st.commentsCount ?? 0) != 0,
          labelText: "Comentarios",
          controller: controllerC,
          isTaping: controlC,
          onPressed: () {
            if (mounted) {
              setState(() {
                controllerC.text = st.commentsCount.toString();
                controlC = true;
              });
            }
          },
          onchage: (a) {
            if (!controlC && a.isNotEmpty) {
              controlC = true;
              setState(() {});
            }
            if (controlC && a.isEmpty) {
              controlC = false;
              setState(() {});
            }
          },
          onTaping: (s) {
            if (s != null) {
              controlC = s;
              setState(() {});
            }
          },
        ),
        isGoing(
          count: st.sharedCount ?? 0,
          hintText: "0",
          isVisible: (st.sharedCount ?? 0) != 0,
          labelText: "Compartidos",
          controller: controllerS,
          isTaping: controlS,
          onPressed: () {
            if (mounted) {
              setState(() {
                controllerS.text = st.sharedCount.toString();
                controlS = true;
              });
            }
          },
          onchage: (a) {
            if (!controlS && a.isNotEmpty) {
              controlS = true;
              setState(() {});
            }
            if (controlS && a.isEmpty) {
              controlS = false;
              setState(() {});
            }
          },
          onTaping: (s) {
            if (s != null) {
              controlS = s;
              setState(() {});
            }
          },
        ),
        isGoing(
          count: st.savedCount ?? 0,
          hintText: "0",
          isVisible: (st.savedCount ?? 0) != 0,
          labelText: "Guardados",
          controller: controllerG,
          isTaping: controlG,
          onPressed: () {
            if (mounted) {
              setState(() {
                controllerG.text = st.savedCount.toString();
                controlG = true;
              });
            }
          },
          onchage: (a) {
            if (!controlG && a.isNotEmpty) {
              controlG = true;
              setState(() {});
            }
            if (controlG && a.isEmpty) {
              controlG = false;
              setState(() {});
            }
          },
          onTaping: (s) {
            if (s != null) {
              controlG = s;
              setState(() {});
            }
          },
        ),
        const SizedBox(
          height: 30,
        ),
        botonParticipa(evento, st),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }

  SizedBox botonParticipa(ItemEvent evento, StadisticModel st) {
    return SizedBox(
      height: 60,
      width: 160,
      child: Botones.degradedTextButton(
        text: "Participa",
        colors: [
          const Color.fromARGB(255, 100, 74, 146),
          const Color.fromARGB(255, 69, 27, 143)
        ],
        onTap: () async {
          if (!controlV && !controlL && !controlC && !controlG && !controlS) {
            DialogAlert.ok(
              context: context,
              text: "La apuesta no puede ser vacia",
            );
            return;
          }
          final cartera = BlocProvider.of<CarteraBloc>(context).state.cartera;
          //////////////////////////////
          if ((cartera.puntos) <= 0) {
            await DialogAlert.ok(
              context: context,
              text: "No tienes puntos disponibles",
            );
            return;
          }
          final apuesta = UserEventModel(
            eventoId: evento.id ?? 0,
          );
          ////////////////////////// Control view
          if (controlV) {
            apuesta.viewsCount = int.tryParse(controllerV.text) ?? 0;
            if ((apuesta.viewsCount ?? 0) <= (st.viewCount ?? 0)) {
              DialogAlert.ok(
                context: context,
                text: "Las \"vistas\" son menos que las actuales",
              );
              return;
            }
          } else {
            apuesta.viewsCount = null;
          }
          ////////////////////////// Control like
          if (controlL) {
            apuesta.likeCount = int.tryParse(controllerL.text) ?? 0;
            if ((apuesta.likeCount ?? 0) <= (st.likeCount ?? 0)) {
              DialogAlert.ok(
                context: context,
                text: "Los \"me gusta\" son menos que las actuales",
              );
              return;
            }
          } else {
            apuesta.likeCount = null;
          }
          ////////////////////////// Control coments
          if (controlC) {
            apuesta.commentsCount = int.tryParse(controllerC.text) ?? 0;
            if ((apuesta.commentsCount ?? 0) <= (st.commentsCount ?? 0)) {
              DialogAlert.ok(
                context: context,
                text: "Los \"comentarios\" son menos que las actuales",
              );
              return;
            }
          } else {
            apuesta.commentsCount = null;
          }
          ////////////////////////// Control shared
          if (controlS) {
            apuesta.savedCount = int.tryParse(controllerG.text) ?? 0;
            if ((apuesta.savedCount ?? 0) <= (st.savedCount ?? 0)) {
              DialogAlert.ok(
                context: context,
                text: "Los \"guardado\" son menos que las actuales",
              );
              return;
            }
          } else {
            apuesta.savedCount = null;
          }
          ////////////////////////// Control saved
          if (controlS) {
            apuesta.sharedCount = int.tryParse(controllerS.text) ?? 0;
            if ((apuesta.sharedCount ?? 0) <= (st.sharedCount ?? 0)) {
              DialogAlert.ok(
                context: context,
                text: "Las \"compartido\" son menos que las actuales",
              );
              return;
            }
          } else {
            apuesta.sharedCount = null;
          }
          final resp = await Orquestador.userEvent.onUserEventCreate(
            context: context,
            apuesta: apuesta,
          );

          await Orquestador.user.onLoadCartera(context: context);
          if (resp.mensaje != null) {
            await DialogAlert.ok(
              context: context,
              text: resp.mensaje ?? "error",
            );
          } else {
            await DialogAlert.ok(
              context: context,
              text: "Envio exitoso",
            );
            setState(() {});
          }
        },
      ),
    );
  }

  Widget isGoing({
    required bool isVisible,
    required int count,
    required String labelText,
    required String hintText,
    required TextEditingController controller,
    required bool isTaping,
    required void Function(String) onchage,
    required void Function()? onPressed,
    required void Function(bool?) onTaping,
  }) {
    return Visibility(
      visible: isVisible,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Checkbox(
            value: isTaping,
            fillColor: MaterialStateProperty.all(const Color(0xFF10CA20)),
            onChanged: onTaping,
          ),
          SizedBox(
            width: Medidas.size.width * .6,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Medidas.size.width * .46,
                      child: Textos.parrafoMED(
                        texto: "$labelText $count",
                      ),
                    ),
                    IconButton(
                      onPressed: onPressed,
                      icon: const Icon(Icons.paste),
                    )
                  ],
                ),
                InputsText.box(
                  maxLength: 20,
                  controller: controller,
                  labelText: labelText,
                  hintText: hintText,
                  textAlign: TextAlign.right,
                  textType: TextInputType.number,
                  inputsFormatter: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: onchage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardVideo extends StatelessWidget {
  final void Function() onBack;
  final ItemEvent v;
  const _CardVideo({
    Key? key,
    required this.v,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: onBack,
                  icon: const Icon(
                    Icons.arrow_back,
                  )),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 120,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(255, 5, 222, 230),
                      Color.fromARGB(255, 3, 199, 101),
                    ])),
                child: const DefaultDigitalClock(),
              ),
            ),
          ],
        ),
        Textos.tituloMED(
          texto: v.titulo ?? "",
          renglones: 2,
        ),
        Textos.tituloMIN(
          texto: v.artista ?? "",
          renglones: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Textos.parrafoMAX(
                texto: "Hora ${v.fechahoraEvento.toString().substring(11, 16)}",
              ),
              Textos.tituloMIN(
                texto: Rutinas.comprobador(v.fechahoraEvento),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget imagen(String? url) {
    return Image.network(
      url ?? "",
      errorBuilder: (context, error, stackTrace) {
        return SvgPicture.asset(
          Assets.svgVideo,
          fit: BoxFit.cover,
        );
      },
      fit: BoxFit.cover,
    );
  }
}
