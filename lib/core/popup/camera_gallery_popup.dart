import 'package:flutter/material.dart';

class CameraGallaryPopup extends StatefulWidget {
  const CameraGallaryPopup({Key? key}) : super(key: key);

  @override
  State<CameraGallaryPopup> createState() => _CameraGallaryPopupState();
}

class _CameraGallaryPopupState extends State<CameraGallaryPopup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Choose Option!",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 100,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffFFFFFF)),
              height: 50,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop("1");
                },
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  textStyle: const TextStyle(fontSize: 17),
                ),
                child: const Text('Camera'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 100,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffFFFFFF)),
              height: 50,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop("2");
                },
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 17),
                  primary: Colors.black, // Text Color
                ),
                child: const Text('Gallery'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 100,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffFFFFFF)),
              height: 50,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 17),
                  primary: const Color.fromARGB(255, 216, 0, 0), // Text Color
                ),
                child: const Text('Cancel'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
