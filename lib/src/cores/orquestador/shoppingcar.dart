part of 'orquestador.dart';

class _Shopingcar {
  Future<bool> onloadCarrito({required BuildContext context}) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final planB = BlocProvider.of<CarritoBloc>(context);
    final response = await ShoppingcarService.load(
      token: acountB.state.acount.accessToken,
    );

    if (response.mensaje == null) {
      planB.add(OnLoadCarrito(itemsCarrito: response.itemsCarrito));
      return true;
    }

    return false;
  }

  Future<String?> onAddCarrito({
    required BuildContext context,
    required CarritoModel orden,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final CarritoModel resp = await ShoppingcarService.create(
      token: acountB.state.acount.accessToken,
      body: orden.toMap(),
    );

    if (resp.mensaje != null) {
      return resp.mensaje;
    }
    // ignore: use_build_context_synchronously
    await onloadCarrito(context: context);
    return "Se agrego al carrito";
  }

  Future<bool> onDeleteCarrito(
      BuildContext context, ItemsCarrito itemsCarrito) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final planB = BlocProvider.of<CarritoBloc>(context);
    final resp = await ShoppingcarService.eliminar(
      token: acountB.state.acount.accessToken,
      id: itemsCarrito.id,
    );
    if (resp == "Eliminado Satisfactoriamente") {
      final newitem = planB.state.itemsCarrito;
      try {
        newitem!.remove(itemsCarrito);
      } catch (e) {
        newitem;
      }
      planB.add(OnLoadCarrito(itemsCarrito: newitem));
    } else {
      DialogAlert.ok(
        context: context,
        text: resp,
      );
    }

    return true;
  }
}
