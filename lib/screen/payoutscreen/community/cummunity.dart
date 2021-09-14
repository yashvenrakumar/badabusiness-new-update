import 'package:badabusiness/screen/registration/payment.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

import 'cummunityfull.dart';

class Community extends StatefulWidget {
  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
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
              pinned: true,
              expandedHeight: 140.0,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Image.asset(
                    "assets/images/i29.png",
                    fit: BoxFit.fill,
                  )),
              backgroundColor: Colors.white,
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 700,
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('community')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: CircularProgressIndicator()
                            //Text('Error: ${snapshot.error}'),
                            );
                      }
                      return Container(
                        color: Colors.white,
                        child: ListView(
                          scrollDirection: Axis.vertical,
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
                                      builder: (context) =>
                                          Cfull(url, link, name, des)));
                                },
                                child: Card(
                                  child: Container(
                                    color: Colors.white,
                                    margin: EdgeInsets.all(15),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Center(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                child: Container(
                                                    height: 220,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Opacity(
                                                        opacity: .3,
                                                        child: Hero(
                                                          tag: "cummunity",
                                                          child: Image.network(
                                                            url,
                                                            fit:
                                                                BoxFit.fitWidth,
                                                          ),
                                                        ))),
                                              ),
                                            ),
                                            Center(
                                              child: Container(
                                                margin: EdgeInsets.all(20),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  child: Container(
                                                    height: 180,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Hero(
                                                      tag: url,
                                                      child: new FadeInImage(
                                                        image: new NetworkImage(
                                                            url),
                                                        fit: BoxFit.fill,
                                                        placeholder:
                                                            new AssetImage(
                                                          "assets/lo.gif",
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          name,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Paymentt()));
                                            },
                                            child: Container(
                                              margin: EdgeInsets.all(6),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: [
                                                        Colors.green.shade100,
                                                        Colors.green.shade200,
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
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ))),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class Community extends StatefulWidget {
//   @override
//   _CommunityState createState() => _CommunityState();
// }

// class _CommunityState extends State<Community> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body:
//     );
//   }
// }

//       body: StreamBuilder<QuerySnapshot>(
//           stream: Firestore.instance.collection('notify').snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text('Error: ${snapshot.error}'),
//               );
//             }
//             return GridView.count(
//               crossAxisCount: 1,
//               childAspectRatio: 2 / 2.2,
//               scrollDirection: Axis.vertical,
//               children: snapshot.data.documents
//                   .map<Widget>((DocumentSnapshot document) {
//                 // String namee = document['url'];
//                 // String name = document['name'];
//                 // String url = document['url'];
//                 // String link = document['link'];
//                 // String name = document['name'];
//                 // String des = document['des'];

//                 return InkWell(
//                   onTap: () {
//                     // _register();
//                     // getMessage();
//                     // Navigator.of(context).push(MaterialPageRoute(
//                     //     builder: (context) => Notifull(url, link, name, des)));
//                   },

//                 );
//                 // return Container(
//                 //   color: Colors.amber,
//                 //   margin: EdgeInsets.all(4),

//                 //   child: InkWell(
//                 //     onTap: () {
//                 //  },
//                 //     child: new Hero(
//                 //       tag: url,
//                 //       child: new FadeInImage(
//                 //         image: new NetworkImage(url),
//                 //         fit: BoxFit.fill,
//                 //         placeholder: new AssetImage("assets/vb.jpg"),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // );
//               }).toList(),
//             );
//           }),
//     );
//   }
// }

// _register();
// getMessage();
// Navigator.of(context).push(MaterialPageRoute(
//     builder: (context) => Notifull(url, link, name, des)));

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
            builder: (BuildContext context) => WebViewContainer(
                  widget.url,
                ))));
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

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
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
                        javascriptMode: JavascriptMode.disabled,
                        //gestureRecognizers: true,
                        // onWebResourceError: false,
                        initialUrl: _url,
                        onWebViewCreated:
                            (WebViewController webViewController) {
                          _controller.complete(webViewController);
                        },

                        gestureNavigationEnabled: true,
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
