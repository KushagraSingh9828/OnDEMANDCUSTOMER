import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:odsa/API/user_apimodelpost1.dart';
import 'package:odsa/helpers/colors.dart';
import 'package:odsa/screens/auth/verifyemail.dart';

import 'package:odsa/widgets/backgrndimgappbr.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  final FocusNode _fullNameNode = FocusNode();
  final FocusNode _userNameNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _confirmPasswordNode = FocusNode();
  final FocusNode _phoneNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final api = ApiProvider();
  bool isLoading = false;
  bool _isObscure = true;
  bool _isObscure1 = true;
  late String onlyphone;
  late String isd;
  bool agree = false;

  _register(ApiProvider api) async {
    if (_formKey.currentState!.validate()) {
      if (agree == true) {
        setState(() {
          isLoading = true;
        });
        // var res = ApiSignUp().register(data, 'register_user');
        final resp = await api.signUp(
          _fullName.text,
          _userName.text,
          isd,
          onlyphone,
          _email.text,
          _password.text,
          _confirmpassword.text,
          deviceType,
          deviceId,
        );
        print(resp);
        if (resp.status == true) {
          setState(() {
            isLoading = false;
          });
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext contex) => EmailOtp(
                    email: _email.text,
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
      }
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(title: Text("Accept Terms and Conditions"));
          });
    }
  }

  @override
  void initState() {
    super.initState();
    getDeviceInfo();
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
          child: Stack(
        children: [
          AppWidget(bgimg: "assets1/svg/signinbackground.png"),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Container(
                padding: const EdgeInsets.all(25),
                // height: MediaQuery.of(context).size.height * 0.80,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Sign up",
                              style: GoogleFonts.quicksand(
                                color: const Color(0xFF120D26),
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Card(
                        elevation: _fullNameNode.hasFocus ? 3.0 : 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          obscureText: false,
                          controller: _fullName,
                          focusNode: _fullNameNode,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 10),
                              child: Image.asset(
                                "assets1/svg/Profile.png",
                                height: 15.69,
                                width: 17.63,
                              ),
                            ),
                            hintText: "Full name",
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
                              borderSide:
                                  BorderSide(width: 1, color: darkPrimary),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: lightPrimary,
                              ),
                            ),
                          ),
                          onTap: () => {
                            if (!currentFocus.hasPrimaryFocus)
                              {currentFocus.unfocus()}
                          },
                          validator: (_fullnamevalid) {
                            if (_fullnamevalid == null ||
                                _fullnamevalid.isEmpty) {
                              return 'Enter a valid name';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Card(
                        elevation: _userNameNode.hasFocus ? 3.0 : 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          obscureText: false,
                          controller: _userName,
                          focusNode: _userNameNode,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 10),
                              child: Image.asset(
                                "assets1/svg/Profile.png",
                                height: 15.69,
                                width: 17.63,
                              ),
                            ),
                            hintText: "User name",
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
                              borderSide:
                                   BorderSide(width: 1, color: darkPrimary),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: lightPrimary,
                              ),
                            ),
                          ),
                          onTap: () => {
                            if (!currentFocus.hasPrimaryFocus)
                              {currentFocus.unfocus()}
                          },
                          validator: (_usernamevalid) {
                            if (_usernamevalid == null ||
                                _usernamevalid.isEmpty) {
                              return 'Enter a valid name';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Card(
                        elevation: _emailNode.hasFocus ? 3.0 : 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          obscureText: false,
                          controller: _email,
                          focusNode: _emailNode,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 10),
                              child: Image.asset(
                                "assets1/svg/Message.png",
                                height: 15.69,
                                width: 17.63,
                              ),
                            ),
                            hintText: "Email address",
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
                              borderSide:
                                  BorderSide(width: 1, color: darkPrimary),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: lightPrimary,
                              ),
                            ),
                          ),
                          onTap: () => {
                            if (!currentFocus.hasPrimaryFocus)
                              {currentFocus.unfocus()}
                          },
                          validator: (_emailvalid) {
                            if (_emailvalid == null || _emailvalid.isEmpty) {
                              return 'Enter a valid Mail Id';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Card(
                        elevation: _passwordNode.hasFocus ? 3.0 : 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          obscureText: _isObscure,
                          controller: _password,
                          focusNode: _passwordNode,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 10),
                              child: Image.asset(
                                "assets1/svg/Lock.png",
                                //height: 15.69,
                                //width: 17.63,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: darkPrimary,
                              ),
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
                              borderSide:
                                  BorderSide(width: 1, color: darkPrimary),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: lightPrimary,
                              ),
                            ),
                          ),
                          onTap: () => {
                            if (!currentFocus.hasPrimaryFocus)
                              {currentFocus.unfocus()}
                          },
                          validator: (_passwordvalid) {
                            if (_passwordvalid == null ||
                                _passwordvalid.isEmpty) {
                              return 'Enter a valid Password';
                            } else if (_passwordvalid.length < 6) {
                              return 'Too short! Enter a minimum of 6 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Card(
                        elevation: _confirmPasswordNode.hasFocus ? 3.0 : 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          obscureText: _isObscure1,
                          controller: _confirmpassword,
                          focusNode: _confirmPasswordNode,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 10),
                              child: Image.asset(
                                "assets1/svg/Lock.png",
                                //height: 15.69,
                                //width: 17.63,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure1
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: darkPrimary,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure1 = !_isObscure1;
                                });
                              },
                            ),
                            hintText: "Confirm password",
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
                              borderSide:
                                  BorderSide(width: 1, color: darkPrimary),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: lightPrimary,
                              ),
                            ),
                          ),
                          onTap: () => {
                            if (!currentFocus.hasPrimaryFocus)
                              {currentFocus.unfocus()}
                          },
                          validator: (_confirmpasswordvalid) {
                            if (_confirmpasswordvalid == null ||
                                _confirmpasswordvalid.isEmpty) {
                              return 'Enter a valid Password';
                            } else if (_confirmpasswordvalid.length < 6 &&
                                _confirmpasswordvalid != _password) {
                              return 'Enter the same password as above';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Card(
                          elevation: _phoneNode.hasFocus ? 3.0 : 0.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: IntlPhoneField(
                            focusNode: _phoneNode,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(start: 10),
                                child: Image.asset(
                                  "assets1/svg/phone.png",
                                  //height: 15.69,
                                  //width: 17.63,
                                ),
                              ),
                              hintText: "Phone Number",
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
                                borderSide: BorderSide(
                                    width: 1, color: darkPrimary),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: lightPrimary,
                                ),
                              ),
                            ),
                            onTap: () => {
                              if (!currentFocus.hasPrimaryFocus)
                                {currentFocus.unfocus()}
                            },
                            validator: (_phonevalidate) {
                              if (_phonevalidate == null 
                                ) {
                                return 'Enter a valid number';
                              }
                              if (_phonevalidate.runtimeType is int == true) {
                                return 'Numbers Only*******';
                              }
                              return null;
                            },
                            initialCountryCode: 'IN',
                            onChanged: (phone) {
                              // print(phone.number);
                              // print(phone.countryCode);
                              setState(() {
                                onlyphone = phone.number;
                                isd = phone.countryCode;
                              });
                            },
                          )),
                      const SizedBox(
                        height: 22,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Container(
                                      height: 15,
                                      width: 15,
                                      child: Checkbox(
                                        onChanged: (newvalue) {
                                          setState(() {
                                            agree = newvalue!;
                                          });
                                        },
                                        value: agree,
                                      )),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text("Accept Terms and Conditions",
                                        style: GoogleFonts.quicksand(
                                          color: const Color(0xFF747688),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 44,
                      ),
                      GestureDetector(
                        onTap: () {
                          _register(api);
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
                                  const Spacer(
                                    flex: 5,
                                  ),
                                  Text(
                                    "Sign Up",
                                    style: GoogleFonts.quicksand(
                                      color: const Color(0xFFFFFFFF),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const Spacer(flex: 1),
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
                      const SizedBox(
                        height: 35,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account? ",
                                style: GoogleFonts.quicksand(
                                  color: darkPrimary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )),
                            GestureDetector(
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignIn()))
                              },
                              child: Text("Sign in",
                                  style: GoogleFonts.quicksand(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          isLoading
              ? const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )
              : Container(),
        ],
      )),
    );
  }
}
