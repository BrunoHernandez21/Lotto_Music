import 'package:flutter/material.dart';

class MyCheckBoxTitle extends StatefulWidget {
  final bool value;
  final void Function(bool) onChnange;
  final Widget title;
  final Widget? leading;
  const MyCheckBoxTitle(
      {required this.value,
      required this.onChnange,
      required this.title,
      this.leading,
      Key? key})
      : super(key: key);

  @override
  State<MyCheckBoxTitle> createState() => _MyCheckBoxTitleState();
}

class _MyCheckBoxTitleState extends State<MyCheckBoxTitle> {
  bool valor = false;
  bool init = true;
  @override
  Widget build(BuildContext context) {
    if (init) {
      init = false;
      valor = widget.value;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
            value: valor,
            onChanged: (a) {
              valor = !valor;
              widget.onChnange(valor);
              setState(() {});
            }),
        widget.title,
        Flexible(
          child: widget.leading ?? const SizedBox(),
        )
      ],
    );
  }
}
