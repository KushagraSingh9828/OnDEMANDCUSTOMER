import 'package:flutter/material.dart';
import 'package:odsa/core/constant/font_style.dart';

class Button extends StatelessWidget {
  final String title;
  final GestureTapCallback onPressed;
  double? width;

  Button(
      {Key? key,
      this.width = 100,
      this.title = "Button",
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 20),
              blurRadius: 12,
              color: Color.fromARGB(40, 62, 60, 60),
            )
          ],
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffDDB149), Color(0xffFBD57D)]),
        ),
        height: 55,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(title, style: headingStyle.copyWith(color: Colors.white)),
          const SizedBox(
            width: 10,
          ),
        ]),
      ),
    );
  }
}
