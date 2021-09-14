// import 'package:badabusiness/shho/jeans.dart';
import 'dart:async';
import 'package:badabusiness/screen/payoutscreen/others/fullimage.dart';
import 'package:badabusiness/screen/registration/registration.dart';
//import 'package:badabusiness/trust/full.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Ibc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 3),
                    child: Text(
                      "IBC videos showcase",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 190,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('ibcdemo')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          }
                          return Container(
                            color: Colors.white,
                            height: 170,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: snapshot.data!.docs
                                  .map<Widget>((DocumentSnapshot document) {
                                String url = document['url'];
                                // String name = document['name'];
                                String link = document['link'];

                                return SingleChildScrollView(
                                  child: InkWell(
                                    onTap: () {
                                      playYoutubeVideo(link);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Registration()));

                                      // Navigator.of(context).push(MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         Cfull(url, link, name, des)));
                                    },
                                    child: Container(
                                      // height: 250,
                                      width: 280,
                                      color: Colors.white,
                                      margin: EdgeInsets.all(5),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              child: Container(
                                                height: 170,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
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
                  SizedBox(
                    height: 10,
                  ),
                  // Container(
                  //   height: 70,
                  //   child: StreamBuilder<QuerySnapshot>(
                  //       stream: Firestore.instance
                  //           .collection('afm')
                  //           .document('sXvYANpl7hzWIelcZac1')
                  //           .collection('jeans')
                  //           .snapshots(),
                  //       builder: (BuildContext context,
                  //           AsyncSnapshot<QuerySnapshot> snapshot) {
                  //         if (snapshot.hasError) {
                  //           return Center(
                  //             child: Text('Error: ${snapshot.error}'),
                  //           );
                  //         }
                  //         return Container(
                  //           color: Colors.white,
                  //           child: ListView(
                  //             scrollDirection: Axis.horizontal,
                  //             children: snapshot.data.documents
                  //                 .map<Widget>((DocumentSnapshot document) {
                  //               String url = document['url'];
                  //               // String name = document['name'];
                  //               // String link = document['link'];

                  //               return SingleChildScrollView(
                  //                 child: InkWell(
                  //                   onTap: () {
                  //                     Navigator.of(context).push(
                  //                         MaterialPageRoute(
                  //                             builder: (context) => Jeans()));
                  //                   },
                  //                   child: Container(
                  //                     height: 70,
                  //                     width: 80,
                  //                     color: Colors.white,
                  //                     child: FadeInImage(
                  //                       image: new NetworkImage(url),
                  //                       fit: BoxFit.fill,
                  //                       placeholder: new AssetImage(
                  //                         "assets/lo.gif",
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               );
                  //             }).toList(),
                  //           ),
                  //         );
                  //       }),
                  // ),

                  InkWell(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => Paymentt()));
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
                            "Become an Independent Business Consultant (IBC) :  7549135542",
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
                      register();
                    },
                    child: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/badabusiness-6ec0b.appspot.com/o/gif%2Fibc.gif?alt=media&token=a2c7f7f4-f37b-44d8-b4ee-6f7e725e24c6'),
                  ),
                  Container(
                      // decoration: BoxDecoration(
                      //     gradient: LinearGradient(
                      //         colors: [Colors.yellow[100], Colors.white])),
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        'Partner with Bada Business by becoming a part-time of full-time business consultant.\n Get an Opportunity to Earn Rs1 – Rs10 Lakh per month that too at a Very Low Capital Investment\n Support from Bada Business',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        '1. ERP  and CRM Support \n2. Mobile App Support \n3. New Product Trainings \n4. Support from nearby Regional Channel Partner  \n5. Opportunity to Participate in Brand Events \n6. Lucrative and Aggressive income slabs\n7. Opportunity to Meet and interact with Dr Vivek Bindra!',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ))),
                  InkWell(
                    onTap: () {
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => Ibct()));
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
                    height: 20,
                  ),
                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.yellow.shade50])),
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          "Become an Independent Business Consultant (IBC)\n\n- क्या आप आय का एक नियमित स्रोत बनाना चाहते हैं?\n- क्या आप खुद के बॉस बनना चाहते हैं?\n- क्या आप कम निवेश के साथ अपना खुद का व्यवसाय शुरू करना चाहते हैं?\n- क्या आप कोई व्यवसाय शुरू करना चाहते हैं और ज्ञान प्राप्त करना चाहते हैं?\n- क्या आप उसी समय सीखना और अर्जित करना चाहते हैं?\n\n\n\n-Become an IBC, Learn and Earn at your convenience - Part-time or Full-time.\n-Earn Rs1 Lakh – Rs20 Lakh per month that too at a Very Low Investment!\n\n    IBC Benefites\n\n-Opportunity to earn 1 to 10 lacs per month\n-Opportunity to be recognised in Dr Vivek Bindra’s world record creating mass digital webinars and you tube videos\n-Market relevant & most affordable entrepreneurship product basket (EAE, PSC & LTM)\n-High revenue earning product for sales - Case studies and white labelled Learning Management System for educational institutions and businesses\n- Periodic webinar by Dr Vivek Bindra.\n- Personalised micro website creating digital identity to facilitate sales \n- Track Of Your LearningsDigital POS (point of sale) for taking payment, tracking sales leads, generating payment links for customers & viewing all account related details\n- Learning Management System for all product information, marketing collaterals and growth through self-learning\n- Complaint management system (CMS) to raise requests & complaints or to give suggestions\n- Dedicated IBC managers to train on product & sales techniques - how to generate (through digital marketing or other techniques), nurture and close leads",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      String url =
                          "https://firebasestorage.googleapis.com/v0/b/badabusiness-6ec0b.appspot.com/o/ibc%2Fcanvas4.png?alt=media&token=b3dadaea-a4cb-4e25-bc3b-a2453d0b9c9a";
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Full(url)));
                    },
                    child: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/badabusiness-6ec0b.appspot.com/o/ibc%2Fcanvas4.png?alt=media&token=b3dadaea-a4cb-4e25-bc3b-a2453d0b9c9a'),
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
              "assets/1.png.png",
              fit: BoxFit.cover,
            ),
            Center(
              child: Opacity(
                opacity: shrinkOffset / expandedHeight,
                child: Text(
                  "IBC",
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
                          tag: 'ibc',
                          child: Image.asset("assets/images/i10.png")),
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
