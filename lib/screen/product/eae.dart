// import 'package:badabusiness/shho/jeans.dart';
import 'dart:async';

import 'package:badabusiness/screen/registration/payment.dart';
import 'package:badabusiness/screen/registration/registration.dart';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Eae extends StatelessWidget {
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
                      "BCP videos showcase",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 190,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('eaedemo')
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
                  // InkWell(
                  //   onTap: () {
                  //     // Navigator.of(context).push(
                  //     //     MaterialPageRoute(builder: (context) => Eaetext()));
                  //   },
                  //   child: Card(
                  //     color: Colors.white,
                  //     child: Container(
                  //       margin: EdgeInsets.only(
                  //           left: 25, bottom: 10, top: 10, right: 10),
                  //       height: 70,
                  //       child: Center(
                  //         child: Text(
                  //           "Every Entrepreneur's goals/problems",
                  //           style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: 20,
                  //             fontWeight: FontWeight.w900,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     // Navigator.of(context).push(
                  //     //     MaterialPageRoute(builder: (context) => Bullet()));
                  //   },
                  //   child: Card(
                  //     color: Colors.white,
                  //     child: Container(
                  //       margin: EdgeInsets.only(
                  //           left: 25, bottom: 10, top: 10, right: 10),
                  //       child: Center(
                  //         child: Text(
                  //           "For Every Entrepreneur showecase some 150+ bullet Point ans 600+ coverd In EAE Program ",
                  //           style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: 20,
                  //             fontWeight: FontWeight.w900,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     // Navigator.of(context).push(
                  //     //     MaterialPageRoute(builder: (context) => Eaet()));
                  //   },
                  //   child: Card(
                  //     color: Colors.white,
                  //     child: Container(
                  //       margin: EdgeInsets.only(
                  //           left: 25, bottom: 10, top: 10, right: 10),
                  //       child: Center(
                  //         child: Text(
                  //           " EAE (Everything About Entrepreneurship) For Businessman, Solopreneures,  Entrepreneur's goals/problems",
                  //           style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: 20,
                  //             fontWeight: FontWeight.w900,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     // Navigator.of(context).push(
                  //     //     MaterialPageRoute(builder: (context) => Eaet()));
                  //   },
                  //   child: Card(
                  //     color: Colors.white,
                  //     child: Container(
                  //       margin: EdgeInsets.only(
                  //           left: 25, bottom: 10, top: 10, right: 10),
                  //       child: Center(
                  //         child: Text(
                  //           " EAE (Everything About Entrepreneurship) For wantrepreneure, Freelauncer, Professanal and students",
                  //           style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: 20,
                  //             fontWeight: FontWeight.w900,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {},
                    child: Card(
                      color: Colors.yellow[100],
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 25, bottom: 10, top: 10, right: 10),
                        child: Center(
                          child: Text(
                            "For Increae your Business Purchase BCP Course ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Image.network(
                      'https://assets.badabusiness.com/1020/bcp-post-700x420-01-v1629816273.gif'),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        'Business Coaching Program (BCP)  What will you get ',
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
                        'Topic based crisp and practical steps thruogh premium Videos, Assignments, Projects, QnA  It is the world’s most affordable Business Coaching Program (BCP)  .It will help Indian SME’s to do big business or become Bada Business.',
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  Center(
                      child: Image.network(
                          'https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/whatyouget_1.png')),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        'World’s Most Affordable, Globally Accessible and Readily Available Premium Program in Hindi, reading material for easy implementation , MCQs based assessment sheets to track your daily progress & MCQs based assessment sheets to track your daily progress',
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  Center(
                      child: Image.network(
                          'https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/whatyouget_2.png')),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        'Business Coaching Programs are specially designed courses to give holistic view of business operations that will enable you to build high-performing business frameworks, curate powerful strategies that will drive innovation and boost profitable growth with the hand-holding support of a personalized Business Coach  Live in-person Training with Dr.Vivek Bindra (Delhi and Mumbai) and 25 strategy frameworks for popular & most successful Leadership funnel',
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  Center(
                      child: Image.network(
                          'https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/whatyouget_3.png')),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        '''Foundation Course

Develop Foundational skills critical for business via Structured Business Frameworks, Case-studies, and in-depth Video Tutorials that support the unique needs of Entrepreneurs and Solopreneurs.
Benifits

    Live Sessions with Dr. Vivek Bindra.
    260+ Premium Business Videos
    Exclusive Business Courses in Hindi
''',
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  Center(
                      child: Image.network(
                          'https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/whatyouget_4.png')),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        '''Specialization

Our Specialized courses are directly linked to your unique business burning problems and are delivered through a range of virtual and in-person blended formats.
Benifits

    Live Sessions with Dr. Vivek Bindra.
    260+ Premium Business Videos
    Exclusive Business Courses in Hindi
''',
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  Center(
                      child: Image.network(
                          'https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/whatyouget_5.png')),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        '''Value Packs

Build the entrepreneurial leadership skills you need to take your business through its next phase of growth and success with our Exclusive Value Packs that are customized to solve all your burning problems.
Benifits

    Self-Paced Courses
    Learn from the Experts
    Solutions to Every Business Problem

    Personalized Business Coach
250+ exclusive video tutorials & case studies
Live Sessions with Dr. Vivek Bindra
Effective Structured Business Programs

''',
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  Center(
                      child: Image.network(
                          'https://www.badabusiness.com/assets/goldenweekoftheyearnew/images/whatyouget_6.png')),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.yellow.shade100, Colors.white])),
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                        child: Text(
                          "- क्या आप अपने व्यवसाय को कई गुना बढ़ाना चाहते हैं?\n\n- क्या आप अपनी व्यावसायिक समस्याओं को हल करने के लिए रणनीतियों की खोज कर रहे हैं?\n\n- क्या कोरोना की वजह से अर्थव्यवस्था में मंदी आई है, जिसने आपके व्यवसाय को प्रभावित किया है?\n\n- क्या आप विभिन्न भौगोलिक क्षेत्रों में अपने व्यवसाय का विस्तार करना चाहते हैं?\n\n- क्या आप अपना व्यवसाय लाभप्रद रूप से बढ़ाना चाहते हैं?\n\n- क्या आप प्रख्यात बिजनेस लीडर्स और इंडस्ट्री एक्सपर्ट्स से बिजनेस स्ट्रैटेजीज सीखने की ख्वाहिश रखते हैं?\n\n\n  Business coaching Program course is the World’s Most Affordable Complete Business Management Program in Hindi. BPC App based learning program, now Learn Anytime, Anywhere only on Bada Business Application.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
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

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  String url;
  SplashScreen(
    Key? key,
    this.url,
  ) : super(key: key);

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
              "assets/2.png.png",
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
                          tag: 'eae',
                          child: Image.asset("assets/images/i11.png")),
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
