import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odsa/screens/dashboard/profile/userProfile/userprofile.dart';
import 'package:odsa/screens/dashboard/profile/user_changepasswrd.dart';

import '../../../helpers/colors.dart';
import '../../../helpers/customDialogue.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    void showLogOutDialogue(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CustomAlertDialog(
            title: 'Confirmation',
          );
        },
      );
    }

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
              child: Text(
                "Profile",
                style: GoogleFonts.quicksand(
                  color: const Color(0xFFFFFFFF),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  minLeadingWidth: 10,
                  title: Text("Profile",
                      style: GoogleFonts.quicksand(
                        color: const Color(0xFF120D26),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      )),
                  leading: Image.asset(
                    "assets1/svg/profilesetting.png",
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                  ),
                  trailing: Image.asset("assets1/svg/arrowright.png"),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ProfileScreen())),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.5, left: 20, right: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  minLeadingWidth: 10,
                  title: Text("Order Tracking",
                      style: GoogleFonts.quicksand(
                        color: const Color(0xFF120D26),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      )),
                  leading: Image.asset(
                    "assets1/svg/order.png",
                    fit: BoxFit.fill,
                  ),
                  onTap: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  minLeadingWidth: 10,
                  title: Text("Change Password",
                      style: GoogleFonts.quicksand(
                        color: const Color(0xFF120D26),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      )),
                  leading: Image.asset(
                    "assets1/svg/Lock.png",
                    fit: BoxFit.fill,
                  ),
                  trailing: Image.asset("assets1/svg/arrowright.png"),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChangePassword())),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  minLeadingWidth: 10,
                  title: Text("Log Out",
                      style: GoogleFonts.quicksand(
                        color: const Color(0xFF120D26),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      )),
                  leading: Image.asset(
                    "assets1/svg/logout.png",
                    fit: BoxFit.fill,
                  ),
                  trailing: Image.asset("assets1/svg/arrowright.png"),
                  onTap: () {
                    showLogOutDialogue(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
