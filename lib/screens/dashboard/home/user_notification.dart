import 'package:flutter/material.dart';
import 'package:odsa/helpers/apptext_medium.dart';
import 'package:odsa/helpers/apptext_bold.dart';
import '../../../helpers/colors.dart';

class User_Notification extends StatefulWidget {
  const User_Notification({Key? key}) : super(key: key);

  @override
  State<User_Notification> createState() => _User_NotificationState();
}

class _User_NotificationState extends State<User_Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xffDDB149) ,
       leading: IconButton(onPressed:(){
         Navigator.of(context).pop();
       }, icon: Icon(Icons.arrow_back)
       ),
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: AppText_medium(size: 20,text: "Notification",color: Colors.white,),
        ),
      ),
      backgroundColor: Colors.white,
      body:Padding(
        padding: const EdgeInsets.only(top:18,left: 20,right: 20),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(height: 20,),
                Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:5),
                      child: Container(
                        height: 10.54,
                        width: 10.54,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                    ),
                    SizedBox(width: 8.5),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 189,
                          child: AppText_bold(size: 16,text: "Your Password has been Changed successfully.",),
                        ),
                        SizedBox(height: 4),
                        AppText_medium(size: 16, text: "Jul 23, 2021 at 09:15 Am",color: Colors.grey,)
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 52.43,
                      width: 52.43,
                      decoration: BoxDecoration(
                        color:Color(0xffDDB149),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Image.asset("assets1/svg/Password.png",fit: BoxFit.cover,)
                       )
                  ],
                ),
                SizedBox(height: 10),
                Container(width: 334,height:1,
                decoration: BoxDecoration(color: HexColor("#E4DFDF")),)

              ],
            );
          }
        ),
      )
    );
  }
}
