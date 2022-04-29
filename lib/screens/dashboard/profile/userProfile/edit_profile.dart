// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';
import 'dart:io';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:odsa/screens/dashboard/profile/userProfile/repositories/UserProfileResponse.dart';
import 'package:odsa/screens/dashboard/profile/userProfile/state/profile_state.dart';

import '../../../../core/alert/toaster.dart';
import '../../../../core/constant/msg_constant.dart';
import '../../../../core/constant/size_constant.dart';
import '../../../../core/custom_widget/button.dart';
import '../../../../core/loader/app_loader.dart';
import '../../../../core/popup/camera_gallery_popup.dart';
import '../../../../helpers/AlertBox.dart';
import '../../../../helpers/CustomTextField1.dart';
import '../../../../helpers/Helper.dart';
import 'cubit/profile_cubit.dart';

var imageFile;
String? profileImg;
bool isLoading = false;
final ImagePicker picker = ImagePicker();

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? isd;
  String? name;
  String? mobile;
  String? address;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Helper().check().then((isInterAvailable) {
      if (isInterAvailable) {
        setState(() {
          isLoading = true;
        });
        BlocProvider.of<ProfileCubit>(context).getUserProfile();
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertBox(
              title: INTERNET_CONNECTION_ERROR,
            );
          },
        );
      }
    });
  }

  _openGallery() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      log(pickedFile!.path.toString());
      setState(() {
        imageFile = pickedFile;
      });
      return imageFile;
    } on Exception catch (e) {}
  }
  _openCamera() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      log(pickedFile!.path.toString());
      setState(() {
        imageFile = pickedFile;
      });
      return imageFile;
    } on Exception catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          setState(() {
            isLoading = false;
          });
          if (state is ProfileLoadedState) {
            if (state.commonResponseModel != null) {
              showToast(context, state.commonResponseModel!.message);
              Navigator.of(context).pop();
            }
            setState(() {
              UserResult model = state.response!.result;
              isLoading = false;
              isd = model.isd;
              name = model.name;
              mobile = model.phoneNo;
              address = model.address;
              profileImg = model.profilePicture;
              context.read<ProfileCubit>().request.isd = isd;
              context.read<ProfileCubit>().request.mobile = mobile;
              context.read<ProfileCubit>().request.address = address;
              context.read<ProfileCubit>().request.name = name;
            });
          } else {}
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: const Padding(
                padding: EdgeInsets.only(left:70.0),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff121617),
                      fontWeight: FontWeight.bold),
                ),
              ),
              backgroundColor: const Color(0xffFFFFFF),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: Stack(
              children: [
                Container(
                  width: screenWidth(context),
                  height: screenHeight(context),
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Center(
                          child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: (imageFile != null)
                                ? ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: Image.file(
                                      File(imageFile!.path),
                                      fit: BoxFit.cover,
                                      width: 90,
                                      height: 90,
                                    ),
                                  )
                                : (profileImg == null || profileImg == "")
                                    ? Image.asset(
                                        "assets1/svg/deflogo.png",
                                        width: 90,
                                        height: 90,
                                      )
                                    : ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Image.network(
                                          profileImg.toString(),
                                          fit: BoxFit.fill,
                                          width: 90,
                                          height: 90,
                                        ),
                                      ),
                          ),
                          Positioned(
                            top: 90,
                            left: 90,
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet<String>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.85,
                                          child: const CameraGallaryPopup());
                                    }).then((value) {
                                  if (value == "1") {
                                    // Camera
                                    _openCamera();
                                  } else if (value == "2") {
                                    // Gallery
                                    _openGallery();
                                  }
                                });
                              },
                              child:
                                  Image.asset("assets1/svg/edit_pic.png", width: 30),
                            ),
                          )
                        ],
                      )),
                      CustomTextField1(
                        placeholder: "",
                        defaultTxt: name ?? "",
                        icon: "assets1/svg/Profile.png",
                        onChanged: (text) {
                          log(text);
                          context.read<ProfileCubit>().request.name = text;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 27, right: 27),
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Image.asset(
                                "assets1/svg/phone.png",
                                width: 23,
                                height: 23,
                              ),
                            ),
                            Container(
                                height: 55,
                                // width: 75,
                                alignment: Alignment.topLeft,
                                child: CountryCodePicker(
                                  onInit: (code) {
                                    context.read<ProfileCubit>().request.isd =
                                        code.toString();
                                  },
                                  initialSelection: isd,
                                  showFlag: false,

                                  // showOnlyCountryWhenClosed: false,

                                  onChanged: (code) {
                                    setState(() {
                                      context.read<ProfileCubit>().request.isd =
                                          code.dialCode.toString();
                                    });
                                  },
                                )),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.only(
                                    bottom: 12, right: 15),
                                child: TextField(
                                  maxLength: 10,
                                  onChanged: (value) {
                                    log(value);
                                    context
                                        .read<ProfileCubit>()
                                        .request
                                        .mobile = value;
                                  },
                                  controller: TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: (mobile ?? ""),
                                          selection: TextSelection.collapsed(
                                              offset: (mobile ?? "").length))),
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  decoration: const InputDecoration(
                                      counterText: "",
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 27, right: 27),
                        child: Container(
                          height: 105,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 15, left: 2),
                                  child: Image.asset(
                                    "assets1/svg/adress.png",
                                    width: 27,
                                    height: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextField(
                                    onChanged: (value) {
                                      context
                                          .read<ProfileCubit>()
                                          .request
                                          .address = value;
                                    },
                                    controller: TextEditingController.fromValue(
                                        TextEditingValue(

                                            text: (address ?? ""),
                                            selection: TextSelection.collapsed(
                                                offset:
                                                    (address ?? "").length)
                                        )
                                    ),
                                    maxLines: 4,
                                    cursorColor: Colors.black,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    decoration: const InputDecoration(
                                        counterText: "",
                                        border: InputBorder.none),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Button(
                          width: 200,
                          title: "Update",
                          onPressed: () {
                            setState(() {
                              isLoading = true;
                            });
                            if (imageFile == null) {
                            } else {
                              context.read<ProfileCubit>().request.filePath =
                                  imageFile.path;
                            }
                            context.read<ProfileCubit>().updateProfile();
                          }),
                    ]),
                  ),
                ),
                isLoading == true ? AppLoader() : const SizedBox()
              ],
            ),
          );
        },
      ),
    );
  }
}
