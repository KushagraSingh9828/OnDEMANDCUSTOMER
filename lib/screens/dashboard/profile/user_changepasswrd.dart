import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odsa/core/loader/app_loader.dart';
import 'package:odsa/helpers/AlertBox.dart';
import 'package:odsa/helpers/colors.dart';

import '../../../API/user_apichngpsd.dart';
import '../../auth/login.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  final FocusNode _oldPasswordNode = FocusNode();
  final FocusNode _newPasswordNode = FocusNode();
  final FocusNode _confirmPasswordNode = FocusNode();
  bool _isObscurepassword = true;
  bool _isObscurenewpassword = true;
  bool _isObscureconfirmpassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final changeapi = ChangeApiProvider();
  bool isLoading = false;
  _change(ChangeApiProvider changeapi) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      // var res = ApiSignUp().register(data, 'register_user');
      final resp = await changeapi.changePassword(
        oldPassword.text,
        newPassword.text,
        confirmPassword.text,
      );
      print(resp);
      if (resp.status == true) {
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext contex) => const SignIn()));
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
  }

  @override
  Widget build(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    // void showLogOutDialogue(BuildContext context) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return CustomAlertDialog(
    //         title: 'Confirmation',
    //       );
    //     },
    //   );
    // }

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: PreferredSize(
          preferredSize: const Size.fromHeight(102.89),
          child: Container(
            height: 102.89,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [darkPrimary, lightPrimary]),
            ),
            child: SafeArea(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Container(
                    //   child: Image.asset("assets1/svg/whitearrowleft.png"),
                    // ),
                    Text(
                      "Change Password",
                      style: GoogleFonts.quicksand(
                        color: const Color(0xFFFFFFFF),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: isLoading
            ?  Center(
                child: AppLoader())
            : Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 13, right: 13),
                      child: Card(
                        elevation: _oldPasswordNode.hasFocus ? 3.0 : 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          obscureText: _isObscurepassword,
                          controller: oldPassword,
                          focusNode: _oldPasswordNode,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 10),
                              child: Image.asset(
                                "assets1/svg/Lock.png",
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscurepassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: darkPrimary,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscurepassword = !_isObscurepassword;
                                });
                              },
                            ),
                            hintText: "Old Password",
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
                              borderSide: BorderSide(width: 1),
                            ),
                          ),
                          onTap: () => {
                            if (!currentFocus.hasPrimaryFocus)
                              {currentFocus.unfocus()}
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 13),
                      child: Card(
                        elevation: _newPasswordNode.hasFocus ? 3.0 : 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          obscureText: _isObscurenewpassword,
                          controller: newPassword,
                          focusNode: _newPasswordNode,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 10),
                              child: Image.asset(
                                "assets1/svg/Lock.png",
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscurenewpassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: darkPrimary,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscurenewpassword =
                                      !_isObscurenewpassword;
                                });
                              },
                            ),
                            hintText: "New Password",
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
                              borderSide: BorderSide(width: 1),
                            ),
                          ),
                          onTap: () => {
                            if (!currentFocus.hasPrimaryFocus)
                              {currentFocus.unfocus()}
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 13, right: 13),
                      child: Card(
                        elevation: _confirmPasswordNode.hasFocus ? 3.0 : 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          obscureText: _isObscureconfirmpassword,
                          controller: confirmPassword,
                          focusNode: _confirmPasswordNode,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 10),
                              child: Image.asset(
                                "assets1/svg/Lock.png",
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscureconfirmpassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: darkPrimary,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscureconfirmpassword =
                                      !_isObscureconfirmpassword;
                                });
                              },
                            ),
                            hintText: "Confirm Password",
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
                              borderSide: BorderSide(width: 1),
                            ),
                          ),
                          onTap: () => {
                            if (!currentFocus.hasPrimaryFocus)
                              {currentFocus.unfocus()}
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () => {_change(changeapi)},
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(),
                                Text(
                                  "Change Password",
                                  style: GoogleFonts.quicksand(
                                    color: const Color(0xFFFFFFFF),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
