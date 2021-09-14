// ignore: import_of_legacy_library_into_null_safe
import 'package:badabusiness/screen/payoutscreen/community/cummunity.dart';
import 'package:badabusiness/screen/payoutscreen/community/cummunityfull.dart';
import 'package:badabusiness/screen/registration/registration.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class Notifull extends StatefulWidget {
  String url;
  String link;
  String name;
  String des;
  String l2;
  String link2;
  String url2;
  String url3;
  String url4;

  Notifull(this.url, this.link, this.name, this.des, this.l2, this.link2,
      this.url2, this.url3, this.url4);

  @override
  _NotifullState createState() => _NotifullState();
}

class _NotifullState extends State<Notifull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          primary: true,
          slivers: <Widget>[
            SliverAppBar(
                backgroundColor: Colors.blue[50],
                iconTheme: IconThemeData(color: Colors.yellow),
                expandedHeight: 300,
                centerTitle: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    ' ',
                    style: TextStyle(
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
                  conn(context),
                  Card(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.center,
                                colors: <Color>[
                              Colors.yellow.shade100,
                              Colors.white
                            ])),
                        child: Container(
                            margin: EdgeInsets.only(
                                left: 25, bottom: 10, top: 10, right: 10),
                            child: Center(
                                child: Text(
                              widget.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ))),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      l2(widget.link2);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Registration()));
                    },
                    child: Card(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.yellow.shade50, Colors.white])),
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 25, bottom: 10, top: 10, right: 10),
                          child: Center(
                            child: Shimmer.fromColors(
                              baseColor: Colors.black,
                              highlightColor: Colors.yellow.shade400,
                              loop: 700,
                              enabled: true,
                              child: Text(
                                widget.l2,
                                //" Join Bada Business : Dr Vivek Bindra 8887694282 ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: ListTile(
                        onTap: () {
                          String link2 = widget.link2;

                          String name = widget.name;

                          _shareText(link2, name);
                        },
                        trailing: Icon(
                          Icons.share,
                          size: 30,
                          color: Colors.black,
                        ),
                        title: Text(
                          "Share with Friends , Family & Relatives",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w900),
                        ),
                        subtitle: Text(
                          "Dr Vivek Bindra +91 7549135542",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.center,
                                colors: <Color>[
                              Colors.yellow.shade100,
                              Colors.white
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      String url =
                          'https://www.badabusiness.com/dd/BIYK005702/';

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SplashScreen(url)));
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
                      String url =
                          'https://www.badabusiness.com/dd/BIYK005702/';

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SplashScreen(url)));
                    },
                    child: Center(
                      child: Container(
                          height: 200,
                          child: Image.asset(
                            "assets/images/logo.png",
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      String url =
                          'https://www.badabusiness.com/dd/BIYK005702/';

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SplashScreen(url)));
                    },
                    child:
                        Container(child: Image.asset("assets/images/i1.png")),
                  ),
                  Container(
                    child: Column(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Registration()));
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(widget.url2)),
                            )),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Registration()));
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(widget.url3)),
                            )),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Registration()));
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(widget.url4)),
                            )),
                      ],
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

l2(String link2) async {
  String url = '$link2';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

// ignore: unused_element
Future<void> _shareText(String link2, String name) async {
  try {
    Share.text(
        'Dr vivek bindra ',
        'Welcome in Bada Business  :: $link2  $name :: https://play.google.com/store/apps/details?id=com.yashvendra.kumar welcome in bada business pvt ltd https://www.badabusiness.com/dd/BIYK005702/ Bada Business Consutant  ',
        'text/plain');
  } catch (e) {
    print('error: $e');
  }
}
