import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../helpers/globals/screen_size.dart';

class DialogAlert {
  static Future<bool?> ok(
      {required BuildContext context, String text = ''}) async {
    return showDialog<bool?>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Center(
              child: Text(
            text,
            textAlign: TextAlign.center,
          )),
          actions: <Widget>[
            TextButton(
              child: Text(
                AppLocalisations.of(context).ok,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Widget loading(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  AppLocalisations.of(context).sinc,
                  textScaleFactor: 1.2,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: Medidas.size.height * .01,
              ),
              Image(
                image: const AssetImage('assets/appUtils/loading2.jpg'),
                height: Medidas.size.height * .05,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Future<bool?> confirm({
    required BuildContext context,
    required String text,
  }) async {
    return showDialog<bool?>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Center(
              child: Text(
            text,
            textAlign: TextAlign.center,
          )),
          actions: <Widget>[
            Row(
              children: [
                TextButton(
                  child: const Text("Cancelar"),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                const Expanded(child: SizedBox()),
                TextButton(
                  child: const Text("Aceptar"),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
