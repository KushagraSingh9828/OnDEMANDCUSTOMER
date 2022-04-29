import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class EmailField extends StatefulWidget {
  String placeHolderTxt;
  String initialValue;
  ValueChanged<String> onChanged;

  EmailField({
    Key? key,
    required this.placeHolderTxt,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      suffixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
      placeHolderTxt: widget.placeHolderTxt,
      initialValue: widget.initialValue,
      keyboardType: TextInputType.emailAddress,
      onChanged: widget.onChanged,
    );
  }
}
