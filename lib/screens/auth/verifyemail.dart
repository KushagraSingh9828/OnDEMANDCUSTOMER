import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odsa/helpers/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../API/user_apimodelpost1.dart';
import 'forgotpassword.dart';
import 'login.dart';

class EmailOtp extends StatefulWidget {
  final String email;

  EmailOtp({Key? key, required this.email}) : super(key: key);

  @override
  _EmailOtpState createState() => _EmailOtpState();
}

class _EmailOtpState extends State<EmailOtp> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  String currentText = "";
  bool isLoading = false;
  final api = ApiProvider();
  final resend = ForgotPassword();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  forgot(ApiProvider api) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      final resp = await api.otpapi(widget.email, textEditingController.text);
      print(resp);
      if (resp.status == true) {
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext contex) => SignIn()));
      } else {
        setState(() {
          isLoading = false;
        });
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(title: Text(resp.message.toString()));
            });
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  _resend(ApiProvider api) async {
    final resp = await api.resendapi(
      widget.email,
    );
    print(resp);
    if (resp.status == true) {
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(title: Text(resp.message.toString()));
          });
    }
  }

  _code(ApiProvider api) async {
    if (_formKey.currentState != null) {
      setState(() {
        isLoading = true;
      });

      // var res = ApiSignUp().register(data, 'register_user');
      final resp = await api.forgotpasswordapi(
        widget.email,
      );
      print(resp);
      if (resp.status == false) {
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext contex) => SignIn()));
      } else {
        setState(() {
          isLoading = false;
        });
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(title: Text(resp.message.toString()));
            });
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.40,
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("assets1/svg/signinbackground.png"),
                    fit: BoxFit.fill)),
            child: Container(
                margin: EdgeInsets.only(
                  top: 50,
                ),
                height: 70,
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Flexible(
                            child: Image.asset(
                              "assets1/svg/arrowleft.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Text(
                        "Verify User",
                        style: GoogleFonts.quicksand(
                          color: Color(0xFF1B1B1B),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                )),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(25),
              height: MediaQuery.of(context).size.height * 0.80,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Form(
                key: _formKey,
                child: Stack(children: [
                  ListView(
                    children: <Widget>[
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 2, right: 2),
                              child: Center(
                                child: Text(
                                    "Enter the 4-Digit code sent to you at",
                                    style: GoogleFonts.quicksand(
                                      color: const Color(0xFF120D26),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 2, right: 2),
                              child: Text(widget.email,
                                  style: GoogleFonts.quicksand(
                                    color: darkPrimary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 60, right: 60),
                            child: PinCodeTextField(
                              appContext: context,
                              pastedTextStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),

                              length: 4,
                              

                              blinkWhenObscuring: true,
                              animationType: AnimationType.fade,
                              validator: (v) {
                                if (v!.length < 3) {
                                  return "";
                                } else {
                                  return null;
                                }
                              },
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.underline,
                                fieldHeight: 70,
                                fieldWidth: 40,
                                borderWidth: 1,
                                inactiveColor: Colors.grey,
                                activeFillColor: darkPrimary,
                              ),
                              cursorColor: darkPrimary,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              enableActiveFill: false,
                              errorAnimationController: errorController,
                              controller: textEditingController,
                              keyboardType: TextInputType.number,

                              onCompleted: (v) {},

                              onChanged: (value) {
                                // print(value);
                                setState(() {
                                  currentText = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 52,
                              right: 52,
                            ),
                            child: Flexible(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 15.0,
                                child: GestureDetector(
                                  onTap: () => {forgot(api)},
                                  child: Container(
                                    height: 58,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            darkPrimary,
                                            lightPrimary
                                          ]),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(),
                                        Text(
                                          "            Continue",
                                          style: GoogleFonts.quicksand(
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        // SizedBox(
                                        //   width: 5,
                                        // ),

                                        TextButton(
                                          onPressed: () {},
                                          child: Image.asset(
                                            "assets1/svg/signin.png",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Didn't receive code? ",
                                  style: GoogleFonts.quicksand(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => {
                                    _resend(api),
                                  },
                                  child: Text(
                                    "Resend Again.",
                                    style: GoogleFonts.quicksand(
                                      color: Color(0xff000000),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ]),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
