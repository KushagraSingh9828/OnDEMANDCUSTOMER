import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odsa/screens/dashboard/home/user_products.dart';

import '../../../API/user_apimodelget.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/search.dart';
import '../../../model/user_modelproducts.dart';

class Service extends StatefulWidget {
  const Service({Key? key}) : super(key: key);

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  List<Result> futureService = [];
  final api = ApiProviderGet();

  bool isLoading = false;
  fetchData(ApiProviderGet apiProvider) async {
    setState(() {
      isLoading = true;
    });
    final resp = await apiProvider.fetchService();
    if (resp.status == true) {
      setState(() {
        isLoading = false;
        futureService = resp.result!;
      });
    } else {
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
    fetchData(api);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: GridView.builder(
          padding: EdgeInsets.all(13),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 13),
          scrollDirection: Axis.vertical,
          itemCount: futureService.length,
          itemBuilder: (context, i) {
            return GridCells(futureService[i]);
          }),
    );
  }
}

PreferredSize buildAppBar(context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(150),
    child: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            darkPrimary,
            lightPrimary,
          ])),
      child: Column(
        children: [
          SafeArea(
            child: GestureDetector(
              onTap: () => {Navigator.pop(context)},
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 2),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Image.asset("assets1/svg/whitearrowleft.png")),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Services",
              style: GoogleFonts.quicksand(
                color: Color(0xffFFFFFF),
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              )),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: SearchWidget(
              hintText: 'Search for services',
              onChanged: (String value) {},
            ),
          ),
        ],
      ),
    ),
  );
}
