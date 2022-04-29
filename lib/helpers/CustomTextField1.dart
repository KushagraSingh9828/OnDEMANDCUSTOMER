import 'dart:developer';

import 'package:flutter/material.dart';

class CustomTextField1 extends StatefulWidget {
  String? placeholder = "";
  String? defaultTxt = "";
  String? icon = "";
  final ValueChanged<String> onChanged;
  final bool manageBg = false;

  CustomTextField1(
      {
    Key? key,
    this.placeholder,
    this.defaultTxt,
    this.icon,
    required this.onChanged,
  }
  ) : super(key: key);

  @override
  State<CustomTextField1> createState() => _CustomTextField1State();
}

class _CustomTextField1State extends State<CustomTextField1> {
  final FocusNode _focus = FocusNode();
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
    setState(() {
      manageBg = !manageBg;
    });

    log(_focus.hasFocus.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Card(
          elevation: _focus.hasFocus == true ? 5.0 : 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: TextField(
            onChanged: widget.onChanged,
            controller: widget.defaultTxt?.length != 0
                ? TextEditingController.fromValue(TextEditingValue(
                    text: (widget.defaultTxt ?? ""),
                    selection: TextSelection.collapsed(
                        offset: (widget.defaultTxt ?? "").length)))
                : TextEditingController(),
            focusNode: _focus,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(start: 13, end: 13),
                child: Image.asset(
                  widget.icon ?? "",
                  height: 15.69,
                  width: 17.63,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Color(0xFFFBD57D), width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey, width: 1),
              ),
              hintText: widget.placeholder,
            ),
          )),
    );
  }
}
