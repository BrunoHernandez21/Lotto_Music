part of 'orquestador.dart';

class _Planes {
  Future<bool> onLoadPlanes(BuildContext context) async {
    final planB = BlocProvider.of<PlanesBloc>(context);
    final response = await PlanService.loadPlan();

    if (response.mensaje == null) {
      planB.add(OnLoadPlanes(planes: response.planes));
      return true;
    }

    return true;
  }

  /// Categorias
  Future<bool> onLoadSuscripciones(BuildContext context) async {
    final planB = BlocProvider.of<SuscripcionesBloc>(context);
    final response = await PlanService.loadSuscripcion();

    if (response.mensaje == null) {
      planB.add(OnLoadSuscripciones(planes: response.planes));
      return true;
    }

    return true;
  }
}
