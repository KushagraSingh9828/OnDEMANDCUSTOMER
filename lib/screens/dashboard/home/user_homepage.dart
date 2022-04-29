import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odsa/helpers/apptext.dart';
import 'package:odsa/helpers/apptext_medium.dart';
import 'package:odsa/model/user_modelproducts.dart';
import 'package:odsa/screens/dashboard/home/user_notification.dart';
import 'package:odsa/screens/dashboard/home/user_products.dart';
import 'package:odsa/screens/dashboard/home/user_service.dart';
import 'package:odsa/screens/dashboard/home/user_visit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../API/user_apimodelget.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  List<Result> futureProduct = [];
  List<Result> futureService = [];
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


  fetchData1(ApiProviderGet apiProvider) async {
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
    fetchData1(api);
    fetchData(api);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: SizedBox.expand(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                color: Color(0xffFFFFFF),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 121.6,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xffFFFFFF),
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Image.asset(
                          "assets1/svg/homepagedemo.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 4,
                        effect: const WormEffect(
                          activeDotColor: Colors.black,
                          dotColor: Color(0xff7C7C7C),
                          dotHeight: 4.8,
                          dotWidth: 6,
                          spacing: 4.8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xffE8E8E8),
                height: 232,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Products",
                                style: GoogleFonts.quicksand(
                                  color: Color(0xFF000000),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                )),
                            GestureDetector(
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Products()))
                              },
                              child: Text("View all",
                                  style: GoogleFonts.quicksand(
                                    color: darkPrimary,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ),
                          ]),
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: futureProduct.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Visit( sId: futureProduct[i],)));
                                },
                                child: HomeBox((futureProduct[i]))
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                height: 12,
              ),
              Container(
                color: Color(0xffE8E8E8),
                height: 232,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24, left: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText_medium(size: 16, text: "Services"),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Service()));
                              },
                              child: AppText(size: 11, text: "View all",color: darkPrimary)),
                        ]
                      ),
                    ),
                    SizedBox(height: 7),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:futureService.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: HomeBox(futureService[i]),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ]),
          ),
        )
    );
  }

  PreferredSize buildAppBar() {
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
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 2),
                child: GestureDetector(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>User_Notification()));},
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Image.asset("assets1/svg/bell.png")),
                ),
              ),
            ),
            Image.asset("assets1/svg/homepagelogo.png"),
            SizedBox(
              height: 15,
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
}

Container HomeBox(Result prods) {
  return Container(
    width: 160,
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child:prods.picture != ""
          ?Container(
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
          ):Container(
            height: 140,
            width: 160,
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Image.asset("assets1/svg/dummy.png",fit: BoxFit.cover,),
          )
        ),
        SizedBox(height: 10),
        AppText_medium(size:12 , text: prods.title.toString()),
        SizedBox(height: 5),
        Text(prods.description.toString()
            ,maxLines: 1
            ,style:const TextStyle(
                fontFamily: "Quicksand",
                fontSize:11,
                color:Colors.grey,
                overflow: TextOverflow.ellipsis
            ))
      ],
    ),
  );
}