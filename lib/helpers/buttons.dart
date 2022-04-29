import 'package:flutter/material.dart';
import 'package:odsa/helpers/colors.dart';

class VisibiliyButton extends StatefulWidget {
  bool obscurefun;

  VisibiliyButton({Key? key, required this.obscurefun}) : super(key: key);

  @override
  State<VisibiliyButton> createState() => _VisibiliyButtonState();
}

class _VisibiliyButtonState extends State<VisibiliyButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        widget.obscurefun ? Icons.visibility_off : Icons.visibility,
        color: darkPrimary,
      ),
      onPressed: () {
        setState(() {
          widget.obscurefun = !widget.obscurefun;
        });
      },
    );
  }
}
