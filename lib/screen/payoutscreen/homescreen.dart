import 'package:badabusiness/screen/product/cs.dart';
import 'package:badabusiness/screen/product/eae.dart';
import 'package:badabusiness/screen/product/ibc.dart';
import 'package:badabusiness/screen/product/ltm.dart';
import 'package:badabusiness/screen/product/psc.dart';
import 'package:badabusiness/screen/product/wl.dart';
import 'package:badabusiness/screen/registration/payment.dart';
import 'package:badabusiness/screen/registration/registration.dart';
import 'package:badabusiness/screen/search/searchbutton.dart';
import 'package:badabusiness/website/web.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'community/cummunityfull.dart';
import 'others/fullimage.dart';
import 'others/fullnotify.dart';
import 'others/latestnew.dart';
// ignore: unused_import
import 'others/regitwo.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: unused_field
  String _platformVersion = 'Unknown';

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterOpenWhatsapp.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  // static final MobileAdTargetingInfo targetInfo = new MobileAdTargetingInfo(
  //   testDevices: <String>[],
  //   keywords: <String>[
  //     'Business Consultant',
  //     'motivationl speaker',
  //     'startup',
  //     'jobs',
  //     'leadership',
  //     'business',
  //     'entrepreneures',
  //     'solopreneures',
  //     'consulting',
  //     'motivational videos',
  //     'business man ',
  //     'startup grow',
  //     'wantrepreneurs'
  //   ],
  //   childDirected: true,
  //   nonPersonalizedAds: true,
  // );

  // late BannerAd _bannerAd;
  // late InterstitialAd _interstitialAd;

  // BannerAd createBannerAd() {
  //   return new BannerAd(
  //       adUnitId: "ca-app-pub-3032113909807052/1242251447",
  //       size: AdSize.banner,
  //       targetingInfo: targetInfo,
  //       listener: (MobileAdEvent event) {
  //         print("Banner event : $event");
  //       });
  // }

  // InterstitialAd createInterstitialAd() {
  //   return new InterstitialAd(
  //       adUnitId: "ca-app-pub-5674895974672408/3355686571",
  //       targetingInfo: targetInfo,
  //       listener: (MobileAdEvent event) {
  //         print("Interstitial event : $event");
  //       });
  // }

  @override
  void initState() {
    super.initState();
    initPlatformState();
    // FirebaseAdMob.instance
    //     .initialize(appId: "ca-app-pub-5674895974672408~5981849912");
    // _bannerAd = createBannerAd()
    //   ..load()
    //   ..show();
    // _interstitialAd = createInterstitialAd()
    //   ..load()
    //   ..show();
  }

  @override
  void dispose() {
    // _bannerAd.dispose();
    // _interstitialAd.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              actions: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 110, right: 110, top: 15, bottom: 5),
                    child: Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )
              ],
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.sort_rounded,
                      size: 40,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      // createInterstitialAd()
                      //   ..load()
                      //   ..show();

                      Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
              pinned: true,
              expandedHeight: 120.0,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  // title: Text("Bada BUsiness",
                  //     textAlign: TextAlign.end,
                  //     style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 20.0,
                  //         backgroundColor: Colors.white70)),
                  background: Image.asset(
                    "assets/images/i29.png",
                    fit: BoxFit.fill,
                  )),
              backgroundColor: Colors.white,
            ),
            searchbuttion(context),
            header(),
            registration(context),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Latest Notification",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            notification(context),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Products",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Product(),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Community",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            community(),
            // SliverToBoxAdapter(
            //   child: Container(
            //     height: 10,
            //     color: Colors.black,
            //   ),
            // ),

            demo(context),
            //SliverToBoxAdapter(child: Container(height: 300, child: Regip())),
          ],
        ),
        drawer: drawer(context),
      ),
    );
  }
}

SliverToBoxAdapter header() {
  return SliverToBoxAdapter(
    child: Container(
      height: 160,
      margin: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          child: Carousel(
            boxFit: BoxFit.fill,
            autoplay: true,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 1000),
            dotSize: 8.0,
            dotIncreasedColor: Colors.yellow[700],
            dotBgColor: Colors.transparent,
            dotPosition: DotPosition.bottomCenter,
            dotVerticalPadding: 10.0,
            showIndicator: true,
            indicatorBgPadding: 7.0,
            images: [
              ExactAssetImage("assets/slider_1.jpg"),
              ExactAssetImage("assets/slider_2.jpg"),
              ExactAssetImage("assets/slider_3.jpg"),
              ExactAssetImage("assets/6.png.png"),
              ExactAssetImage("assets/1.png.png"),
              ExactAssetImage("assets/2.png.png"),
              ExactAssetImage("assets/3.png.png"),
              ExactAssetImage("assets/4.png.png"),
              ExactAssetImage("assets/5.png.png"),
              ExactAssetImage("assets/6.png.png"),
            ],
          ),
        ),
      ),
    ),
  );
}

SliverToBoxAdapter registration(BuildContext context) {
  return SliverToBoxAdapter(
    child: Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[Colors.yellow.shade50, Colors.white]),
      ),
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Registration()));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: 10, right: 5, bottom: 4, top: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Colors.red.shade200,
                          Colors.red.shade100
                        ]),
                  ),
                  child: Center(
                    child: Text(
                      "Registration Open",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Paymentt()));
                },
                child: Container(
                  decoration: BoxDecoration(),
                  child: Image.asset("assets/images/i8.png"),
                ),
              )),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                FlutterOpenWhatsapp.sendSingleMessage("91 7549135542",
                    "Welcome Sir in Bada Business   https://www.badabusiness.com/dd/BIYK005702/   thanks for contact bada business . Grow your business as well ass career with Dr Vivek Bindra  \n- Purshotam Kumar \n (Senior Buisness Consultant) \n +91 7549135542  purshotambussinessconsultant@gmail.com");
              },
              child: Container(
                  child: Image.asset(
                "assets/what.png",
                fit: BoxFit.cover,
              )),
            ),
          )
        ],
      ),
    ),
  );
}

SliverToBoxAdapter notification(BuildContext context) {
  return SliverToBoxAdapter(
    child: Container(
      height: 180,
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('notify').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(child: CircularProgressIndicator()
                  //Text('Error: ${snapshot.error}'),
                  );
            }
            return Container(
              margin: EdgeInsets.all(10),
              child: Container(
                color: Colors.white,
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: snapshot.data!.docs
                      .map<Widget>((DocumentSnapshot document) {
                    String url = document['url'];
                    String name = document['name'];
                    String link = document['link'];
                    String des = document['des'];
                    String l2 = document['l2'];
                    String link2 = document['link2'];
                    String url2 = document['url2'];
                    String url3 = document['url3'];
                    String url4 = document['url4'];

                    String l = document['l'];
                    return SingleChildScrollView(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Notifull(url, link, name,
                                  des, l2, link2, url2, url3, url4)));
                        },
                        child: Container(
                          // height: 250,
                          width: 260,
                          color: Colors.white,
                          margin: EdgeInsets.all(5),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Container(
                                    height: 150,
                                    width: MediaQuery.of(context).size.width,
                                    child: Hero(
                                      tag: url,
                                      child: new FadeInImage(
                                        image: new NetworkImage(url),
                                        fit: BoxFit.fill,
                                        placeholder: new AssetImage(
                                          "assets/lo.gif",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12)),
                                  child: Container(
                                    color: Colors.yellow[50],
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.black,
                                      highlightColor: Colors.yellow.shade500,
                                      loop: 700,
                                      enabled: true,
                                      child: Text(
                                        l,
                                        style: TextStyle(
                                            color: Colors.green[700],
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
          }),
    ),
  );
}

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 600,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.center,
              colors: <Color>[Colors.orange.shade100, Colors.white]),
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => Ibc()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topRight,
                            colors: <Color>[
                              Colors.yellow.shade100,
                              Colors.white
                            ]),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Hero(
                              tag: 'ibc',
//  placeholderBuilder: (context, widget) {
//       return Container(
//         height: 150.0,
//         width: 150.0,
//         child: CircularProgressIndicator(),
//       );
//     },

                              child: RotationTransition(
                                  turns: _animation,
                                  child: Image.asset("assets/images/i10.png")),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 25, right: 25, bottom: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: <Color>[
                                      Colors.orange.shade100,
                                      Colors.white
                                    ]),
                              ),
                              child: Center(
                                child: Text(
                                  "IBC",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Eae()));
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topLeft,
                                colors: <Color>[
                                  Colors.yellow.shade100,
                                  Colors.white
                                ]),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Hero(
                                      tag: 'eae',
                                      child: RotationTransition(
                                        turns: _animation,
                                        child: Image.asset(
                                            "assets/images/i11.png"),
                                      ))),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 25, right: 25, bottom: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: <Color>[
                                          Colors.orange.shade100,
                                          Colors.white
                                        ]),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "BPC",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => Ltm()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topRight,
                            colors: <Color>[
                              Colors.yellow.shade100,
                              Colors.white
                            ]),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Hero(
                                  tag: 'ltm',
                                  child: RotationTransition(
                                      turns: _animation,
                                      child: Image.asset(
                                          "assets/images/i12.png")))),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 25, right: 25, bottom: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: <Color>[
                                      Colors.orange.shade100,
                                      Colors.white
                                    ]),
                              ),
                              child: Center(
                                child: Text(
                                  "LTM",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Psc()));
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topLeft,
                                colors: <Color>[
                                  Colors.yellow.shade100,
                                  Colors.white
                                ]),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Hero(
                                      tag: 'psc',
                                      child: RotationTransition(
                                        turns: _animation,
                                        child: Image.asset(
                                            "assets/images/i16.png"),
                                      ))),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 25, right: 25, bottom: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: <Color>[
                                          Colors.orange.shade100,
                                          Colors.white
                                        ]),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "PSC",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => Wl()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topRight,
                            colors: <Color>[
                              Colors.yellow.shade100,
                              Colors.white
                            ]),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Hero(
                                  tag: 'wl',
                                  child: RotationTransition(
                                      turns: _animation,
                                      child: Image.asset(
                                          "assets/images/i14.png")))),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 25, right: 25, bottom: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: <Color>[
                                      Colors.orange.shade100,
                                      Colors.white
                                    ]),
                              ),
                              child: Center(
                                child: Text(
                                  "WL",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => Cs()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topLeft,
                            colors: <Color>[
                              Colors.yellow.shade100,
                              Colors.white
                            ]),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Hero(
                                  tag: 'cs',
                                  child: RotationTransition(
                                      turns: _animation,
                                      child: Image.asset(
                                          "assets/images/i15.png")))),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 25, right: 25, bottom: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: <Color>[
                                      Colors.orange.shade100,
                                      Colors.white
                                    ]),
                              ),
                              child: Center(
                                child: Text(
                                  "Case-Study",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

SliverToBoxAdapter community() {
  return SliverToBoxAdapter(
    child: Container(
      height: 180,
      child: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('community').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            return Container(
              color: Colors.white,
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: snapshot.data!.docs
                    .map<Widget>((DocumentSnapshot document) {
                  String url = document['url'];
                  String name = document['name'];
                  String link = document['link'];
                  String des = document['des'];

                  return SingleChildScrollView(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Cfull(url, link, name, des)));
                      },
                      child: Container(
                        // height: 250,
                        width: 260,
                        color: Colors.white,
                        margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Container(
                                  height: 150,
                                  width: MediaQuery.of(context).size.width,
                                  child: Hero(
                                    tag: url,
                                    child: new FadeInImage(
                                      image: new NetworkImage(url),
                                      fit: BoxFit.fill,
                                      placeholder: new AssetImage(
                                        "assets/lo.gif",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          }),
    ),
  );
}

SliverToBoxAdapter demo(BuildContext context) {
  return SliverToBoxAdapter(
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.yellow.shade100, Colors.white]),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Image.asset("assets/images/logo.png"),
          ),
          InkWell(
            onTap: () {
              String url =
                  "https://firebasestorage.googleapis.com/v0/b/badabusiness-6ec0b.appspot.com/o/payment.jpg?alt=media&token=f94442a8-e965-4656-be7d-2e35ccaf7acc";
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Full(url)));
            },
            child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/badabusiness-6ec0b.appspot.com/o/payment.jpg?alt=media&token=f94442a8-e965-4656-be7d-2e35ccaf7acc'),
          ),
          InkWell(
            onTap: () {
              // _call();
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.yellow[50],
                  child: Text(
                    " \n Purshotam Kumar \n Business Consultant \n 754913554 purshotambussinessconsultant@gmail.com",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              String url =
                  "https://miro.medium.com/max/1266/1*cdSYupFWDUqCV48fCnZ2RQ.jpeg";
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Full(url)));
            },
            child: Image.network(
                'https://miro.medium.com/max/1266/1*cdSYupFWDUqCV48fCnZ2RQ.jpeg'),
          ),
          // Center(
          //   child: Container(
          //     margin: EdgeInsets.all(10),
          //     child: Text(
          //       "Premium Videos For Showcase Purpose to Customers",
          //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          //     ),
          //   ),
          // ),
          // InkWell(
          //   onTap: () {
          //     p1();
          //   },
          //   child: Container(
          //     margin: EdgeInsets.all(10),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(10),
          //       child: Container(
          //         child: new FadeInImage(
          //           image: new NetworkImage(
          //               'https://miro.medium.com/max/1400/1*3CNEBZaBpvWbKiXCy3G53Q.png'),
          //           fit: BoxFit.fill,
          //           placeholder: new AssetImage(
          //             "assets/lo.gif",
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // InkWell(
          //   onTap: () {
          //     p2();
          //   },
          //   child: Container(
          //     margin: EdgeInsets.all(10),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(10),
          //       child: Container(
          //         child: new FadeInImage(
          //           image: new NetworkImage(
          //               'https://miro.medium.com/max/1200/1*q4gqw5tEt3vCW3SSo0_bZA.png'),
          //           fit: BoxFit.fill,
          //           placeholder: new AssetImage(
          //             "assets/lo.gif",
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // InkWell(
          //   onTap: () {
          //     p3();
          //   },
          //   child: Container(
          //     margin: EdgeInsets.all(10),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(10),
          //       child: Container(
          //         child: new FadeInImage(
          //           image: new NetworkImage(
          //               'https://miro.medium.com/max/1200/1*k-omJ5hNDOZXyCkMBJdt4w.png'),
          //           fit: BoxFit.fill,
          //           placeholder: new AssetImage(
          //             "assets/lo.gif",
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Container(height: 300, child: Regip()),
        ],
      ),
    ),
  );
}

Drawer drawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            accountEmail: Text(
              'purshotambussinessconsultant@gmail.com',
              style: TextStyle(color: Colors.black, fontSize: 13),
            ),
            accountName: Text(
              '+91 7549135542',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.blue[50],
              //child: Image.asset("assets/6.png.png")
              backgroundImage: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/badabusiness-6ec0b.appspot.com/o/index.jpg?alt=media&token=93ce952f-22de-49ab-968d-e9c825308185'),
            )),
        Divider(
          height: 10,
          color: Colors.lightBlueAccent,
        ),
        ListTile(
          leading: Icon(Icons.new_releases),
          title: Text("Latest News"),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Latestnew()));
          },
        ),
        ListTile(
          leading: Icon(Icons.app_registration),
          title: Text("Registration"),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Registration()));
          },
        ),
        ListTile(
          leading: Icon(Icons.note_add),
          title: Text("Learning"),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Paymentt()));
          },
        ),
        ListTile(
          leading: Icon(Icons.store),
          title: Text("Products"),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Web()));
          },
        ),
        ListTile(
          leading: Icon(Icons.call),
          title: Text("Whatsapp Now"),
          onTap: () {
            FlutterOpenWhatsapp.sendSingleMessage("91 7549135542",
                "Welcome Sir in Bada Business   https://www.badabusiness.com/dd/BIYK005702/   thanks for contact bada business . Grow your business as well ass career with Dr Vivek Bindra  \n- Purshotam Kumar \n (Senior Buisness Consultant) \n +91 7549135542  purshotambussinessconsultant@gmail.com");
          },
        ),
        ListTile(
          leading: Icon(Icons.question_answer),
          title: Text("Ask Now"),
          onTap: () {
            asknow();
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => Show()));
          },
        ),
        ListTile(
          leading: Icon(Icons.contacts),
          title: Text("Call Now"),
          onTap: () {
            call();
            //Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.share),
          title: Text("Share Now"),
          onTap: () {
            _shareT();
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => Show()));
          },
        ),
      ],
    ),
  );
}

p1() async {
  const url =
      'https://players.brightcove.net/6016595237001/default_default/index.html?videoId=6064996435001';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

p2() async {
  const url =
      'https://players.brightcove.net/6016595237001/default_default/index.html?videoId=6087413340001';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

p3() async {
  const url =
      'https://players.brightcove.net/6016595237001/default_default/index.html?videoId=6138778857001';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

asknow() async {
  const url = 'https://forms.gle/CRY2H3kUKGCoFy3z8';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

website() async {
  const url = 'https://www.badabusiness.com/dd/BIYK005702/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

call() async {
  const url = 'tel:+91 7549135542';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> _shareT() async {
  try {
    Share.text(
        'Dr vivek bindra ',
        ' https://play.google.com/store/apps/details?id=com.yashvendra.kumar welcome in bada business pvt ltd https://www.badabusiness.com/dd/BIYK005702/ Bada Business Consutant  ',
        'text/plain');
  } catch (e) {
    print('error: $e');
  }
}
