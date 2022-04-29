import 'package:flutter/material.dart';

import '../constant/app_color.dart';
import 'custom_text_field.dart';

class PasswordField extends StatefulWidget {
  String placeHolderTxt;
  ValueChanged<String> onChanged;

  PasswordField({
    Key? key,
    required this.placeHolderTxt,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white,
      child: TextFormField(
        cursorColor: blackColor,
        obscureText: _obscureText,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Color.fromARGB(255, 97, 92, 92)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(137, 36, 35, 35)),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(137, 36, 35, 35)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            hintText: widget.placeHolderTxt),
        onChanged: widget.onChanged,
      ),
    );
  }
}
