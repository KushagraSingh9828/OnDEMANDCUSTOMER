import 'package:flutter/material.dart';

import 'colors.dart';




class AlertDialogTwoBtn extends StatefulWidget {
  String btnOne;
  String btnTwo;
  Function() tapOnFirst;
  Function() tapOnSecond;

  AlertDialogTwoBtn({
    Key? key,
    required this.btnOne,
    required this.btnTwo,
    required this.tapOnFirst,
    required this.tapOnSecond,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _AlertDialogTwoBtnState createState() => _AlertDialogTwoBtnState();
}

class _AlertDialogTwoBtnState extends State<AlertDialogTwoBtn> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: const Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: darkPrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Divider(
            height: 1,
            color: darkPrimary,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                "Are You Sure to you want to Logout?",
                style: TextStyle(color: Color(0xff979797), fontSize: 17),
              ),
            ),
          ),
          const Divider(
            height: 1,
            color: darkPrimary,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
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
                      child: Center(
                        child: Text(
                          widget.btnOne,
                          style: const TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const SizedBox(
                    width: 1,
                  ),
                ),
                Flexible(
                  child: Container(
                    height: 58,
                    color: lightPrimary,
                    child: InkWell(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      ),
                      highlightColor: Colors.grey[200],
                      onTap: widget.tapOnSecond,
                      child: Center(
                        child: Text(
                          widget.btnTwo,
                          style: const TextStyle(
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
          ),
        ],
      ),
    );
  }
}
