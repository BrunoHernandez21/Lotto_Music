import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lotto_music/src/widgets/botones.dart';
import 'package:lotto_music/src/widgets/dialogs_alert.dart';
import 'package:lotto_music/src/widgets/inputs_text.dart';

import '../../../bloc/cartera/cartera_bloc.dart';
import '../../../bloc/stadistics/estadisticas_bloc.dart';
import '../../../bloc/ve_page_controller/videos_event_controller_bloc.dart';
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
  const Adivina({Key? key}) : super(key: key);

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
        return FadeIn(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              _CardVideo(v: state.eventoVideo),
              apuesta(evento: state.eventoVideo),
            ],
          ),
        );
      },
    );
  }

  Widget apuesta({required ItemEvent evento}) {
    final state = BlocProvider.of<EstadisticasBloc>(context).state;

    StadisticModel st = StadisticModel();
    final len = state.allStadistics?.stadisticModel?.length;

    for (int i = (len ?? 0) - 1; i >= 0; i--) {
      if (state.allStadistics?.stadisticModel?[i].videoId == evento.vidid) {
        st = state.allStadistics?.stadisticModel?[i] ?? StadisticModel();
        break;
      }
    }

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
        Textos.tituloMED(
            texto:
                "\$ ${evento.acumulado.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}MXN"),
        const SizedBox(
          height: 10,
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
        st.viewCount != 0
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Checkbox(
                      value: controlV,
                      fillColor:
                          MaterialStateProperty.all(const Color(0xFF10CA20)),
                      onChanged: (s) {
                        if (s != null) {
                          controlV = s;
                          setState(() {});
                        }
                      }),
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
                                  texto: "vistas     ${st.viewCount ?? 0}"),
                            ),
                            IconButton(
                                onPressed: () {
                                  if (mounted) {
                                    setState(
                                      () {
                                        controllerV.text =
                                            st.viewCount.toString();
                                        controlV = true;
                                      },
                                    );
                                  }
                                },
                                icon: const Icon(Icons.paste)),
                          ],
                        ),
                        InputsText.box(
                          maxLength: 20,
                          controller: controllerV,
                          labelText: "Vistas",
                          hintText: "0",
                          textAlign: TextAlign.right,
                          textType: TextInputType.number,
                          onChanged: (a) async {
                            if (a.length >= 14) {
                              controllerV.text = a.substring(0, 13);
                            }
                            if (a.length == 1) {
                              controlV = true;
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const SizedBox(),
        st.likeCount != 0
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Checkbox(
                    value: controlL,
                    fillColor:
                        MaterialStateProperty.all(const Color(0xFF10CA20)),
                    onChanged: (s) {
                      if (s != null) {
                        controlL = s;
                        setState(() {});
                      }
                    },
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
                                texto: "Me gusta    ${st.likeCount ?? 0}",
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  if (mounted) {
                                    setState(() {
                                      controllerL.text =
                                          st.likeCount.toString();
                                      controlL = true;
                                    });
                                  }
                                },
                                icon: const Icon(Icons.paste))
                          ],
                        ),
                        InputsText.box(
                          maxLength: 20,
                          controller: controllerL,
                          labelText: "Me gusta",
                          hintText: "0",
                          textAlign: TextAlign.right,
                          textType: TextInputType.number,
                          onChanged: (a) {
                            if (a.length >= 14) {
                              controllerL.text = a.substring(0, 13);
                            }
                            if (a.length == 1) {
                              controlL = true;
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const SizedBox(),
        st.commentsCount != 0
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Checkbox(
                      value: controlC,
                      fillColor:
                          MaterialStateProperty.all(const Color(0xFF10CA20)),
                      onChanged: (s) {
                        if (s != null) {
                          controlC = s;
                          setState(() {});
                        }
                      }),
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
                                  texto: "Comentarios ${st.commentsCount ?? 0}",
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    if (mounted) {
                                      setState(() {
                                        controllerC.text =
                                            st.commentsCount.toString();
                                        controlC = true;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.paste))
                            ]),
                        InputsText.box(
                          maxLength: 20,
                          controller: controllerC,
                          labelText: "Comentarios",
                          hintText: "0",
                          textAlign: TextAlign.right,
                          textType: TextInputType.number,
                          onChanged: (a) {
                            if (a.length >= 14) {
                              controllerC.text = a.substring(0, 13);
                            }
                            if (a.length == 1) {
                              controlC = true;
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const SizedBox(),
        st.savedCount != 0
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Checkbox(
                      value: controlG,
                      fillColor:
                          MaterialStateProperty.all(const Color(0xFF10CA20)),
                      onChanged: (s) {
                        if (s != null) {
                          controlG = s;
                          setState(() {});
                        }
                      }),
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
                                  texto: "Guardados ${st.savedCount ?? 0}",
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    if (mounted) {
                                      setState(() {
                                        controllerG.text =
                                            st.savedCount.toString();
                                        controlG = true;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.paste))
                            ]),
                        InputsText.box(
                          maxLength: 20,
                          controller: controllerG,
                          labelText: "Guardados",
                          hintText: "0",
                          textAlign: TextAlign.right,
                          textType: TextInputType.number,
                          onChanged: (a) {
                            if (a.length >= 14) {
                              controllerG.text = a.substring(0, 13);
                            }
                            if (a.length == 1) {
                              controlG = true;
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const SizedBox(),
        st.sharedCount != 0
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Checkbox(
                      value: controlS,
                      fillColor:
                          MaterialStateProperty.all(const Color(0xFF10CA20)),
                      onChanged: (s) {
                        if (s != null) {
                          controlS = s;
                          setState(() {});
                        }
                      }),
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
                                  texto: "Compartidos ${st.sharedCount ?? 0}",
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    if (mounted) {
                                      setState(() {
                                        controllerS.text =
                                            st.sharedCount.toString();
                                        controlS = true;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.paste))
                            ]),
                        InputsText.box(
                          maxLength: 20,
                          controller: controllerS,
                          labelText: "Compartidos",
                          hintText: "0",
                          textAlign: TextAlign.right,
                          textType: TextInputType.number,
                          onChanged: (a) {
                            if (a.length >= 14) {
                              controllerS.text = a.substring(0, 13);
                            }
                            if (a.length == 1) {
                              controlS = true;
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const SizedBox(),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 60,
          width: 160,
          child: Botones.degradedTextButton(
            text: "Participa",
            colors: [
              const Color.fromARGB(255, 100, 74, 146),
              const Color.fromARGB(255, 69, 27, 143)
            ],
            onTap: () async {
              if (!controlV &&
                  !controlL &&
                  !controlC &&
                  !controlG &&
                  !controlS) {
                DialogAlert.ok(
                  context: context,
                  text: "La apuesta no puede ser vacia",
                );
                return;
              }
              final cartera =
                  BlocProvider.of<CarteraBloc>(context).state.cartera;
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
              if (resp?.mensaje != null) {
                await DialogAlert.ok(
                  context: context,
                  text: resp?.mensaje ?? "Error",
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
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}

class _CardVideo extends StatelessWidget {
  final ItemEvent v;
  const _CardVideo({
    Key? key,
    required this.v,
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
                  onPressed: () {
                    BlocProvider.of<VEPageControllerBloc>(context).add(
                      OnSelectPapge(page: 1),
                    );
                  },
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
                texto: "Hora ${v.fechahoraevento.toString().substring(11, 16)}",
              ),
              Textos.tituloMIN(
                texto: Rutinas.comprobador(v.fechahoraevento),
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
          Assets.svgvideo,
          fit: BoxFit.cover,
        );
      },
      fit: BoxFit.cover,
    );
  }
}
