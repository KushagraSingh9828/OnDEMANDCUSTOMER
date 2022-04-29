import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors.dart';



class AlertBox extends StatefulWidget {
  const AlertBox({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _AlertBoxState createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  final _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: const Color(0xffffffff),
      shape: RoundedRectangleBorder(
          // borderRadius: BorderRadius.circular(10.0),
          ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          const Text(
            "Alert",
            style: TextStyle(
                // color: darkPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          const Divider(
            height: 1,
            color: darkPrimary,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 25),
            child: Center(
              child: Text(
                "${widget.title}",
                style: const TextStyle(
                    color: Color.fromARGB(255, 41, 40, 40), fontSize: 17),
              ),
            ),
          ),
          const Divider(
            height: 1,
            color: darkPrimary,
          ),
          Flexible(
            child: Container(
              color: lightPrimary,
              height: 58,
              child: InkWell(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
                highlightColor: Colors.grey[200],
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Center(
                  child: Text(
                    "Ok",
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
