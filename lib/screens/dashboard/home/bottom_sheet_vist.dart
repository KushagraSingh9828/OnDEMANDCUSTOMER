import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:odsa/helpers/AlertBox.dart';
import 'package:odsa/screens/dashboard/home/user_visit_confirm.dart';
import 'package:odsa/API/user_apimodelpost1.dart';
import '../../../core/alert/toaster.dart';
import '../../../helpers/apptext_medium.dart';
import '../../../helpers/colors.dart';

class Bottom_Sheet_Vist extends StatefulWidget {
  final idNumber;
  const Bottom_Sheet_Vist({Key? key,required this.idNumber}) : super(key: key);
  @override
  State<Bottom_Sheet_Vist> createState() => _Bottom_Sheet_VistState();
}

class _Bottom_Sheet_VistState extends State<Bottom_Sheet_Vist> {
  late String onlyphone;
  late String isd;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final visitapi = ApiProvider();
  bool isLoading = false;
  final sId="624ecb7868af7170cab2cb99";
  _visit(ApiProvider visitAipCall ) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      // var res = ApiSignUp().register(data, 'register_user');
      final resp = await visitapi.visitAipCall(
        nameController.text,
        isd.toString(),
        phoneController.text,
          addressController.text,
          sId.toString()
      );
      if (resp.status == true) {
        setState(() {
          isLoading = false;
        });
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const Vist_Confirm()), (route) => false);
        showToast(context, resp.message.toString());
      }
      else {
        setState(() {
          log(phoneController.text);
          isLoading = false;
        });
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertBox(title: resp.message.toString());
            });
      }
    }
  }
  @override
  Widget build(BuildContext context) {

    final FocusNode _phoneNode = FocusNode();
    final FocusNode _fullNameNode = FocusNode();
    final FocusNode _addressnode = FocusNode();
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final FocusScopeNode currentFocus = FocusScope.of(context);
    return Padding(
      padding: mediaQueryData.viewInsets,
      child: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          height: 470,
          width: double.maxFinite,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30))),
          child: Form(
            key:_formKey,
            child: ListView(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Card(
                        elevation: _fullNameNode.hasFocus ? 3.0 : 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: nameController,
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
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        elevation: _phoneNode.hasFocus ? 3.0 : 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: IntlPhoneField(
                          controller: phoneController,
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
                            counterText: "",
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
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            // print(phone.number);
                            // print(phone.countryCode);
                            setState(() {
                              onlyphone = phone.number;
                              isd = phone.countryCode;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Card(
                        elevation: _addressnode.hasFocus ? 3.0 : 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: addressController,
                          minLines: 4,
                          maxLines: 8,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding:
                              const EdgeInsetsDirectional.only(start:0,bottom:50),
                              child: Image.asset(
                                "assets1/svg/adress.png",
                                height: 15.69,
                                width: 17.63,
                              ),
                            ),
                            hintText: "Address",
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
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22, right: 22),
                          child: Container(
                            height: 58,
                            width: 271,
                            decoration: BoxDecoration(
                                color: const Color(0xffDDB149),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: AppText_medium(
                              size: 16,
                              text: "Submit",
                              color: Colors.white,
                            )),
                          ),
                        ),
                       onTap: ()=> {_visit(visitapi)}
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
