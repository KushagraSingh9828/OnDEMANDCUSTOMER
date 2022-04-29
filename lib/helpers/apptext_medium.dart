import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppText_medium extends StatelessWidget {
  double size;
  final Color color;
  final String text;
  AppText_medium({Key? key,
    required this.size,
    required this.text,
    this.color=Colors.black,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: TextStyle(
      color: color,
      fontSize: size,
      fontFamily: 'Quicksand',
      fontWeight: FontWeight.w500,
    ),
    );
  }
}
