import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odsa/helpers/apptext_bold.dart';
import 'package:odsa/helpers/colors.dart';

import '../../../API/user_apimodelget.dart';
import '../../../model/user_modelhistoryget.dart';

class UserHistory extends StatefulWidget {
  const UserHistory({Key? key}) : super(key: key);

  @override
  _UserHistoryState createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {
  List<Result> futureHistory = [];
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
        futureHistory = resp.result!;
      }
      );
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
              child: Text(
                "History",
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
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: futureHistory.length,
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          itemBuilder: (context, index) {
            return Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 7.0,
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5.0,
                        child: Container(
                        //  child:// futureHistory[index].photo.toString() != ""
                              // ? Container(
                              //   child: ClipRRect(
                              //     borderRadius:
                              //         const BorderRadius.all(Radius.circular(12)),
                              //     child: Image.network(
                              //       futureHistory[index].photo.toString(),
                              //       fit: BoxFit.fill,
                              //       loadingBuilder: (BuildContext context,
                              //           Widget child,
                              //           ImageChunkEvent? loadingProgress) {
                              //         if (loadingProgress == null) {
                              //           return child;
                              //         }
                              //         return Center(
                              //           child: CircularProgressIndicator(
                              //             value: loadingProgress
                              //                         .expectedTotalBytes !=
                              //                     null
                              //                 ? loadingProgress
                              //                         .cumulativeBytesLoaded /
                              //                     loadingProgress
                              //                         .expectedTotalBytes!
                              //                 : null,
                              //           ),
                              //         );
                              //       },
                              //     ),
                              //   ),
                              // )
                              //:Container(
                                  child: Image.asset("assets1/svg/dummy.png"),
                               // ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(futureHistory[index].email.toString()),
                          Text(futureHistory[index].createdAt.toString()),
                        ],
                      ),
                    ),
                  ],
                ));
          })
    );
  }
}
