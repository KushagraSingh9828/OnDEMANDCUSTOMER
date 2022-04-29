import 'package:flutter/material.dart';
import 'package:odsa/helpers/apptext_medium.dart';
import 'package:odsa/helpers/colors.dart';

import '../../../helpers/apptext.dart';

class History_Order extends StatefulWidget {
  const History_Order({Key? key}) : super(key: key);

  @override
  State<History_Order> createState() => _History_OrderState();
}

class _History_OrderState extends State<History_Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffDDB149),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.white)),
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: AppText_medium(
            size: 18,
            text: "Order History",
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 22),
            child: Container(
              decoration: BoxDecoration(
                  color: HexColor("#F6F6F6"),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: kElevationToShadow[3]),
              height: 124,
              width: 335,
              child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 9),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: kElevationToShadow[2]),
                      child: Center(
                        child: Container(
                          height: 77.96,
                          width: 74,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage("assets1/svg/bg.png"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      height: 83.96,
                      width: 80,
                    ),
                    SizedBox(
                      width: 21,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText_medium(size: 16, text: "Service 1"),
                          SizedBox(height: 4),
                          AppText(
                            size: 13,
                            text: "Wed, Apr 28 • 5:30 PM",
                            color: HexColor("#979797"),
                          ),
                          SizedBox(height: 4),
                          AppText_medium(size: 12, text: "Kajaria Ceramics Ltd."),
                          SizedBox(height: 4),
                          AppText(
                              size: 9,
                              text: "Digital Floor Tiles, Thickness: 5-10 mm")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 21),
          Container(
            width: 335,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: HexColor("#E4DFDF")),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  AppText_medium(
                      size: 12, text: "Download Invoice"),
                  GestureDetector(
                    child: Container(
                      width: 17.88,
                      height: 22.75,
                      decoration: BoxDecoration(image: DecorationImage(image:AssetImage("assets1/svg/pdf.png"),fit: BoxFit.cover)),
                    ),
                    onTap: (){},
                  )
                ]
              ),
            ),
          )
        ],
      ),
    );
  }
}
