import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odsa/screens/Dashboard.dart';
import 'package:odsa/screens/dashboard/home/user_visit.dart';
import '../../../API/user_apimodelget.dart';
import '../../../helpers/apptext_medium.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/search.dart';
import '../../../model/user_modelproducts.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<Result> futureProduct = [];
  final api = ApiProviderGet();

  bool isLoading = false;
  fetchData(ApiProviderGet apiProvider) async {
    setState(() {
      isLoading = true;
    });
    final resp = await apiProvider.fetchProduct();
    if (resp.status == true) {
      setState(() {
        isLoading = false;
        futureProduct = resp.result!;
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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 13),
          scrollDirection: Axis.vertical,
          itemCount: futureProduct.length,
          itemBuilder: (context, i) {
            return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Visit(sId: futureProduct[i],)));
                },
                child: GridCells(futureProduct[i]));
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
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext contex) => BottomNavBar())),
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
          Text("Products",
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
              hintText: 'Search for products/services',
              onChanged: (String value) {},
            ),
          ),
        ],
      ),
    ),
  );
}

Card GridCells(Result prods) {
  return Card(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.white70, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 0.0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      verticalDirection: VerticalDirection.down,
      children: <Widget>[
        Expanded(
          child: prods.picture != ""
              ? Container(
                  height: 140,
                  width: 160,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Image.network(
                      prods.picture.toString(),
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                )
              : Container(
                  child: Image.asset("assets1/svg/dummy.png"),
                ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText_medium(text:prods.title.toString(), size: 12,),
              Text(prods.description.toString(),maxLines: 1,
                  style:const TextStyle(
                  fontFamily: "Quicksand",
                  fontSize:11,
                  color:Colors.grey,
                  overflow: TextOverflow.ellipsis
              )
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
