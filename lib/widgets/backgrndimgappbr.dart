import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  String  bgimg;
  AppWidget({Key? key, required this.bgimg}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(255),
      child: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          height: MediaQuery.of(context).size.height ,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.bgimg), fit: BoxFit.fill),
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(
                top: 50,
              ),
              height: 70,
              width: double.infinity,
              child: Image.asset(
                "assets1/svg/logo.png",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
