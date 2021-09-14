import 'dart:ui';

import 'package:badabusiness/screen/registration/payment.dart';
import 'package:badabusiness/screen/registration/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
// import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:shimmer/shimmer.dart';
//import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

// ignore: must_be_immutable
class Cfull extends StatefulWidget {
  String url;
  String link;
  String name;
  String des;

  Cfull(this.url, this.link, this.name, this.des);

  @override
  _CfullState createState() => _CfullState();
}

class _CfullState extends State<Cfull> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    initPlatformState();
  }

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

  // void playYoutubeVideo(String link) {
  //   FlutterYoutube.playYoutubeVideoByUrl(
  //     apiKey: "AIzaSyDkFglQqKScd51nSR1TKkn5se28y4GhMd4",
  //     videoUrl: link,
  //     backgroundColor: Colors.yellow[50],
  //     fullScreen: true,
  //     autoPlay: true,
  //     appBarVisible: false,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          primary: true,
          slivers: <Widget>[
            SliverAppBar(
                backgroundColor: Colors.orange[50],
                iconTheme: IconThemeData(color: Colors.yellow),
                expandedHeight: 250,
                centerTitle: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'Call Now +91 7549135542 ',
                    style: TextStyle(
                      backgroundColor: Colors.orange.shade50.withOpacity(.5),
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true,
                  background: Hero(
                    tag: widget.url,
                    child: Image.network(
                      widget.url,
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Card(
                      elevation: 10,
                      shadowColor: Colors.orange[300],
                      child: conn(context)),
                  // InkWell(
                  //   onTap: () {
                  // FlutterOpenWhatsapp.sendSingleMessage("91 8887694282",
                  //     "Welcome Sir in Bada Business   https://www.badabusiness.com/dd/BIYK005702/   8887694282 thanks for contact bada business . Grow your business as well ass career with Dr Vivek Bindra Sir  ");
                  //   },
                  //   child: Card(
                  //     child: Container(
                  //       color: Colors.green,
                  //       height: 50,
                  //       child: Center(
                  //         child: Text(
                  //           "Whatsapp Now",
                  //           style: TextStyle(
                  //               color: Colors.black,
                  //               fontSize: 20,
                  //               fontWeight: FontWeight.w900),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  InkWell(
                    child: Card(
                      elevation: 20,
                      shadowColor: Colors.orange[100],
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.center,
                                  colors: [
                                    Colors.yellow.shade100,
                                    Colors.white
                                  ])),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 25, bottom: 10, top: 10, right: 10),
                            child: Center(
                              child: Shimmer.fromColors(
                                baseColor: Colors.black,
                                highlightColor: Colors.yellow.shade700,
                                loop: 700,
                                enabled: true,
                                child: Text(
                                  "${widget.name} \n\nCall Now: +91 7549135542",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    shadowColor: Colors.orange[100],
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.center,
                              colors: [
                            Colors.yellow.shade50,
                            Colors.white,
                          ])),
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 25, bottom: 10, top: 10, right: 10),
                          child: Center(
                              child: Text(
                            widget.des,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                          ))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      // register();
                    },
                    child: Card(
                      color: Colors.green[700],
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 25, bottom: 10, top: 10, right: 10),
                        child: Center(
                          child: Text(
                            "Register Now for Joining",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // String url =
                      //     'https://www.badabusiness.com/dd/BIYK005702/';

                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => SplashScreen(url)));
                    },
                    child: Container(
                        height: 300,
                        child: Image.asset(
                          "assets/bada.png",
                          fit: BoxFit.fill,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Image.network(
                        'https://payments.badabusiness.com/images/badabusinesslogo1.png'),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

register() async {
  const url = 'https://www.badabusiness.com/dd/BIYK005702/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget conn(BuildContext context) {
  return Container(
    height: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: <Color>[Colors.orange.shade100, Colors.white]),
    ),
    margin: EdgeInsets.all(10),
    child: Row(
      children: [
        Expanded(flex: 1, child: Image.asset("assets/images/i6.png")),
        Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[Colors.yellow.shade100, Colors.white]),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: InkWell(
                            onTap: () {
                              FlutterOpenWhatsapp.sendSingleMessage(
                                  "91 7549135542",
                                  "Welcome Sir in Bada Business   https://www.badabusiness.com/dd/BIYK005702/   thanks for contact bada business . Grow your business as well ass career with Dr Vivek Bindra  \n- Purshotam Kumar \n (Senior Buisness Consultant) \n +91 7549135542  purshotambussinessconsultant@gmail.com");
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "Whatsapp Now",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )),
                      Expanded(child: Image.asset("assets/what.png"))
                    ],
                  ),
                )),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Registration()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            Colors.yellow.shade100,
                            Colors.white
                          ]),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "Registration",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                        Expanded(child: Image.asset("assets/images/i8.png"))
                      ],
                    ),
                  ),
                )),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Paymentt()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            Colors.yellow.shade100,
                            Colors.white
                          ]),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "Learning",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                        Expanded(child: Image.asset("assets/images/i18.png"))
                      ],
                    ),
                  ),
                )),
              ],
            )),
      ],
    ),
  );
}
