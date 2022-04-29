import 'package:flutter/material.dart';
import 'package:odsa/model/bookingModel.dart';
import '../../../../API/user_apimodelget.dart';
import '../../../../helpers/apptext.dart';
import '../../../../helpers/apptext_medium.dart';
import '../../../../helpers/colors.dart';
import '../user_history_order.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {

List <Result> futureHistory=[];
final api = ApiProviderGet();
bool isLoading = false;
fetchHistory(ApiProviderGet apiProvider) async {

  setState(() {
    isLoading = true;
  }
  );
  final resp = await apiProvider.fetchHistory();
  if (resp.status == true) {
    setState(() {
      isLoading = false;
      futureHistory = resp.result!.cast<Result>();
    });
  }
  else {
    setState(() {
      isLoading = false;
    });
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(resp.message.toString()),
          );
        });
  }
}

@override
void initState() {
  fetchHistory(api);

  super.initState();
}
  @override
  Widget build(BuildContext context) {
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
                "History",color: const Color(0xFFFFFFFF),
                  size: 20,
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: futureHistory.length,
    itemBuilder: (context, index) {
     return GestureDetector(
       onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const History_Order())
       ),
       child: Padding(
         padding: const EdgeInsets.only(top: 22,left: 21,right: 21),
         child: Container(
           decoration: BoxDecoration(
               color: HexColor("#F6F6F6"),
               borderRadius: BorderRadius.circular(25),
               boxShadow: kElevationToShadow[2]),
           height: 100,
           width: 335,
           child: Padding(
             padding: const EdgeInsets.only(top: 5, left: 9),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Container(
                   decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(10),
                       boxShadow: kElevationToShadow[2]),
                   child: Center(
                     child: Container(
                       height: 77.96,
                       width: 74,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           image: const DecorationImage(
                               image: AssetImage("assets/bg.png"),
                               fit: BoxFit.cover)),
                     ),
                   ),
                   height: 83.96,
                   width: 80,
                 ),
                 const SizedBox(
                   width: 21,
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top: 8.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       AppText_medium(size: 16, text: "Service 1"),
                       const SizedBox(height: 4),
                       AppText(
                         size: 13,
                         text: "Wed, Apr 28 • 5:30 PM",
                         color: HexColor("#979797"),
                       ),
                       const SizedBox(height: 4),
                       AppText_medium(size: 12, text: "Kajaria Ceramics Ltd."),
                       const SizedBox(height: 4),
                       AppText(
                           size: 9,
                           text: "Digital Floor Tiles, Thickness: 5-10 mm")
                     ],
                   ),
                 ),
                 const Spacer(),
                 Padding(
                   padding: const EdgeInsets.only(top: 40,right: 13),
                   child: Image.asset('assets/arrowright.png'),
                 )
               ],
             ),
           ),
         ),
       ),
     );
    }
    )
    );
  }
}
