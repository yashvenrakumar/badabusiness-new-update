// import 'package:badabusiness/shho/jeans.dart';
import 'dart:async';
import 'package:badabusiness/screen/payoutscreen/others/fullimage.dart';
import 'package:badabusiness/screen/registration/payment.dart';
//import 'package:badabusiness/trust/full.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Ltm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_element
    void playYoutubeVideo(String namee) {
      FlutterYoutube.playYoutubeVideoByUrl(
        apiKey: "AIzaSyDkFglQqKScd51nSR1TKkn5se28y4GhMd4",
        videoUrl: namee,
        backgroundColor: Colors.yellow[50],
        fullScreen: true,
        autoPlay: true,
        appBarVisible: false,
      );
    }

    return SafeArea(
      child: Material(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              floating: true,
              delegate: MySliverAppBar(
                expandedHeight: 180,
              ),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    height: 70,
                  ),
                  InkWell(
                    onTap: () {
                      // String url =
                      //     'https://docs.google.com/forms/d/e/1FAIpQLSd3qDnUlt3BsKCkHbM0Jq4isXtcldUAP6dhEmF2nanK70FEGQ/viewform';

                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => SplashScreen(url)));
                    },
                    child: Card(
                      color: Colors.yellow[700],
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 25, bottom: 10, top: 10, right: 10),
                        child: Center(
                          child: Text(
                            "Life Time Membership (LTM)  7549135542",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 23,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Paymentt()));
                      },
                      child: Container(
                        margin: EdgeInsets.all(6),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Colors.green.shade100,
                              Colors.green.shade50
                            ])),
                            child: Container(
                                height: 50,
                                // width: MediaQuery.of(context).size.width - 10,
                                child: Center(
                                    child: Text(
                                  "Enhance Learning 👨‍👩‍👧‍👦",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ))),
                          ),
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        '\n1. Life Time Membership\n2. Life Time benefits  \n3. Life Time Business Growth',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ))),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        'When you become a Life-time member of Bada Business you get: Call Now  7549135542',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  InkWell(
                    onTap: () {
                      String url =
                          "https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/lifetime_gra.png";
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Full(url)));
                    },
                    child: Image.network(
                        'https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/lifetime_gra.png'),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        '\n1.  Lifetime access to EAE Program\n2.  Opportunity to attend 2 EAE Events\n3.  Lifetime access to Aladdin Ka Chirag',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ))),
                  InkWell(
                    onTap: () {
                      String url =
                          "https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/chirag_img.png";
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Full(url)));
                    },
                    child: Image.network(
                        'https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/chirag_img.png'),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        'Aladdin Ka Chirag: A Library of Readymade 600 Downloadable Templates, Forms, Frameworks, Strategy Sheets, Checklists and other tools related to all the departments in a Business – HR, Accounting, Legal, Marketing, Finance, Strategy and Product Development etc.',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        'Everything About Entrepreneurship  What will you get : Call Now 8887694282',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ))),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        'Topic based crisp and practical steps thru premium Videos, Assignments, Projects, QnA',
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  InkWell(
                    onTap: () {
                      String url =
                          "https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/whatyouget_1.png";
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Full(url)));
                    },
                    child: Center(
                        child: Image.network(
                            'https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/whatyouget_1.png')),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        'World’s Most Affordable, Globally Accessible and Readily Available Premium Program in Hindi',
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  InkWell(
                    onTap: () {
                      String url =
                          "https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/whatyouget_2.png";
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Full(url)));
                    },
                    child: Center(
                        child: Image.network(
                            'https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/whatyouget_2.png')),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        '5 Day Live in-person Training with Dr.Vivek Bindra (Delhi and Mumbai)',
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  InkWell(
                    onTap: () {
                      String url =
                          "https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/whatyouget_3.png";
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Full(url)));
                    },
                    child: Center(
                        child: Image.network(
                            'https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/whatyouget_3.png')),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        '2 Year App based Learning Program',
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  InkWell(
                    onTap: () {
                      String url =
                          "https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/whatyouget_4.png";
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Full(url)));
                    },
                    child: Center(
                        child: Image.network(
                            'https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/whatyouget_4.png')),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        '664 Premium, Exclusive Videos (not publically available)',
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  InkWell(
                    onTap: () {
                      String url =
                          "https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/whatyouget_5.png";
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Full(url)));
                    },
                    child: Center(
                        child: Image.network(
                            'https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/whatyouget_5.png')),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        '24 Digital Live Sessions and QnA with Dr. Bindra',
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  InkWell(
                    onTap: () {
                      String url =
                          "https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/whatyouget_6.png";
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Full(url)));
                    },
                    child: Center(
                        child: Image.network(
                            'https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/whatyouget_6.png')),
                  ),
                  InkWell(
                    onTap: () {
                      String url =
                          "https://firebasestorage.googleapis.com/v0/b/badabusiness-6ec0b.appspot.com/o/ltm%2Fcanvas24.png?alt=media&token=2d775879-fa0a-43d4-8a9f-2433f68fd90e";
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Full(url)));
                    },
                    child: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/badabusiness-6ec0b.appspot.com/o/ltm%2Fcanvas24.png?alt=media&token=2d775879-fa0a-43d4-8a9f-2433f68fd90e'),
                  ),
                  InkWell(
                    onTap: () {
                      String url =
                          "https://firebasestorage.googleapis.com/v0/b/badabusiness-6ec0b.appspot.com/o/ltm%2Fcanvas25.png?alt=media&token=b07e7246-bc52-4d14-ab94-e1e85c51d697";
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Full(url)));
                    },
                    child: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/badabusiness-6ec0b.appspot.com/o/ltm%2Fcanvas25.png?alt=media&token=b07e7246-bc52-4d14-ab94-e1e85c51d697'),
                  ),
                  InkWell(
                    onTap: () {
                      String url =
                          "https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/web_bnr.jpg";
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Full(url)));
                    },
                    child: Image.network(
                        'https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/web_bnr.jpg'),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => Ltmt()));
                    },
                    child: Card(
                      color: Colors.yellow[700],
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 25, bottom: 10, top: 10, right: 10),
                        child: Center(
                          child: Text(
                            "Click Now for More Details..",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      register();
                      // String url =
                      //     'https://www.badabusiness.com/dd/BIYK005702/';

                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => SplashScreen(url)));
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
                  SizedBox(
                    height: 200,
                  )
                ],
              ),
            ),
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

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  String url;
  SplashScreen(this.url);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => WebViewContainer(widget.url))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Center(
                child: Image.asset(
              'assets/bada.png',
              fit: BoxFit.contain,
            )),
            Container(
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.yellow,
                  strokeWidth: 5,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              ' please Wait...',
              style: TextStyle(color: Colors.yellow, fontSize: 25),
            )
          ],
        ));
  }
}

class WebViewContainer extends StatefulWidget {
  final url;

  WebViewContainer(this.url);
  @override
  createState() => _WebViewContainerState(
        this.url,
      );
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _url;

  final _key = UniqueKey();
  _WebViewContainerState(
    this._url,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                child: _url != null
                    ? WebView(
                        key: _key,
                        javascriptMode: JavascriptMode.unrestricted,
                        initialUrl: _url,
                      )
                    : Container(
                        color: Colors.amber,
                        child: Center(child: CircularProgressIndicator()),
                      ))
          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,

          // ignore: deprecated_member_use
          overflow: Overflow.visible,
          children: [
            Image.asset(
              "assets/4.png.png",
              fit: BoxFit.cover,
            ),
            Center(
              child: Opacity(
                opacity: shrinkOffset / expandedHeight,
                child: Text(
                  "LTM",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                  ),
                ),
              ),
            ),
            Positioned(
              top: expandedHeight / 4 - shrinkOffset,
              left: MediaQuery.of(context).size.width / 6,
              child: Opacity(
                opacity: (1 - shrinkOffset / expandedHeight),
                child: Card(
                  elevation: 10,
                  child: SizedBox(
                    height: expandedHeight,
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topLeft,
                            colors: <Color>[
                              Colors.orange.shade50,
                              Colors.white
                            ]),
                      ),
                      child: Hero(
                          tag: 'ltm',
                          child: Image.asset("assets/images/i12.png")),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

webs() async {
  const url = 'https://www.badabusiness.com/dd/BIYK005702/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
