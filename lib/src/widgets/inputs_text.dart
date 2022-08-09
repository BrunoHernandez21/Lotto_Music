import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputsText {
  static Widget classic({
    TextEditingController? controller,
    TextInputType textType = TextInputType.text,
    String hintText = "",
    bool obscure = false,
    bool editable = true,
    Widget? icon,
    int? maxLines,
    int? maxLength,
    void Function(String)? onChanged,
  }) {
    return _InputText(
      controller: controller,
      hintText: hintText,
      editable: editable,
      icon: icon,
      obscure: obscure,
      onChanged: onChanged,
      textType: textType,
      maxLenght: maxLength,
      maxLines: maxLines,
    );
  }

  static Widget box({
    TextEditingController? controller,
    TextInputType textType = TextInputType.text,
    String hintText = "",
    bool obscure = false,
    bool editable = true,
    Widget? icon,
    int? maxLines,
    int? maxLength,
    String? labelText,
    TextAlign? textAlign,
    List<TextInputFormatter>? inputsFormatter,
    void Function(String)? onChanged,
  }) {
    return _InputTextBox(
      controller: controller,
      hintText: hintText,
      editable: editable,
      icon: icon,
      obscure: obscure,
      onChanged: onChanged,
      textType: textType,
      maxLenght: maxLength,
      maxLines: maxLines = 1,
      labelText: labelText,
      textAlign: textAlign,
      inputsFormatter: inputsFormatter,
    );
  }
}

class _InputTextBox extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType textType;
  final String hintText;
  final bool obscure;
  final bool editable;
  final Widget? icon;
  final int? maxLines;
  final int? maxLenght;
  final String? labelText;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputsFormatter;
  final void Function(String)? onChanged;

  const _InputTextBox(
      {this.controller,
      required this.hintText,
      this.textType = TextInputType.text,
      this.icon,
      this.obscure = false,
      this.editable = true,
      this.onChanged,
      this.maxLenght,
      this.maxLines,
      this.textAlign,
      this.labelText,
      this.inputsFormatter});

  @override
  State<_InputTextBox> createState() => _InputTextBoxState();
}

class _InputTextBoxState extends State<_InputTextBox> {
  bool isOscure = false;
  bool init = true;

  @override
  Widget build(BuildContext context) {
    if (init) {
      init = false;
      if (widget.obscure) {
        isOscure = true;
      }
    }
    return TextField(
      enabled: widget.editable,
      obscureText: isOscure,
      maxLines: widget.maxLines,
      maxLength: widget.maxLenght,
      controller: widget.controller,
      keyboardType: widget.textType,
      inputFormatters: widget.inputsFormatter,
      textAlign: widget.textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        prefixIcon: widget.icon != null
            ? Container(
                margin: const EdgeInsets.only(left: 2, right: 4),
                height: 56,
                decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Color(0xDEDEDEFF),
                        width: 1,
                      ),
                    ),
                    color: Color(0xFFFAFAFA)),
                child: widget.icon,
              )
            : null,
        suffixIcon: widget.obscure
            ? (isOscure
                ? IconButton(
                    icon: const Icon(
                      Icons.visibility_off,
                      color: Color.fromARGB(255, 192, 189, 189),
                    ),
                    onPressed: () {
                      isOscure = !isOscure;
                      setState(() {});
                    },
                  )
                : IconButton(
                    icon: const Icon(
                      Icons.visibility,
                      color: Color.fromARGB(255, 95, 94, 94),
                    ),
                    onPressed: () {
                      isOscure = !isOscure;
                      setState(() {});
                    },
                  ))
            : null,
        hintText: widget.hintText,
        labelText: widget.labelText,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(
            width: 1.5,
            color: Color(0xFFDEDEDE),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(
            width: 2,
            color: Color.fromARGB(255, 0, 255, 255),
          ),
        ),
      ),
      autofocus: false,
      onChanged: widget.onChanged,
    );
  }
}

class _InputText extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType textType;
  final String hintText;
  final bool obscure;
  final bool editable;
  final Widget? icon;
  final int? maxLines;
  final int? maxLenght;
  final void Function(String)? onChanged;

  const _InputText(
      {this.controller,
      required this.hintText,
      this.textType = TextInputType.text,
      this.icon,
      this.obscure = false,
      this.editable = true,
      this.onChanged,
      this.maxLenght,
      this.maxLines});

  @override
  State<_InputText> createState() => _InputTextState();
}

class _InputTextState extends State<_InputText> {
  bool isOscure = false;
  bool init = true;
  @override
  Widget build(BuildContext context) {
    if (init) {
      init = false;
      if (widget.obscure) {
        isOscure = true;
      }
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: TextField(
        enabled: widget.editable,
        obscureText: isOscure,
        maxLength: widget.maxLenght,
        maxLines: widget.maxLines,
        controller: widget.controller,
        keyboardType: widget.textType,
        style: TextStyle(color: Colors.grey.shade700),
        decoration: InputDecoration(
          suffixIcon: widget.obscure
              ? (isOscure
                  ? IconButton(
                      icon: const Icon(Icons.visibility_off),
                      onPressed: () {
                        isOscure = !isOscure;
                        setState(() {});
                      },
                    )
                  : IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () {
                        isOscure = !isOscure;
                        setState(() {});
                      },
                    ))
              : null,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              width: 1.5,
              color: Color(0xFFDEDEDE),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              width: 1.5,
              color: Color.fromARGB(255, 0, 238, 255),
            ),
          ),
        ),
        autofocus: false,
        onChanged: widget.onChanged,
      ),
    );
  }
}
