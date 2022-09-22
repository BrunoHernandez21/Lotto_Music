part of 'orquestador.dart';

class _Videos {
  // Estadisticas
  Future<void> onLoadStadistic({
    required BuildContext context,
  }) async {
    final blocSt = BlocProvider.of<EstadisticasBloc>(context);
    final StadisticsResponse? st = await VideoService.estadisticas();
    if (st == null) {
      return;
    }
    if (st.mensaje != null) {
      return;
    }
    blocSt.add(OnUpdateStadistics(response: st));
    return;
  }

  // video categoria
  Future<List<String>?> onLoadCategorias(
      {required BuildContext context}) async {
    final GruposModel? grupos = await VideoService.listarGrupos();
    if (grupos == null) {
      return null;
    }
    if (grupos.mensaje == null) {
      return grupos.grupos;
    }
    return [];
  }

  Future<bool> onLoadVideosCategoria({required BuildContext context}) async {
    final vEB = BlocProvider.of<VideosCategoriaBloc>(context);
    final resp = await VideoService.listarVideosCategoria(
      pag: vEB.state.pag + 1,
      categoria: vEB.state.categoria,
    );
    if (resp == null) {
      return false;
    }
    if (resp.mensaje == null) {
      if (vEB.state.pag > (resp.pag)) {
        return true;
      }
      vEB.add(OnLoadVideosCategoria(listado: resp.items ?? [], pag: resp.pag));
      return true;
    }
    return false;
  }

  Future<bool> onLoadInitVideosCategoria(BuildContext context) async {
    final vEB = BlocProvider.of<VideosCategoriaBloc>(context);

    final resp = await VideoService.listarVideosCategoria(
      pag: 1,
      categoria: vEB.state.categoria,
    );
    if (resp == null) {
      return false;
    }
    if (resp.mensaje == null) {
      vEB.add(OnInitVideosCategoria(
        listado: resp.items ?? [],
        pag: resp.pag,
        count: resp.totals,
        pags: resp.pags,
        sizePage: resp.sizePage,
      ));
      return true;
    }
    return true;
  }

  Future<bool> onCategoriaS({
    required BuildContext context,
    required String categoria,
  }) async {
    final vEB = BlocProvider.of<VideosCategoriaBloc>(context);
    vEB.add(OnSelectCategoria(
      categoria: categoria,
    ));
    return true;
  }

  //// videos de evento
  Future<bool> onLoadVideosEventos({
    required BuildContext context,
  }) async {
    final vEB = BlocProvider.of<VideosEventBloc>(context);
    if (vEB.state.pag + 1 > vEB.state.pags) {
      return false;
    }
    final resp = await VideoService.listarEventos(pag: vEB.state.pag + 1);
    if (resp == null) {
      return false;
    }

    if (resp.mensaje == null) {
      if (vEB.state.pag > resp.pag) {
        return true;
      }
      vEB.add(
        OnLoadVideosEvent(
          listado: resp.items ?? [],
          pag: resp.pag,
        ),
      );
      return true;
    }
    return false;
  }

  Future<bool> onLoadInitVideosEventos(BuildContext context) async {
    final vEB = BlocProvider.of<VideosEventBloc>(context);

    final resp = await VideoService.listarEventos(pag: 1);
    if (resp == null) {
      return false;
    }
    if (resp.mensaje == null) {
      vEB.add(OnInitVideosEvent(
        listado: resp.items ?? [],
        pag: resp.pag,
        count: resp.totals,
        pags: resp.pags,
        sizePage: resp.sizePage,
      ));
      return true;
    }
    return true;
  }

  Future<List<ItemEvent>?> onLoadEventosTemp(
      {required BuildContext context}) async {
    final resp = await VideoService.listarEventos(pag: 1);
    return resp?.items;
  }

////////////// seleccionar video para reprocir (evento) ///////
  Future<bool> onSlectVideoEvento({
    required BuildContext context,
    required ItemEvent item,
  }) async {
    final vB = BlocProvider.of<VideoEventBloc>(context);
    vB.add(OnSelectVideoEvent(eventoVideo: item));
    return true;
  }
}
