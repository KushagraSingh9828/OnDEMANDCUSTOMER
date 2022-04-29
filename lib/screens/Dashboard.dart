import 'package:flutter/material.dart';
import 'package:odsa/screens/dashboard/history/user_history.dart';
import 'package:odsa/screens/dashboard/home/user_homepage.dart';
import 'package:odsa/screens/dashboard/contact/usercontact.dart';
import 'package:odsa/screens/dashboard/profile/userprofile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List pages=[
    const HomePage(),
    const UserHistory(),
    const Contact(),
    const Profile()
             ];
  int currentIndex=0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xffDDB149),
        onTap: onTap,
        unselectedFontSize: 10,
        selectedFontSize: 12,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        elevation: 02,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items:  const [
          BottomNavigationBarItem(label:'Home', icon:ImageIcon(AssetImage("assets1/svg/homenav.png"))),
          BottomNavigationBarItem(label:'History',icon:ImageIcon(AssetImage("assets1/svg/historynav.png"))),
          BottomNavigationBarItem(label: 'Contact',icon:ImageIcon(AssetImage("assets1/svg/contactnav.png"))),
          BottomNavigationBarItem(label:'Profile',icon:ImageIcon(AssetImage("assets1/svg/profilenav.png"))),
        ],
      ),
    );
  }
}