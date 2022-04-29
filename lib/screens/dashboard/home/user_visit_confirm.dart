import 'package:flutter/material.dart';
import 'package:odsa/helpers/apptext_bold.dart';
import 'package:odsa/helpers/apptext_medium.dart';
import 'package:odsa/helpers/colors.dart';
import 'package:odsa/screens/dashboard/home/user_bookingForm.dart';

import '../../../helpers/apptext.dart';

class Vist_Confirm extends StatefulWidget {
  const Vist_Confirm({Key? key}) : super(key: key);

  @override
  State<Vist_Confirm> createState() => _Vist_ConfirmState();
}

class _Vist_ConfirmState extends State<Vist_Confirm> {
  final int _starvalue = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
                child: Container(
                  height: 800,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(color: Colors.white),
                )
            ),
            Positioned(
                child: Container(
                    height: 330,
                    width: 440,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets1/svg/vistdemoimg.png"),
                            fit: BoxFit.cover))
                )
            ),
            Positioned(
                top: 20,
                left: 15,
                child: GestureDetector(
                  child: Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      child: const Center(child: const Icon(Icons.arrow_back))),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                )),
            Positioned(
                top: 340,
                left: 20,
                right: 20,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 277,
                          child: AppText_bold(
                            size: 16,
                            text: "The Ultima, an extra-large Vitrified Slabs",
                          )),
                      const SizedBox(height: 6),
                      SizedBox(
                          width: 180,
                          child: AppText_medium(
                              size: 12,
                              text: "Hughlan Workspaces",
                              color: Colors.grey)),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          AppText(size: 12, text: "4.8"),
                          const SizedBox(width: 6),
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(Icons.star,
                                  size: 12,
                                  color: index < _starvalue
                                      ? const Color(0xFFe7bb4e)
                                      : Colors.transparent);
                            }),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Container(
                        width: 335,
                        height: 194,
                        decoration: BoxDecoration(
                            color: HexColor("#EEEEEE"),
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, blurRadius: 1)
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Padding(
                            padding:
                            const EdgeInsets.only(left: 7.47, right: 7.47),
                            child: SizedBox(
                              height: 174,
                              width: 320,
                              child: AppText(
                                size: 15,
                                text: "Lorem ipsum dolor sit amet, "
                                    "consectetur adipiscing elit. Phasellus sit"
                                    " amet pharetra erat, ut feugiat sapien."
                                    " Donec scelerisque enim mauris, quis"
                                    " accumsan libero dignissim a. Praesent"
                                    " maximus vehicula libero, eget convallis purus pellentesque et. Nam ornare, enim at porttitor vulputate, sem sem blandit nisi, et hendrerit velit libero non eros. Donec facilisis, libero ut pellentesque convallis, quam leo posuere augue"
                                    ", vel finibus dui diam a eros.",
                                color: HexColor("#555657"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 31,
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22, right: 22),
                          child: Container(
                            height: 58,
                            width: 271,
                            decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xffDDB149)),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: AppText_medium(
                                  size: 16,
                                  text: "Visit Done ",
                                  color: const Color(0xffDDB149),
                                )),
                          ),
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22, right: 22),
                          child: Container(
                            height: 58,
                            width: 271,
                            decoration: BoxDecoration(
                              color:const Color(0xffDDB149),
                                border: Border.all(
                                    color: const Color(0xffDDB149), width: 2),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: AppText_medium(
                                  size: 16,
                                  text: "Book Now",
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> const Booking())
                         );
                        },
                      )
                    ]))
          ],
        ),
      ),
    );
  }
}
