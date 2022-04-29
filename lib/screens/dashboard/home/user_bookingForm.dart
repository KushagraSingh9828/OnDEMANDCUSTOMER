// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../API/user_apimodelpost1.dart';
import '../../../helpers/apptext_bold.dart';
import '../../../helpers/colors.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  var _selectedValue;
  final List<int> _numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final FocusNode _fullNameNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _phoneNode = FocusNode();
  final FocusNode _areaNode = FocusNode();
  final FocusNode _addressNode = FocusNode();
  final FocusNode _photoNode = FocusNode();
  bool isSelected = false;
  bool totalPicture = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bookingApi = ApiProvider();
  bool isLoading = false;

  _booking(ApiProvider visitAipCall) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      // var res = ApiSignUp().register(data, 'register_user');
      // final resp = await visitapi.visitAipCall(
      //     nameController.text,
      //     isd.toString(),
      //     phoneController.text,
      //     addressController.text,
      //     widget.idNumber.toString()
      // );
      // if (resp.status == true) {
      //   setState(() {
      //     isLoading = false;
      //   });
      //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const Vist_Confirm()), (route) => false);
      // }
      // else {
      //   setState(() {
      //     log(phoneController.text);
      //     isLoading = false;
      //   });
      //   showDialog(
      //       context: context,
      //       builder: (BuildContext context) {
      //         return AlertBox(title: resp.message.toString());
      //       });
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.40,
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets1/svg/signinbackground.png"),
                      fit: BoxFit.fill)),
              child: Container(
                  margin: const EdgeInsets.only(
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
                            onTap: () => Navigator.of(context).pop(),
                            child: Flexible(
                              child: Image.asset(
                                "assets1/svg/arrowleft.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppText_bold(
                        text: "Booking",
                        size: 24,
                      )
                    ],
                  )),
            ),
            Positioned(
              top: 150,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(25),
                height: MediaQuery.of(context).size.height * 0.80,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
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
                              borderSide: BorderSide(width: 1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
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
                              borderSide: BorderSide(width: 1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Card(
                        elevation: _phoneNode.hasFocus ? 3.0 : 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          obscureText: false,
                          controller: _phone,
                          focusNode: _phoneNode,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 10),
                              child: Image.asset(
                                "assets1/svg/phone.png",
                                height: 15.69,
                                width: 17.63,
                              ),
                            ),
                            hintText: "Phone number",
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
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Card(
                        elevation: _areaNode.hasFocus ? 3.0 : 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonFormField(
                          focusNode: _areaNode,
                          value: _selectedValue,
                          items: _numbers.map((int val) {
                            return DropdownMenuItem(
                              value: val,
                              child: Text(
                                "$val",
                              ),
                            );
                          }).toList(),
                          icon: const Icon(Icons.arrow_drop_down),
                          iconEnabledColor: darkPrimary,
                          iconDisabledColor: darkPrimary,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          },
                          validator: (value) {
                            if (value == "" || value == null) {
                              return "can't empty";
                            } else {
                              return null;
                            }
                          },
                          hint: const Text("Select Sq ft 1 to 10"),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF747688),
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 10),
                              child: Image.asset(
                                "assets1/svg/measuretape.png",
                                height: 15.69,
                                width: 17.63,
                              ),
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
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Card(
                        elevation: _addressNode.hasFocus ? 3.0 : 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          minLines: 3,
                          maxLines: 4,
                          obscureText: false,
                          focusNode: _addressNode,
                          controller: _address,
                          // textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: Image.asset(
                                "assets1/svg/adress.png",
                              ),
                            ),
                            hintText: "Address",
                            hintStyle: const TextStyle(
                              // fontSize: 14,

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
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Card(
                        elevation: _photoNode.hasFocus ? 3.0 : 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: isSelected == true
                            ? Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                height: 167,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets1/svg/camera.png',
                                                width: 20,
                                                height: 20,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              const Text('Upload Photo'),
                                            ],
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _photoNode;
                                                  isSelected = false;
                                                });
                                              },
                                              child: const Icon(
                                                  Icons.arrow_drop_up,
                                                  color: darkPrimary,
                                                  size: 30)),
                                        ]),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Row(
                                          children: [
                                            Flexible(child: buildGridView()),
                                            totalPicture == true
                                                ? GestureDetector(
                                                    onTap: () {
                                                      showModalBottomSheet<
                                                          void>(
                                                        context: context,
                                                        shape: const RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        40),
                                                                topRight: Radius
                                                                    .circular(
                                                                        40))),
                                                        builder: (BuildContext
                                                            context) {
                                                          return SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.45,
                                                              child: Scaffold(
                                                                  body:
                                                                      SizedBox(
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          10.0),
                                                                  child: Column(
                                                                      children: [
                                                                        const SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        const Text(
                                                                          "Choose Option!",
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 20),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width - 100,
                                                                          decoration: BoxDecoration(
                                                                              border: Border.all(color: Colors.black, width: 0.5),
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              color: const Color(0xffFFFFFF)),
                                                                          height:
                                                                              50,
                                                                          child:
                                                                              TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              loadCameraAssets();
                                                                              setState(() {
                                                                                Navigator.pop(context);
                                                                              });
                                                                            },
                                                                            style:
                                                                                TextButton.styleFrom(
                                                                              primary: Colors.black,
                                                                              textStyle: const TextStyle(fontSize: 17),
                                                                            ),
                                                                            child:
                                                                                const Text('Camera'),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width - 100,
                                                                          decoration: BoxDecoration(
                                                                              border: Border.all(color: Colors.black, width: 0.5),
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              color: const Color(0xffFFFFFF)),
                                                                          height:
                                                                              50,
                                                                          child:
                                                                              TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              loadAssets();
                                                                              setState(() {
                                                                                Navigator.pop(context);
                                                                              });
                                                                            },
                                                                            style:
                                                                                TextButton.styleFrom(
                                                                              textStyle: const TextStyle(fontSize: 17),
                                                                              primary: Colors.black, // Text Color
                                                                            ),
                                                                            child:
                                                                                const Text('Gallery'),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width - 100,
                                                                          decoration: BoxDecoration(
                                                                              border: Border.all(color: Colors.black, width: 0.5),
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              color: const Color(0xffFFFFFF)),
                                                                          height:
                                                                              50,
                                                                          child:
                                                                              TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            style:
                                                                                TextButton.styleFrom(
                                                                              textStyle: const TextStyle(fontSize: 17),
                                                                              primary: const Color.fromARGB(255, 216, 0, 0), // Text Color
                                                                            ),
                                                                            child:
                                                                                const Text('Cancel'),
                                                                          ),
                                                                        ),
                                                                      ]),
                                                                ),
                                                              )
                                                                  //
                                                                  ));
                                                        },
                                                      );
                                                    },
                                                    child: Image.asset(
                                                      "assets1/svg/choose_option.png",
                                                      width: 45,
                                                    ),
                                                  )
                                                : const Text("")
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                height: 67,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets1/svg/camera.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text('Add Photo'),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isSelected = true;
                                          });
                                        },
                                        child: const Icon(Icons.arrow_drop_down,
                                            color: darkPrimary, size: 30),
                                      ),
                                    ]),
                              ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 52,
                          right: 52,
                        ),
                        child: GestureDetector(
                          onTap: _booking(bookingApi),
                          child: Container(
                            height: 58,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [darkPrimary, lightPrimary]),
                            ),
                            child: Center(
                              child: AppText_bold(text: "Book", size: 16),
                            ),
                            // SizedBox(
                            //   width: 5,
                            // ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<XFile> images = <XFile>[];
  final ImagePicker _picker = ImagePicker();

  loadCameraAssets() async {
    XFile pickedFile;

    try {
      pickedFile = (await _picker.pickImage(
          maxWidth: 300, maxHeight: 300, source: ImageSource.camera))!;
      setState(() {
        images.add(pickedFile);
      });
      return images;
    }
// ignore: unused_catch_clause, empty_catches
    on Exception catch (e) {}
  }

  loadAssets() async {
    List<XFile> resultList = <XFile>[];

    try {
      resultList = (await _picker.pickMultiImage(
        maxWidth: 300,
        maxHeight: 300,
      ))!;

      setState(() {
        // images = resultList;
        for (int i = 0; i < resultList.length; i++) {
          images.add(resultList[i]);
        }
      });
      return images;

      // ignore: empty_catches, unused_catch_clause
    } on Exception catch (e) {}
  }

  Widget buildGridView() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 0,
      mainAxisSpacing: 4,
      children: List.generate(images.length, (index) {
        XFile asset = images[index];
        return Semantics(
          child: Stack(children: [
            Image.file(
              File(asset.path),
              width: 72,
              height: 72,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      images.removeAt(index);
                    });
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    color: Colors.amber,
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        );
      }),
    );
  }
}
