import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odsa/helpers/colors.dart';
import 'package:odsa/screens/auth/verifyemail.dart';
import '../../API/user_apimodelpost1.dart';
import 'login.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController email = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final apiforgotpassword = ApiProvider();
  bool isLoading = false;
  forgot(ApiProvider apiforgotpassword) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      // var res = ApiSignUp().register(data, 'register_user');
      final resp = await apiforgotpassword.forgotpasswordapi(email.text);
      print(resp);
      if (resp.status == true) {
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext contex) => EmailOtp(
                  email: email.text,
                )));
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Container(
                // padding: EdgeInsets.symmetric(vertical: 5),
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
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignIn())),
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
                            "Forgot Password",
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
                    child: Stack(
                      children: [
                        ListView(
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 2, right: 2),
                                      child: Text(
                                          "Please enter your email address",
                                          style: GoogleFonts.quicksand(
                                            color: const Color(0xFF120D26),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                          )),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 2, right: 2),
                                      child: Text("to request a password",
                                          style: GoogleFonts.quicksand(
                                            color: Color(0xFF120D26),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Card(
                              elevation: _emailNode.hasFocus ? 3.0 : 0.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                focusNode: _emailNode,
                                obscureText: false,
                                controller: email,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 10),
                                    child: Image.asset(
                                      "assets1/svg/Message.png",
                                      height: 15.69,
                                      width: 17.63,
                                    ),
                                  ),
                                  hintText: "abc@gmail.com",
                                  hintStyle: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF747688),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: lightPrimary,
                                      )),
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Color(0xFFE4DFDF),
                                      )),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1),
                                  ),
                                ),
                                validator: (_emailvalid) {
                                  if (_emailvalid == null ||
                                      _emailvalid.isEmpty) {
                                    return 'Enter a valid Mail Id';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            GestureDetector(
                              onTap: () => {
                                forgot(apiforgotpassword),
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 52,
                                  right: 52,
                                ),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  elevation: 15.0,
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
                                          "            Send",
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

                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
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
                          ],
                        ),
                        isLoading
                            ? Align(
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(),
                              )
                            : Container()
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
