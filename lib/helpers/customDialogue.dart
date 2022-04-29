import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odsa/helpers/apptext.dart';
import 'package:odsa/helpers/colors.dart';
import 'package:odsa/screens/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';



class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  final _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          Text(
            "${widget.title}",
            style: GoogleFonts.quicksand(
              color: darkPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(height: 10),
          Divider(
            height: 1,
            color: darkPrimary,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 74,
            child: InkWell(
              highlightColor: Colors.white10,
              onTap: () {
                //do somethig
              },
              child: Center(
                child: AppText(text:"Are You Sure to Logout?",color: Color(0xff979797),size: 17,
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
            color: darkPrimary,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    color: lightPrimary,
                    height: 58,
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      ),
                      highlightColor: Colors.grey[200],
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Center(
                        child: Text(
                          "NO",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const SizedBox(
                    width: 1,
                  ),
                ),
                Flexible(
                  child: Container(
                    height: 58,
                    color: lightPrimary,
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      ),
                      highlightColor: Colors.grey[200],
                      onTap: () async {
                        SharedPreferences prefs = await _prefs;
                        prefs.clear();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext) => SignIn()));
                      },
                      child: Center(
                        child: Text(
                          "Yes",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
