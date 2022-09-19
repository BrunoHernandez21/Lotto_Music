part of 'orquestador.dart';

class _Shopingcar {
  Future<bool> onloadCarrito(BuildContext context) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final planB = BlocProvider.of<CarritoBloc>(context);
    final response = await ShoppingcarService.load(
      token: acountB.state.acount.accessToken,
    );

    if (response == null) {
      planB.add(OnLoadCarrito(itemsCarrito: const <ItemsCarrito>[]));
      return false;
    }
    if (response.mensaje == null) {
      planB.add(OnLoadCarrito(itemsCarrito: response.itemsCarrito));
      return true;
    }

    return true;
  }

  Future<String?> onAddCarrito({
    required BuildContext context,
    required CarritoModel orden,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final CarritoModel? resp = await ShoppingcarService.create(
      token: acountB.state.acount.accessToken,
      body: orden.toJson(),
    );

    if (resp == null) {
      return "error de coneccion";
    }
    if (resp.mensaje != null) {
      return resp.mensaje;
    }
    // ignore: use_build_context_synchronously
    await onloadCarrito(context);
    return "Se agrego al carrito";
  }

  Future<bool> onDeleteCarrito(
      BuildContext context, ItemsCarrito itemsCarrito) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final planB = BlocProvider.of<CarritoBloc>(context);
    final resp = await ShoppingcarService.eliminar(
        token: acountB.state.acount.accessToken, id: itemsCarrito.id);
    if (resp == null) {
      DialogAlert.ok(
        context: context,
        text: "Error de conexion",
      );
      return false;
    }
    if (resp == "Eliminado Satisfactoriamente") {
      try {
        final newitem = planB.state.itemsCarrito;
        newitem!.remove(itemsCarrito);
        planB.add(OnLoadCarrito(itemsCarrito: newitem));
        return true;
      } catch (e) {
        return false;
      }
    }

    return true;
  }
}
