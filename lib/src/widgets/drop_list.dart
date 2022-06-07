import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/shaderPreferences/shaderpreferences_bloc.dart';

class DropListButton extends StatefulWidget {
  final List<String> items;
  final String? init;
  final void Function(String?)? onChange;
  const DropListButton({
    required this.items,
    required this.init,
    this.onChange,
    Key? key,
  }) : super(key: key);

  @override
  State<DropListButton> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<DropListButton> {
  String? value = '';
  List<DropdownMenuItem<String>> inputs = [];

  @override
  Widget build(BuildContext context) {
    if (inputs.isEmpty) {
      inputs = drops(widget.items);
      value = widget.init;
    }
    final themeData =
        BlocProvider.of<ShaderpreferencesBloc>(context).state.themeData;
    return DropdownButton<String>(
      value: value,
      isExpanded: true,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: TextStyle(
        color: themeData.textTheme.titleMedium?.color,
      ),
      underline: Container(
        height: 2,
        color: themeData.textTheme.titleMedium?.color,
      ),
      onChanged: (String? newValue) {
        value = newValue!;
        if (widget.onChange != null) widget.onChange!(value);
        setState(() {});
      },
      items: inputs,
    );
  }

  List<DropdownMenuItem<String>> drops(List<String> inputs) {
    return inputs.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
}
