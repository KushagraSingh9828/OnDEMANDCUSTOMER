import 'package:flutter/material.dart';

import '../constant/size_constant.dart';


class AppLoader extends StatelessWidget {

  AppLoader({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        color: Colors.black45,
        width: screenWidth(context),
        height: screenHeight(context),
        child: Center(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Container(
              color: Colors.black,
              height: 70,
              width: 220,
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  const SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(
                        color: Color(0xffDDB149),
                        strokeWidth: 2,
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Loading",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
