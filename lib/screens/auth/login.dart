import 'dart:developer';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:odsa/helpers/colors.dart';
import 'package:odsa/screens/Dashboard.dart';
import 'package:odsa/screens/auth/guestlogin.dart';
import 'package:odsa/screens/auth/signup.dart';
import 'package:odsa/screens/auth/verifyemail.dart';
import 'package:odsa/widgets/backgrndimgappbr.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/user_apimodelpost1.dart';
import '../../core/alert/toaster.dart';
import '../../helpers/AlertBox.dart';
import 'forgotpassword.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  bool valuefirst = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final api = ApiProvider();
  bool isLoading = false;
  bool _isChecked = false;
  bool _isObscure = true;
  bool islogin = true;
  final _prefs = SharedPreferences.getInstance();
  _login(ApiProvider api) async {
    SharedPreferences prefs = await _prefs;
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      final resp = await api.signinapi(
        email.text,
        password.text,
        deviceType,
        deviceId,
      );
      print(resp);
      if (resp.status == true) {
        setState(() {
          isLoading = false;
        });
        if (resp.result?.userEmailVerified == true) {
          prefs.setBool("isLogin", true);
          prefs.setString("token", resp.result!.token.toString());
          prefs.setString("phone", resp.result!.phoneNo.toString());

          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const BottomNavBar()));
          showToast(context, resp.message.toString());

        } else {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => EmailOtp(
                    email: email.text,
                  )));
        }
      } else {
        setState(() {
          isLoading = false;
        });
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertBox(title:resp.message.toString());
            });
      }
    }
    // Future<void> saveUser(int id, String accessToken) async {
    //   SharedPreferences sharedPreferences =
    //       await SharedPreferences.getInstance();
    //   await sharedPreferences.setInt('user_id', id);
    //   await sharedPreferences.setString('token', deviceId);
    // }
    // else {
    //   setState(() {
    //     isLoading = false;
    //   });
    // }
  }

  @override
  void initState() {
    super.initState();
    getDeviceInfo();
    _loadUserEmailPassword();
  }

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  String deviceId = "";
  String deviceType = "";
  getDeviceInfo() async {
    if (Platform.isAndroid) {
      var deviceInfo = await deviceInfoPlugin.androidInfo;

      setState(() {
        deviceType = "1";
        deviceId = deviceInfo.androidId!;
      });
    } else if (Platform.isIOS) {
      var deviceInfo = await deviceInfoPlugin.iosInfo;

      setState(() {
        deviceType = "2";
        deviceId = deviceInfo.identifierForVendor!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Stack(children: [
          AppWidget(bgimg: "assets1/svg/signinbackground.png"),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Container(
                padding: const EdgeInsets.all(25),
                height: 605,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Form(
                    key: _formKey,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("Sign in",
                                style: GoogleFonts.quicksand(
                                  color: const Color(0xFF120D26),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )
                            ),
                          ),
                          const SizedBox(
                            height: 22
                          ),
                          Card(
                            elevation: _emailNode.hasFocus ? 3.0 : 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              obscureText: false,
                              controller: email,
                              focusNode: _emailNode,
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
                                errorBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1),
                                ),
                              ),
                              onTap: () => {
                                if (!currentFocus.hasPrimaryFocus)
                                  {currentFocus.unfocus()}
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Card(
                            elevation: _passwordNode.hasFocus ? 3.0 : 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              obscureText: _isObscure,
                              controller: password,
                              focusNode: _passwordNode,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 10),
                                  child: Image.asset(
                                    "assets1/svg/Lock.png",
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  color: darkPrimary,
                                  icon: Icon(_isObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                ),
                                hintText: "Your password",
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
                                errorBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1),
                                ),
                              ),
                              onTap: () => {
                                if (!currentFocus.hasPrimaryFocus)
                                  {currentFocus.unfocus()}
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Checkbox(
                                            activeColor: const Color(0xff00C8E8),
                                            value: _isChecked,
                                            onChanged: _handleRememberme),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: Container(
                                            child: Text("Remember Me",
                                                style: GoogleFonts.quicksand(
                                                  color: const Color(0xFF120D26),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgotPassword()))
                                    },
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "Forgot Password?",
                                        style: GoogleFonts.quicksand(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20
                          ),
                          GestureDetector(
                            onTap: () => {_login(api)},
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
                                      const Spacer(
                                        flex: 4,
                                      ),
                                      Text(
                                        "Sign In",
                                        style: GoogleFonts.quicksand(
                                          color: const Color(0xFFFFFFFF),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const Spacer(
                                        flex: 2,
                                      ),
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
                          const SizedBox(
                            height: 18,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sign in as a ",
                                  style: GoogleFonts.quicksand(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const GuestLogin()))
                                  },
                                  child: Text(
                                    "Guest.",
                                    style: GoogleFonts.quicksand(
                                      color: darkPrimary,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 100
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Dont't have an account? ",
                                    style: GoogleFonts.quicksand(
                                      color: darkPrimary,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )
                                ),
                                GestureDetector(
                                  onTap: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUp()
                                        )
                                    )
                                  },
                                  child: Text("Sign up",
                                      style: GoogleFonts.quicksand(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                      )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            ),
          )
        ]),
      ),
    );
  }

  void _handleRememberme(bool? value) {
    print("Handle Rember Me");
    _isChecked = value!;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', email.text);
        prefs.setString('password', password.text);
      },
    );
    setState(() {
      _isChecked = value;
    });
  }

  void _loadUserEmailPassword() async {
    log("Load Email");
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;

      log(_remeberMe.toString());
      log(_email);
      log(_password);
      if (_remeberMe) {
        setState(() {
          _isChecked = true;
        });
        email.text = _email;
        password.text = _password;
      }
    } catch (e) {
      print(e);
    }
  }
}
