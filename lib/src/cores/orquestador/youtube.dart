part of 'orquestador.dart';

class _Youtube {
  ////////////////////////////////////////////
  ///////////////   youtube
  Future<void> onLoadPrincipalYT({
    required BuildContext context,
  }) async {
    final ytB = BlocProvider.of<YoutubeBloc>(context);
    final resp = await YTService.top();
    if (resp != null) {
      ytB.add(OnInitVideosYT(yt: resp));
    }
    return;
  }

  Future<List<ItemYT>?> onLoadRelacionadosYT({
    required BuildContext context,
    required String? relaionado,
  }) async {
    if (relaionado == null) {
      final resp = await YTService.top();
      return resp?.itemsyt;
    }
    final resp = await YTService.relative(
      ytID: relaionado,
    );
    return resp?.itemsyt;
  }

  Future<List<ItemYT>?> onSearchYT(
      {required BuildContext context, required String busqueda}) async {
    final resp = await YTService.busqueda(
      query: busqueda,
    );
    return resp?.itemsyt;
  }

  Future<bool> onSelectYT({
    required BuildContext context,
    required ItemYT item,
  }) async {
    final ytB = BlocProvider.of<YTVideoBloc>(context);
    ytB.add(OnSelectVideoYT(item: item));
    return true;
  }
}
