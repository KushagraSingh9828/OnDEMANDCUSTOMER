import 'dart:developer';
import 'package:flutter/material.dart';
import '../constant/app_color.dart';

class CustomTextField extends StatefulWidget {
  final String? placeHolderTxt;
  final String? initialValue;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final bool manageBg = false;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    this.suffixIcon,
    this.placeHolderTxt,
    this.initialValue,
    required this.onChanged,
    required this.keyboardType,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode _focus = FocusNode();
  bool manageBg = false;

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    setState(() {});
    log(_focus.hasFocus.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white,
      child: TextFormField(
        cursorColor: blackColor,
        focusNode: _focus,
        keyboardType: widget.keyboardType,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            suffixIcon: widget.suffixIcon,
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
