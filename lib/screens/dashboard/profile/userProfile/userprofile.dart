import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odsa/screens/dashboard/profile/userProfile/repositories/UserProfileResponse.dart';
import 'package:odsa/screens/dashboard/profile/userProfile/state/profile_state.dart';

import '../../../../core/constant/msg_constant.dart';
import '../../../../core/constant/size_constant.dart';
import '../../../../core/custom_widget/button.dart';
import '../../../../core/loader/app_loader.dart';
import '../../../../helpers/AlertBox.dart';
import '../../../../helpers/Helper.dart';
import '../../../../helpers/apptext_medium.dart';
import '../../../../helpers/colors.dart';
import 'cubit/profile_cubit.dart';
import 'edit_profile.dart';

bool isLoading = false;
String? profileImg;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? name;
  String? isd;
  String? mobile;
  String? address;

  @override
  void initState() {
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
    }
    );
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
            setState(() {
              UserResult model = state.response!.result;
              name = model.name;
              mobile = model.isd + model.phoneNo;
              address = model.address;
              profileImg = model.profilePicture;
              log(profileImg.toString());
            });
          } else {}
        },
        builder: (context, state) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(71.89),
              child: Container(
                height: 91.89,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [darkPrimary, lightPrimary]),
                ),
                child: SafeArea(
                  child: Center(
                    child: AppText_medium(text:
                    "Profile",color: const Color(0xFFFFFFFF),
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Container(
                    width: screenWidth(context),
                    height: screenHeight(context),
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        (profileImg == null || profileImg == "")
                            ? Image.asset(
                                "assets1/svg/deflogo.png",
                                width: 90,
                                height: 90,
                              )
                            : ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.network(
                                  profileImg.toString(),
                                  fit: BoxFit.fill,
                                  width: 90,
                                  height: 90,
                                ),
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                        profilecell(
                          title: (name ?? "").isEmpty ? "Name" : name ?? "",
                          titleIcon: 'assets1/svg/Profile.png',
                        ),
                        profilecell(
                          title:
                              (mobile ?? "").isEmpty ? "Mobile" : (mobile ?? ""),
                          titleIcon: 'assets1/svg/phone.png',
                        ),
                        profilecell(
                          title: (address ?? "").isEmpty
                              ? "No Address"
                              : address ?? "",
                          titleIcon: 'assets1/svg/adress.png',
                        ),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xffDDB149), Color(0xffFBD57D)]),
                          ),
                          height: 50,
                          child: Button(
                              width: 200,
                              title: "Edit",
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditProfileScreen())).then((value) {
                                  log("pop from");
                                  Helper().check().then((isInterAvailable) {
                                    if (isInterAvailable) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      BlocProvider.of<ProfileCubit>(context)
                                          .getUserProfile();
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
                                });
                              }),
                        ),
                      ]),
                    ),
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

class profilecell extends StatelessWidget {
  String title;
  String titleIcon;
  //String rightIcon;
  profilecell({
    Key? key,
    required this.title,
    required this.titleIcon,
    // required this.rightIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        padding: const EdgeInsets.only(left: 20),
        height: 65,
        child: Row(children: [
          Image.asset(
            titleIcon,
            width: 20,
            height: 20,
          ),
          const SizedBox(
            width: 15,
          ),
          Flexible(
            child: Container(child: Text(title)),
          ),
        ]),
      ),
    );
  }
}
