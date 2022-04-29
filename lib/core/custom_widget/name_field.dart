import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class NameField extends StatefulWidget {
  String placeHolderTxt;
  String initialValue;
  ValueChanged<String> onChanged;

  NameField({
    Key? key,
    required this.placeHolderTxt,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      suffixIcon: Icon(IconData(0xe743, fontFamily: 'MaterialIcons')),
      placeHolderTxt: widget.placeHolderTxt,
      initialValue: widget.initialValue,
      keyboardType: TextInputType.name,
      onChanged: widget.onChanged,
    );
  }
}
