// import 'package:badabusiness/shho/jeans.dart';
import 'dart:async';
//import 'package:badabusiness/trust/full.dart';
import 'package:badabusiness/screen/registration/payment.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Psc extends StatelessWidget {
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
                  // InkWell(
                  //   onTap: () {
                  //     // Navigator.of(context)
                  //     //     .push(MaterialPageRoute(builder: (context) => Community()));
                  //   },
                  //   child: Container(
                  //     margin: EdgeInsets.fromLTRB(20, 0, 0, 3),
                  //     child: Text(
                  //       "Business Management Technique",
                  //       style: TextStyle(
                  //           fontSize: 15,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.yellow[700]),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   height: 170,
                  //   child: StreamBuilder<QuerySnapshot>(
                  //       stream: Firestore.instance
                  //           .collection('management')
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
                  //           height: 150,
                  //           child: ListView(
                  //             scrollDirection: Axis.horizontal,
                  //             children: snapshot.data.documents
                  //                 .map<Widget>((DocumentSnapshot document) {
                  //               String namee = document['url'];
                  //               // String name = document['name'];
                  //               String link = document['link'];
                  //               return SingleChildScrollView(
                  //                 child: InkWell(
                  //                   onTap: () {
                  //                     playYoutubeVideo(link);
                  //                     Navigator.of(context).push(
                  //                         MaterialPageRoute(
                  //                             builder: (context) => Regi()));
                  //                   },
                  //                   child: Container(
                  //                     // height: 250,
                  //                     width: 240,
                  //                     color: Colors.white,
                  //                     margin: EdgeInsets.all(5),
                  //                     child: Column(
                  //                       children: [
                  //                         ClipRRect(
                  //                           borderRadius:
                  //                               BorderRadius.circular(6),
                  //                           child: Container(
                  //                             height: 150,
                  //                             width: MediaQuery.of(context)
                  //                                 .size
                  //                                 .width,
                  //                             child: new FadeInImage(
                  //                               image: new NetworkImage(namee),
                  //                               fit: BoxFit.fill,
                  //                               placeholder: new AssetImage(
                  //                                 "assets/lo.gif",
                  //                               ),
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ],
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

                  Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/badabusiness-6ec0b.appspot.com/o/gif%2Fpsc.gif?alt=media&token=b729dbd7-3aa9-4cff-9a01-1d10127a4cdb'),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Colors.white,
                        Colors.yellow.shade50,
                        Colors.white
                      ])),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 25, bottom: 10, top: 10, right: 10),
                        child: Center(
                          child: Text(
                            "Problem Solving Courses (PSC) \n- क्या आप अपनी दैनिक जलती हुई व्यावसायिक समस्याओं का समाधान खोजना चाहते हैं?\n\n- क्या आप अपने व्यवसाय के प्रभारी / नियंत्रक होने के लिए एक ऑपरेटर होने से दूर जाना चाहते हैं?\n\n- क्या आप अपने व्यवसाय / उत्पादों के विपणन के लिए प्रभावी रणनीति सीखना चाहते हैं?\n\n- क्या आप अपने व्यवसाय में स्वचालन शुरू करना चाहते हैं?\n\n- क्या आप अपने व्यवसाय के लिए सही वित्तीय / निवेश निर्णय लेना चाहते हैं?\n\n- क्या आप नए ग्राहक हासिल करना चाहते हैं और मदद की जरूरत है?\n\n- क्या आप गला काट प्रतियोगिता में कामयाब होने के लिए रणनीति सीखना चाहते हैं?",
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

                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        'Solving Burning problems of Entrepreneurs through learning or where there is a Business Problem, there is a Problem Solving Course ',
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
                        'Problem Solving Course',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ))),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        '➔ These courses are designed to give practical solution & a learning experience to the most common, frequent and prominent business problems faced by Entrepreneurs. We call them as Burning Problems.\n➔  Every course gives you step by step learning strategies, frameworks, and action plan, all focused & directed to overcome problems around various business functions like business Finance, IT, HR, Sales, Digital Marketing,Legal etc.\n➔  The goal is to Empower Entrepreneurs with solutions to their daily problems of life with the help of these courses so that they are able to grow their Business.',
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  Center(
                      child: Image.network(
                          'https://www.badabusiness.com/images/problem_solving.png')),

                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 10),
                      child: Center(
                          child: Text(
                        'EASE and Simplicity',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ))),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 3, right: 10),
                      child: Center(
                          child: Text(
                        '➔ The only course content in digital domain in Hindi and easy to understand language.\n➔  The course will be released in vernacu-lar languages.\n➔  For a better learning experience and outcome, every course has a combination of graphics, videos, animation, reading material and assesments.',
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  Center(
                      child: Image.network(
                          'https://www.badabusiness.com/images/ease_simplicity.png')),

                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 3, right: 10),
                      child: Center(
                          child: Text(
                        'Accessbility & Convenience',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ))),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 3, right: 10),
                      child: Center(
                          child: Text(
                        '➔ Self Paced Courses that can be accessed anytime & anywhere with the help of Bada Business APP.',
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  Center(
                      child: Image.network(
                          'https://www.badabusiness.com/images/accesibility.png')),

                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 3, right: 10),
                      child: Center(
                          child: Text(
                        'Bestinclass Instructor',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ))),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 12, right: 10),
                      child: Center(
                          child: Text(
                        '➔ We hand pick experts from different fields in order to deliver the best content.',
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  Center(
                      child: Image.network(
                          'https://www.badabusiness.com/images/best_in_class.png')),

                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 3, right: 10),
                      child: Center(
                          child: Text(
                        'Course Content',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ))),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 3, right: 10),
                      child: Center(
                          child: Text(
                        '➔ Each video in the course contains solution to specific problems faced by Businessmen.\n➔ Courses also includes case studies to help and understand how top businesses of our country overcome such problems.\n➔  Industry specific courses empowering you with the required skill sets, Management principles & practices.\n➔  Easy to understand using lay-mans language.',
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  Center(
                      child: Image.network(
                          'https://www.badabusiness.com/images/course_content.png')),

                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 3, right: 10),
                      child: Center(
                          child: Text(
                        'Knowledge Checks',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ))),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, bottom: 10, top: 3, right: 10),
                      child: Center(
                          child: Text(
                        '➔ Every chapter of the course contains knowledge checks to keep a track of your progress to ensure a better outcome.',
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                  Center(
                      child: Image.network(
                          'https://www.badabusiness.com/images/knowledge_check.png')),

                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Colors.white,
                        Colors.yellow.shade50,
                        Colors.white
                      ])),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 25, bottom: 10, top: 10, right: 10),
                        child: Center(
                          child: Text(
                            "Nice Analysis\nThousands of our Leadership Funnel clients shared their Need, Interest, Concern & Expectation from the program. The summary of all such responses were segregated into\nStrategic Problem: Fundamental issues in Business. Setting Mission, Vision and Strategy.\n➔ Functional Problem: Problems pertaining to core functions like Finance, IT, Marketing, HR, Legal etc.\n➔ The Entrepreneurs' need of diving deep and getting solutions to core functional problems resulted in Problem Solving Courses.\n\n2. Nal Problem\n➔  FINANCE: Managing Cash Flow, Raising Funds, Managing Working Capital.\n➔  IT: Reducing People Dependency, Forecasting, Planning.\n➔  HR: Hiring, Retention and Employee Engagement\n➔  MARKETING: Budgeting, Finding the right marketing mix and strategy.\n➔  LEGAL: Agreements, Copyrights, Trademarks, Intellectual Property protection.\n➔  SALES: Increasing Sales, Franchise, Distributionship, Conversion Ratio.\n\n\n3. Challenges in entrepreneurial Skill development\n➔ FACULTY: Inability to attract practitioners/experts from the same industry for training.\n➔ PRESENCE: Unavailability of experts in Tier 2/3 cities and Limited mobility between skill and learning options.\n➔ LANGUAGE: Often such courses are only available in English which doesn't appeal to many SMEs.\n➔ PRICING: Such course demand heavy fees which makes them unaffordable to many entrepreneurs.\n\n\n4. The Solution\n➔  Pocket Freindly, To the point learning solutions to grow your Business.\n➔ For every Business Problem, Bada Business Has a Problem Solving Course.\n\n\nProblem Solving Courses are designed to give practical solutions & learning to the most important burning problems faced by Entrepreneurs.If you are interested in starting your own business or want to expand your existing business, but, are facing specific challenges, you can buy these courses.",
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
              "assets/3.png.png",
              fit: BoxFit.cover,
            ),
            Center(
              child: Opacity(
                opacity: shrinkOffset / expandedHeight,
                child: Text(
                  "Psc",
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
                          tag: 'psc',
                          child: Image.asset("assets/images/i16.png")),
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
