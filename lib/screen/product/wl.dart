import 'dart:async';
import 'package:badabusiness/screen/payoutscreen/others/fullimage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Wl extends StatelessWidget {
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
                          builder: (context) => Full(wll[index])));
                    },
                    child: Hero(
                      tag: wll[index],
                      child: FadeInImage(
                        image: new NetworkImage(wll[index]),
                        fit: BoxFit.fill,
                        placeholder: new AssetImage(
                          "assets/lo.gif",
                        ),
                      ),
                    ),
                  ),
                ),
                childCount: wll.length,
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
              "assets/6.png.png",
              fit: BoxFit.cover,
            ),
            Center(
              child: Opacity(
                opacity: shrinkOffset / expandedHeight,
                child: Text(
                  "White -Labelling",
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
                          child: Image.asset("assets/images/i14.png")),
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

List<String> wll = [
  "https://miro.medium.com/max/1000/1*OqDWFETtW-qr6CC2fCmOjw.png",
  "https://miro.medium.com/max/1000/1*HU_QavdIvjlLtAkVa9yWxw.png",
  "https://miro.medium.com/max/1000/1*XJDmuTm_Mcf4e5C0J5mkYA.png",
  "https://miro.medium.com/max/1000/1*DrwzpOq9nScdKkFK8TtpLA.png",
  "https://miro.medium.com/max/1000/1*nRm2gqcRO7UuQY2mqrYCzQ.png",
  "https://miro.medium.com/max/1000/1*kEzCK2loPQEwLwbO34vf5g.png",
  "https://miro.medium.com/max/1000/1*JzUbIvl-ETVm2yLkSEjMFA.png",
  "https://miro.medium.com/max/1000/1*8AE2kQVLFxJW8vEicIkqTQ.png",
  "https://miro.medium.com/max/1000/1*XFoz96lm4LIQdUIfYxjIyw.png",
  "https://miro.medium.com/max/418/1*RYTFUm0NMWWu2Ak3JYnQow.png",
  "https://miro.medium.com/max/418/1*fMexLkr0WdcJdfJpZlUrGg.png",
  "https://miro.medium.com/max/418/1*fMexLkr0WdcJdfJpZlUrGg.png",
  "https://miro.medium.com/max/418/1*536ZCAzfz5F3Ulm2ZhyoEg.png",
  "https://miro.medium.com/max/418/1*fMexLkr0WdcJdfJpZlUrGg.png",
  "https://miro.medium.com/max/418/1*536ZCAzfz5F3Ulm2ZhyoEg.png",
  "https://miro.medium.com/max/418/1*vN2-wmPj2noHd1KAY3m08w.png",
  "https://miro.medium.com/max/418/1*B9ujNk9kd_QuyV9WgiwELA.png",
  "https://miro.medium.com/max/418/1*uhl-IlMdUaq0djZb4IQS8w.png",
  "https://miro.medium.com/max/418/1*IAthHtcWuxyFNNv8vwJ62A.png",
  "https://miro.medium.com/max/418/1*sCW9-fyxG2nrLB8HXRaHtQ.png",
  "https://miro.medium.com/max/418/1*1dzgvR3qcAsXPCSr5vRm7w.png",
  "https://miro.medium.com/max/418/1*G9xhXcaGDvQ0Vq2_6N1Rdw.png",
  "https://miro.medium.com/max/418/1*pHtWUgsTNScDEicB4gVAyA.png",
  "https://miro.medium.com/max/418/1*j3JSYRc4S9vrU4rxB1kKww.png",
  "https://miro.medium.com/max/418/1*XNWW9bmEDHHJH8b1RJRUnQ.png",
  "https://miro.medium.com/max/418/1*NmVabFIEJTENNGPOKt2u5w.png",
  "https://miro.medium.com/max/418/1*tv7K0csSP1BV-ZTIPwE7yA.png",
  "https://miro.medium.com/max/418/1*AxyLxUY7M6VEgdB5dRYprw.png",
  "https://miro.medium.com/max/418/1*1be4a5ZJFCWNN20tHmgdLw.png",
  "https://miro.medium.com/max/418/1*GfJOcubhyr39J1S-kF7eCA.png",
  "https://miro.medium.com/max/418/1*Fz2cm65zt_YYSQrWktFGxA.png",
  "https://miro.medium.com/max/418/1*q4ohTR_CvEi_HLANC_O0dQ.png",
  "https://miro.medium.com/max/418/1*_AABwfDWXkHdIHrJgw9ybw.png",
  "https://miro.medium.com/max/418/1*gSB017HxYcMgQcubjoJIhA.png",
  "https://miro.medium.com/max/418/1*XKToYG38MKWciLh3_PbSxg.png",
  "https://miro.medium.com/max/418/1*BOSAm2Z6XYyEN4gzH225Mg.png",
  "https://miro.medium.com/max/418/1*Lon1vefJwNSdtLZmJ51JhA.png",
  "https://miro.medium.com/max/418/1*b30WFm5Ab7tMlFmDXB0CCw.png",
  "https://miro.medium.com/max/418/1*kdfZ0DmT7RHEkBIU-Fye4A.png",
  "https://miro.medium.com/max/418/1*nhaioak12yepdpRi422MIw.png",
  "https://miro.medium.com/max/418/1*CYe0U6Ps30DnUKqyLZwvBw.png",
  "https://miro.medium.com/max/418/1*V3OQH1duDsAO0fK2zsmhgA.png",
  "https://miro.medium.com/max/418/1*byW38u-8A64Lh_mVu4MbIA.png",
];
