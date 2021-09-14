import 'dart:async';
import 'package:badabusiness/screen/payoutscreen/others/fullimage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Cs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Full(css[index].toString())));
                    },
                    child: Hero(
                      tag: css[index],
                      child: FadeInImage(
                        image: new NetworkImage(css[index]),
                        fit: BoxFit.fill,
                        placeholder: new AssetImage(
                          "assets/lo.gif",
                        ),
                      ),
                    ),
                  ),
                ),
                childCount: css.length,
              ),
              itemExtent: 250,
            ),
          ],
          // slivers: [
          //   SliverPersistentHeader(
          //     floating: true,
          //     delegate: MySliverAppBar(
          //       expandedHeight: 180,
          //     ),
          //     pinned: true,
          //   ),
          //   SliverList(
          //     delegate: SliverChildListDelegate(
          //       [
          //         SizedBox(
          //           height: 70,
          //         ),
          //         Container(
          //             margin: EdgeInsets.only(
          //                 left: 25, bottom: 10, top: 10, right: 10),
          //             child: Center(
          //                 child: Text(
          //               'Bada Business is regarded as an authority in producing Business Case Studies in an engaging and impressive Video format by Dr. Vivek Bindra – Founder & CEO of Bada Business Pvt Ltd.Our Case studies are based on an in-depth study of your product/service along with competitive analysis.USPs of Case Studies by Dr Vivek Bindra',
          //               style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 20,
          //                   fontWeight: FontWeight.bold),
          //             ))),
          //         Container(
          //             margin: EdgeInsets.only(
          //                 left: 25, bottom: 10, top: 10, right: 10),
          //             child: Center(
          //                 child: Text(
          //               '\n1. Case Study in a Story Format  \n2.   Strong Call-to-Action  \n3.   Reusable for Future Marketing Reach  \n4.   Huge Reach: 13+ Million followers on YouTube and 5+Million Followers on Facebook  \n5.   Highest Brand Recall  \n6.   Engage the right Target Audience \n7.   Qualified Lead Flow',
          //               style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 18,
          //                   fontWeight: FontWeight.w400),
          //             ))),
          //         Container(
          //             margin: EdgeInsets.only(
          //                 left: 25, bottom: 10, top: 10, right: 10),
          //             child: Center(
          //                 child: Text(
          //               'Case-Study Program',
          //               style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 20,
          //                   fontWeight: FontWeight.bold),
          //             ))),
          //         Container(
          //           child: ListView.builder(
          //               scrollDirection: Axis.horizontal,
          //               itemCount: 2,
          //               itemBuilder: (BuildContext context, int index) {
          //                 return InkWell(
          //                   onTap: () {
          //                     Navigator.of(context).push(MaterialPageRoute(
          //                         builder: (context) => Full(css[index])));
          //                   },
          //                   child: Container(
          //                     child: Column(
          //                       children: [
          //                         Expanded(
          //                           child: Container(
          //                             margin:
          //                                 EdgeInsets.only(left: 7, right: 7),
          //                             child: ClipRRect(
          //                               borderRadius: BorderRadius.circular(10),
          //                               child: css[index].isEmpty
          //                                   ? CircularProgressIndicator()
          //                                   : Hero(
          //                                       tag: css[index],
          //                                       child: FadeInImage(
          //                                         image: new NetworkImage(
          //                                             css[index]),
          //                                         fit: BoxFit.fill,
          //                                         placeholder: new AssetImage(
          //                                           "assets/lo.gif",
          //                                         ),
          //                                       ),
          //                                     ),
          //                             ),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 );
          //               }),
          //         ),
          //         SizedBox(
          //           height: 20,
          //         ),
          //         InkWell(
          //           onTap: () {
          //             register();
          //             // String url =
          //             //     'https://www.badabusiness.com/dd/BIYK005702/';

          //             // Navigator.of(context).push(MaterialPageRoute(
          //             //     builder: (context) => SplashScreen(url)));
          //           },
          //           child: Card(
          //             color: Colors.green[700],
          //             child: Container(
          //               margin: EdgeInsets.only(
          //                   left: 25, bottom: 10, top: 10, right: 10),
          //               child: Center(
          //                 child: Text(
          //                   "Register Now for Joining",
          //                   style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 22,
          //                       fontWeight: FontWeight.w900),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //         SizedBox(
          //           height: 200,
          //         )
          //       ],
          //     ),
          //   ),
          // ],
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
              "assets/5.png.png",
              fit: BoxFit.cover,
            ),
            Center(
              child: Opacity(
                opacity: shrinkOffset / expandedHeight,
                child: Text(
                  "Case-Study",
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
                          tag: 'cs',
                          child: Image.asset("assets/images/i15.png")),
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

List<String> css = [
  "https://miro.medium.com/max/1400/1*HZlT7QEDYLM8lFjFnPM0VA.png",
  "https://miro.medium.com/max/1400/1*S62ORhSfL8AOU86EY8AJfA.png",
  "https://miro.medium.com/max/1400/1*W-gFfCFKJafhI14mgfSliw.png",
  "https://miro.medium.com/max/1400/1*KpGt_XIwkyNWeEC2iE8u5w.png",
  "https://miro.medium.com/max/1400/1*bzK2jrc8SbhEK1WZLrP6bg.png",
  "https://miro.medium.com/max/1400/1*Wwk6-4nmXnC5qsB24vVoRw.png",
  "https://miro.medium.com/max/1400/1*2pWJo1FJrBKRiVRQtPEQHQ.png",
  "https://miro.medium.com/max/1400/1*TwYDxZRPx1mmfhTiWd2Dlw.png",
  "https://miro.medium.com/max/1400/1*47hVEI-8nE-dc6soSRDt6g.png",
  "https://miro.medium.com/max/418/1*RxEpppVk7FmcNuC5UlgYRw.png",
  "https://miro.medium.com/max/418/1*1GTPH9WHkdGMec7wA9598A.png",
  "https://miro.medium.com/max/418/1*8pOKdpBAFepgRRiKX1tz3Q.png",
  "https://miro.medium.com/max/626/1*sWxksD06-N1rWvFDIKDYnA.png",
  "https://miro.medium.com/max/1400/1*ufdZwi9ghP90hiKaM-DrZQ.png",
  "https://miro.medium.com/max/1400/1*V0yuny8U3Rd5gNobLxm3mw.png",
  "https://miro.medium.com/max/1400/1*ANHEJaEQ7fJb9UMJXm9CzA.png",
  "https://miro.medium.com/max/1400/1*5aK2ffI0NrcVOxasu-OTKg.png",
  "https://miro.medium.com/max/1400/1*dJH-i1SoOemsmf4wq4drtA.png",
  "https://miro.medium.com/max/1400/1*C7bF_mh8rwJwD3DuFGmLuw.png",
  "https://miro.medium.com/max/1400/1*tw5BDbEVvkD2aBytpnzrHQ.png",
  "https://miro.medium.com/max/626/1*-H7ymcTT4NMHBgksLHgctQ.png",
  "https://miro.medium.com/max/626/1*a9WX9ypRiD7Wl10b3EebRw.png",
  "https://miro.medium.com/max/2000/1*I56PM8UWOWTore1RGpH8rA.png",
  "https://miro.medium.com/max/2000/1*I56PM8UWOWTore1RGpH8rA.png",
  "https://miro.medium.com/max/2000/1*F86FJQenfGNMxJfHzEuoEg.png",
  "https://miro.medium.com/max/2000/1*Mk6kfB4G7HQZMz_B5BAtrg.png",
  "https://miro.medium.com/max/2000/1*stzONjLsZtI9kkdLrGooBw.png",
  "https://miro.medium.com/max/418/1*Hl6Q3QkvVsLr-cwSuP2tKQ.png",
  "https://miro.medium.com/max/418/1*K8DxmwBSVoMTJWAyJZHQVw.png",
  "https://miro.medium.com/max/418/1*TrzR8g4NcdD47rPioGHHtA.png",
  "https://miro.medium.com/max/418/1*DxhOm2LlqZrGKPu0fL5kcQ.png",
  "https://miro.medium.com/max/418/1*t7HqJZ2W2ApLK9TnDCNGXg.png",
  "https://miro.medium.com/max/418/1*mxtIfzklbL6vtlhsN84H3Q.png",
  "https://miro.medium.com/max/625/1*44EWQlcvoMuItsnswFzy0A.png",
  "https://miro.medium.com/max/625/1*7ST80NQwGGUf92EEOo7sMw.png",
  "https://miro.medium.com/max/625/1*hSkzJHUqIvb9GGmjh1PAZw.png",
  "https://miro.medium.com/max/625/1*JH1wH7wirMOyZ1B-dQyyjw.png",
  "https://miro.medium.com/max/418/1*G3VqJFk47n9Buv0eGubOdg.png",
  "https://miro.medium.com/max/418/1*Y3L2G0PenQwjagnupf60OQ.png",
  "https://miro.medium.com/max/418/1*7HSnOKSnxrfncdFwzD9nMQ.png",
  "https://miro.medium.com/max/418/1*h2fJv7sceIqW9BWEXKOMoA.png",
  "https://miro.medium.com/max/418/1*V0yuny8U3Rd5gNobLxm3mw.png",
  "https://miro.medium.com/max/418/1*OOXfyeD2X6aap7PdgGgzuA.png",
  "https://miro.medium.com/max/418/1*iLmIDIx4Eu7tAKl3zl4V0g.png",
  "https://miro.medium.com/max/418/1*8WGH-3nF-SDgZB3Zv8_cOw.png",
  "https://miro.medium.com/max/418/1*rJOWh7T6pPWgfBWrXAojig.png",
  "https://miro.medium.com/max/418/1*sJg-BU37Ue_R8tLwTykwrg.png",
  "https://miro.medium.com/max/418/1*BeCr6-1Q8a9uFkGDdpgk8Q.png",
  "https://miro.medium.com/max/418/1*yXn_X0nTrMREdm-28GB3lQ.png",
  "https://miro.medium.com/max/418/1*jSF6fOy_wTn7gVciif0lSw.png",
  "https://miro.medium.com/max/418/1*mntxe45wSV7s6yoASE96yw.png",
  "https://miro.medium.com/max/418/1*EyFaAackKIYGf8dI9noq1Q.png",
  "https://miro.medium.com/max/418/1*4n4HDh7eDkNsIvLmtRSx-A.png",
  "https://miro.medium.com/max/418/1*FiPJNKcC1-RGUa52ZIXQuQ.png",
  "https://miro.medium.com/max/418/1*SBV71u6JraCle89dDGYMJw.png",
  "https://miro.medium.com/max/418/1*IC4xorFa_EayWzW8e2dozA.png",
  "https://miro.medium.com/max/418/1*C7qsgTD6dqIWiDwyBTeXHg.png",
  "https://miro.medium.com/max/418/1*dJH-i1SoOemsmf4wq4drtA.png",
  "https://miro.medium.com/max/418/1*VItMCrvtU92RSM6HM74A8Q.png",
  "https://miro.medium.com/max/418/1*dD2fSGv6sOst7leEbyELXQ.png",
  "https://miro.medium.com/max/418/1*yZ10D3Il7-bweyeqxeTiHg.png",
  "https://miro.medium.com/max/418/1*52rWsPiPj89qc7s-rEzsNg.png",
  "https://miro.medium.com/max/418/1*O9DlkOKPOaTIf3U8tjCuzw.png",
  "https://miro.medium.com/max/626/1*0bt579C3ppBVWiLk4UFufg.png",
  "https://miro.medium.com/max/626/1*C7bF_mh8rwJwD3DuFGmLuw.png",
  "https://miro.medium.com/max/626/1*-H7ymcTT4NMHBgksLHgctQ.png",
  "https://miro.medium.com/max/626/1*a9WX9ypRiD7Wl10b3EebRw.png",
];
